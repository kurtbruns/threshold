---
name: nuclear
description: Resets the site to a true blank canvas so the owner can start fresh: deletes the demo pages (About, blog, onboarding guides), blanks the home page, strips the layout back to bare content, and neutralizes the site's identity and launch marker. The engine, styles, config, and .claude context stay, and a recovery checkpoint is saved first so nothing is lost. Use when the owner wants to start over, clear the demo, wipe the example content, or reset the site to nothing.
disable-model-invocation: true
allowed-tools: Read, Edit, Write, Bash(git status:*), Bash(git rm:*), Bash(git add:*), Bash(git commit:*), Bash(hugo:*)
---

# Reset to a blank canvas

Clear the shipped demo — the pages, the home content, and the header and footer — back to a bare, buildable site, so the owner can build their own from nothing. Everything that makes the kit work stays: the asset and image pipeline, the styles, the config, the scripts, and the `.claude` context. Only the example content and the visible layout come off.

Two things are true at once, so hold both. This **deletes real files**, which is why there is exactly **one gate**: you say what will happen and change nothing until the owner says go. And it is **reversible**: you save a recovery checkpoint before touching anything, so any of it can come back. Report to the owner in plain language throughout — they think in *the site*, *pages*, and *Save*, not in files and commits.

## Where things stand

```!
echo "Launch marker:   $(grep -qE '^[[:space:]]+launch:' hugo.yaml 2>/dev/null && echo 'present — the site has been launched' || echo 'none — the site is not launched')"
echo "Site title:      $(awk -F'"' '/^title:/{print $2; exit}' hugo.yaml 2>/dev/null)"
echo "Commits so far:  $(git rev-list --count HEAD 2>/dev/null || echo '?')"
echo "Uncommitted:     $(git status --porcelain 2>/dev/null | wc -l | tr -d ' ') file(s) with pending changes"
```

## 1. Size up the site

Everything here is read-only. The point is to know, before the gate, whether this is someone clearing the demo (the common case) or someone wiping real work — because that changes how hard you warn, not whether you add a second gate.

Read the check, then glance at `content/` to judge which it is:

- **Still the demo.** The `Site title` is `Threshold`, there's no launch marker, few commits, and `content/` still holds the shipped example (an About page that says "example About page", the two demo blog posts, the demo home page). This is the common case: clearing the demo to begin.
- **Real work.** A launch marker is present (the site is live), and/or the title is the owner's, there are many commits, and `content/` carries their own pages, home page, or posts. Treat this as high-stakes.

## 2. Confirm once, plainly

This is the one gate. Say exactly what will happen and wait for an explicit yes or no. Nothing is touched until they answer, and a "no" ends the skill with zero changes.

For a **demo** site, keep it light but clear:

> Running this clears the demo back to a blank canvas — it removes the About page, the blog, and the guide pages, empties the home page, and strips the header and footer off the layout. Your styles, settings, and everything under the hood stay. I'll save a checkpoint first so I can bring it all back if you change your mind. Want me to go ahead?

For a site with **real work**, escalate the same gate — spell out concretely what's lost, and require an explicit yes:

> Heads up: this is a full reset, and you've got real work here. It will delete [their pages / their home page / N blog posts] and strip the layout back to blank[, and it treats the site as un-launched again, so you'd re-launch to put a new site online]. It's all saved to a checkpoint first, so it's recoverable, but this wipes the site back to nothing. Are you sure you want to reset everything?

Adapt the bracketed parts to what step 1 actually found. Only continue on a clear yes.

## 3. Save a recovery checkpoint

Before removing anything, save the current state so the reset is reversible:

```bash
git add -A
git commit -m "Checkpoint before reset"
```

If the check showed no pending changes, there's nothing new to commit and the latest save is already the recovery point. Either way, the commit just before the reset is where "undo" returns to. This is the owner's safety net; frame it to them as exactly that, a point you can restore from.

## 4. Clear the demo content

Remove the example pages. `git rm` stages the deletion, and the checkpoint from step 3 preserves them, so a fresh personal site drops them cleanly:

```bash
git rm -r content/about content/blog content/pages
```

On a re-run or a partly-cleared site, some of these may already be gone — remove whichever still exist and move on.

Then blank the home page. Replace the whole of `content/_index.md` with a bare welcome:

```markdown
---
title: "Home"
---

# Welcome 🚪
```

## 5. Strip the layout to a blank canvas

Take the header and footer out of the page shell. In `layouts/_default/baseof.html`, remove the two partial calls so only the main content and the style/script pipeline remain:

```html
<body>
  <main class="site-main">
    {{- block "main" . }}{{ .Content }}{{ end -}}
  </main>

  {{- partialCached "pipes/script.html" . -}}
</body>
```

Then delete the now-unused partials. Nothing else references them, and the checkpoint brings them back if the owner wants a header or nav later:

```bash
git rm layouts/partials/header.html layouts/partials/footer.html layouts/partials/logo.html layouts/partials/nav.html
```

Leave the theme's CSS alone. The header, nav, and footer rules under `assets/css/` simply go unused now; they're harmless, and keeping them means the styling is ready if the owner adds a layout back.

## 6. Neutralize the identity and clear the launch marker

In `hugo.yaml`, take off the Threshold-specific identity so the reset site doesn't claim to be the kit, and clear the launch marker so it reads as not yet online:

- Set `title` to a neutral placeholder: `"My Site"`.
- Set `params.description` to a neutral placeholder: `"A personal website."` (it currently names Threshold).
- If a `params.launch:` block is present, remove it. A reset site is un-launched, and clearing the marker is what makes `/publish` and `/launch` read that correctly. If there was no marker, there's nothing to do here.

These are placeholders for the owner to make their own later. Leave everything else in `hugo.yaml` as it is — the version pin, the image settings, and the rest are the engine.

## 7. Verify, save the reset, and hand off

Build the way the deploy will, to confirm the stripped-down site still compiles:

```bash
hugo --gc --minify
```

If it fails, stop and fix the cause before saving — don't leave the owner on a site that won't build. If it passes, save the reset as its own checkpoint:

```bash
git add -A
git commit -m "Reset site to a blank canvas"
```

Then hand back in plain language. Nothing has been pushed; this is all local, and if the site was live it stays as it was online until the owner launches or publishes again:

> Done — your site is a blank canvas now. The demo pages, the home content, and the header and footer are gone, and everything that builds the site is still in place. Everything you had is saved in the checkpoint right before this, so if you want any of it back, just say the word. When you're ready, tell me what you'd like to build.

If a preview server was running, refresh or restart it so the owner sees the empty page rather than a stale one.

## Notes

- **One gate, then it's automatic.** The step 2 confirmation is the only place to ask. After a yes, work straight through — the removals and edits don't each need approval.
- **What stays.** The asset and image pipeline, all styles under `assets/`, the render hooks, `hugo.yaml`'s engine settings, the scripts, and the whole `.claude` context (skills, `CLAUDE.md`, permissions). `/nuclear` clears the demo and the visible layout, never the machinery.
- **Reversible by design.** History is never rewritten, so the recovery checkpoint stays in the trail. To undo, restore the site from the checkpoint saved just before the reset.
- **Local only.** This never pushes. A reset site reads as un-launched; the owner runs `/launch` to put a new site online, or `/publish` once they've launched.
