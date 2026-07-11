---
name: upgrade-hugo
description: Safely moves the site to a newer version of Hugo, the tool that builds it. It checks the current pin against the latest stable, reviews what changed, and only with the owner's OK bumps the pin, installs the matching Hugo, and rebuilds to confirm nothing broke. Use when the owner wants to update or upgrade Hugo, asks whether there's a newer version, or a deploy failed because the pinned Hugo is out of date. Occasional maintenance, separate from everyday /publish.
disable-model-invocation: true
allowed-tools: Read, Edit, Grep, Glob, Bash(bash scripts/hugo-version.sh), Bash(gh api:*), Bash(curl:*), Bash(jq:*), Bash(hugo:*), Bash(brew upgrade:*), Bash(rg:*), Bash(grep:*)
---

<!-- Outline

Goal: move the site to a newer Hugo without breaking it. Do rigorous technical
work; report to the owner in plain language. They know Hugo only as "the tool that
builds my site." One gate: investigate freely, touch no file until they say go.

Stage 1 — Look before you touch (read-only)
1. Read the check: current pin, installed Hugo, latest stable. If already current, say so and stop.
2. Read what changed: pull release notes between current and latest; extract breaking changes,
   deprecations, image/asset-pipeline changes, notable features. Never dump the changelog at the owner.
3. Check whether it touches THIS site: grep the kit's build surfaces for anything flagged breaking
   or deprecated. Classify hits as mechanical (1:1 drop-in) vs needs-judgment (behavior change).
4. Roll up plainly + gate: current → new, what (if anything) is affected, a one-line recommendation.

Stage 2 — Make the change (only after the owner says go)
5. Bump the one pin: module.hugoVersion.min in hugo.yaml. Leave the `extended` flag as-is. Nothing else to edit.
6. Apply mechanical rewrites found in step 3, same pass. Hold judgment items for hand-off.
7. Install the matching Hugo locally (brew upgrade hugo; extended stays extended). The pin is now
   ahead of the installed binary, which only warns (never blocks the build) — match it so local
   runs the version the deploy will.
8. Rebuild the way the deploy will (hugo --gc --minify). If it fails, stop and offer to fix or revert.
9. Hand off: nothing is live until /publish, which installs the same version in the deploy
   automatically. List any judgment items. Don't commit or push — the everyday loop handles that.

-->

# Upgrade Hugo

Move the owner's site to a newer version of **Hugo**, the program that turns their content into the website. This is occasional maintenance, not the everyday loop — the pin only needs freshening every so often, or when a deploy fails because the pinned Hugo has fallen behind.

Two audiences share this skill. You do rigorous, well-checked work; you report to the **owner** in plain language. Skip the changelog and version-note jargon in what you show them, and translate the findings into what they mean for their site. There is exactly **one gate**: you may investigate as much as you like, but change no file until the owner has said go.

## Where things stand

As your first step, run these to see where things stand:

```bash
bash scripts/hugo-version.sh
hugo version
gh api repos/gohugoio/hugo/releases/latest --jq '.tag_name'
```

`scripts/hugo-version.sh` prints the kit's current pin; `hugo version` is what's installed (a "command not found" means Hugo isn't installed); the `gh api` call is the latest stable tag. If `gh` isn't available, get the latest with `curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -r '.tag_name'`.

---

## Stage 1 — Look before you touch

Everything here is read-only. The point is to arrive at the gate knowing whether this upgrade is boring (the common case) or has one small thing to handle.

### 1. Read the check

The pin is where the site is now; the latest stable is where it could go. If the pin already matches (or is newer than) the latest stable, there's nothing to do — tell the owner they're up to date and stop. Note that the pin is a *floor*: the owner's installed Hugo may already be newer than the pin, and that's fine.

### 2. Read what changed

Pull the release notes for each version between the current pin (exclusive) and the latest (inclusive):

```bash
gh api repos/gohugoio/hugo/releases/tags/vX.Y.Z --jq '.body'
```

If `gh` isn't available, use `curl -s https://api.github.com/repos/gohugoio/hugo/releases/tags/vX.Y.Z | jq -r '.body'`. If the gap is large (more than ~10 releases), concentrate on the most recent ones plus anything marked breaking.

Read them yourself and pull out what matters for a Hugo site like this one:

- **Breaking changes** — removed or renamed template functions, changed behavior, dropped config keys.
- **Deprecations** — things still working today but on the way out.
- **Image & asset pipeline** — changes to image processing (WebP, resizing) or the CSS/JS pipes, since those are the parts of Hugo this kit leans on most.
- **Notable new features** — worth a one-line mention if genuinely useful; skip the rest.

### 3. Check whether it touches this site

The kit uses a small, stable slice of Hugo, so most upgrades touch nothing here. Confirm that rather than assume it. For anything you flagged as breaking or deprecated, pull out the affected token and search the build surfaces that could use it:

```bash
rg -in '<token1>|<token2>' layouts/ hugo.yaml assets/
```

Where to look, and why:

- **`layouts/`** — the templates. The parts most likely to touch a changed API are the **image pipeline** (`layouts/partials/image.html`, `layouts/shortcodes/image.html`, `layouts/_default/_markup/render-image.html`) and the **asset pipes** (`layouts/partials/pipes/style.html`, `pipes/script.html`).
- **`hugo.yaml`** — config keys that Hugo can rename or remove (`imaging`, `module`, `security`, menu setup).
- **`assets/`** — only if a hit points at SCSS/JS processing.

Classify each real hit:

- **Mechanical** — a 1:1 rename the changelog spells out, a safe drop-in. You'll apply these in step 6.
- **Needs judgment** — a behavior change or a removal with no clean replacement. You'll surface these to the owner at hand-off, never auto-apply them.

### 4. Roll up and gate

Summarize for the owner in plain terms — no version-note jargon:

> Right now your site builds with Hugo **X.Y.Z**. The latest is **A.B.C**. I checked what changed and **nothing your site uses is affected** — this is a safe, routine update. Want me to go ahead?

If step 3 did find something, say so just as plainly ("one small thing needs a tweak, which I'll handle") and note anything that needs their judgment. Offer the natural choices: update to the **latest**, pick a **specific earlier version**, or **not now**. Change nothing until they answer. "Not now" ends the skill with zero edits.

---

## Stage 2 — Make the change

Only after the owner says go.

### 5. Bump the pin

Edit **`hugo.yaml`**: under `module.hugoVersion`, change `min:` to the chosen version. Leave the `extended` flag exactly as it is. This one line is the whole pin — `scripts/hugo-version.sh` reads it and the deploy installs from it, so there is nothing else to change. Don't touch workflows, and don't reformat unrelated lines.

### 6. Apply the mechanical rewrites

Apply every hit you classified as mechanical in step 3, in this same pass, so the pin and the code that depends on it move together. List them for the owner first, then make the edits — don't ask per-fix, the step 4 gate was the only gate. Hold the needs-judgment items for hand-off.

### 7. Install the matching Hugo

The pin now names a version newer than what's installed. Hugo still builds — a version below the pin is a warning, not an error — but you'd be testing an older Hugo than the deploy runs. Bring the local binary up to the pin so local matches the deploy and the warning clears (`brew upgrade` keeps you on the extended edition, so your images stay WebP):

```bash
brew upgrade hugo
```

If Homebrew isn't set up, take the same posture as `/setup`: point the owner at the official downloads (<https://gohugo.io/installation/>, **extended** edition recommended) and continue once a fresh `hugo version` shows the new version. Confirm it reads the new version before moving on; staying on the extended edition keeps images as WebP, but the build works either way.

### 8. Rebuild to confirm

Build the way the live deploy will, so a green build here means a green deploy:

```bash
hugo --gc --minify
```

If it **fails**, stop. Show the owner the problem in plain language and don't leave them with a version their machine can't build — offer to fix the cause or to revert the bump in `hugo.yaml`. If it **passes**, say so, and if a preview server was running, restart it so they can see the site still looks right.

### 9. Hand off

Tell the owner plainly what happened and what's next:

> Done — your site now builds with Hugo **A.B.C**, and the rebuild passed cleanly. Nothing is live yet; the new version goes out the next time you publish. Just say *publish* (or run `/publish`) when you're ready.

When they publish, the deploy installs this same version automatically from the pin, so local and live stay in step. List any **needs-judgment** items from step 3 for them to decide on. Don't commit or push here — the everyday checkpoint-and-`/publish` loop handles that.

## Notes

- **Occasional, not everyday.** This freshens the tool that builds the site. Day-to-day edits and going live are `/publish`; this is separate.
- **One pin, one edit.** `module.hugoVersion.min` in `hugo.yaml` is the only version to change. CI reads it through `scripts/hugo-version.sh`; there is no second copy to keep in sync.
- **Extended is the recommended default, not a hard requirement.** The extended edition encodes WebP; without it the image pipeline falls back to the original format and the build still succeeds (`layouts/partials/image.html`). So `hugo.yaml` sets `extended: false` — leave it there, don't flip it to `true`. Do keep the installed binary on extended where you can (`brew upgrade` does this automatically), so the owner keeps the smaller WebP images.
