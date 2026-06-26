---
name: setup
description: First-run setup — gets a freshly downloaded copy of the site ready to use. Checks for Hugo and Git, guides installing anything missing (macOS / Homebrew), quietly initializes the project, and starts the live preview so the owner can begin. Use right after downloading the kit, when the owner says "set up" or "get started", or when the preview won't run. disable-model-invocation so it only runs when the owner asks.
disable-model-invocation: true
allowed-tools: Read, Edit, Write, Bash(git init:*), Bash(git add:*), Bash(git commit:*), Bash(hugo:*)
---

# Set up your site

Get a freshly downloaded copy of Threshold from nothing to a **live preview** the
owner can see, in as few visible steps as possible. The goal is to land them at a
running site, ready to give their first instruction — not to walk them through a
checklist. Do the work; narrate only what they need to know.

Keep it friendly and plain — the owner may never have used a terminal. macOS only
for now; if they're on another OS, say so and point them at the install docs
(<https://gohugo.io/installation/>, **extended** edition).

## What's already installed

```!
echo "macOS:  $(sw_vers -productVersion 2>/dev/null || echo 'not macOS')"
echo "git:    $(git --version 2>/dev/null || echo 'NOT INSTALLED')"
echo "hugo:   $(hugo version 2>/dev/null || echo 'NOT INSTALLED')"
echo "brew:   $(brew --version 2>/dev/null | head -1 || echo 'not installed')"
echo "repo:   $(git rev-parse --is-inside-work-tree >/dev/null 2>&1 && echo 'git initialized' || echo 'not a git repo yet')"
```

## 1. Read the check above

That report is the current state of the machine. Two things to watch for:

- **Hugo must be the _extended_ edition** — the `hugo` line should contain the word
  `extended` (e.g. `hugo v0.x.x+extended …`). The kit encodes WebP images, which only
  the extended edition can do. If Hugo is missing _or_ not extended, treat it as missing.
- **A ZIP download has no Git history** (`repo: not a git repo yet`). That's expected —
  step 3 fixes it.

If both Hugo (extended) and Git are present, skip to step 3.

## 2. Install anything missing (macOS)

Guide the **Homebrew** path, with a no-terminal escape hatch. Don't pile on options.

**Hugo (extended):**

- **Homebrew is present** → install it yourself; Homebrew's Hugo is extended:
  ```bash
  brew install hugo
  ```
- **Homebrew is missing** → it can't be installed for them: the installer asks for the
  Mac password at an interactive prompt this tool can't answer (and `sudo` is blocked by
  the project's safety rules). Give the owner the official command to **paste into their
  own Terminal**, then wait for them to say it's done:
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
  When Homebrew is ready, run `brew install hugo` yourself.
- **Prefer not to touch a terminal?** Point them to the official guide and have them choose
  the **extended** edition: <https://gohugo.io/installation/>. Continue once `hugo version`
  shows up in a fresh check.

**Git** is almost always already on macOS. If it's genuinely missing, the quickest fix is
Apple's command-line tools — have the owner run `xcode-select --install` (a system dialog
walks them through it), or `brew install git` if Homebrew is set up.

Re-run the checks from the top to confirm everything resolved before moving on.

## 3. Initialize the project (quietly)

If the check said **not a git repo yet**, set it up — no fanfare, the owner doesn't need a
lesson on version control. This is what makes `/publish` and the safety net before pushing
work later. The `.gitignore` is already in place, so the first commit stays clean:

```bash
git init && git add -A && git commit -m "Initial commit"
```

If it's already a git repo, leave it alone.

## 4. Start the live preview

This is the point of the whole exercise — get them looking at their site. Start the dev
server **in the background** so it keeps running while you talk:

```bash
hugo server
```

It serves at **http://localhost:1313/** by default. Confirm it's up and share the link. If
the build fails instead, show the error in plain language and fix it before continuing —
don't hand back a broken site.

## 5. Hand off

You've done your job once they can see the site. Invite the first real instruction and stop:

> Your site is live at **http://localhost:1313/**. Tell me what you'd like to do first —
> for example *"rename the site to Maria's Kitchen,"* *"write an About page about me,"* or
> *"clear the demo content for a clean slate"* (`/nuclear`).

Optional, only if they ask — don't push these:

- **Go live when ready.** Putting the site on the internet is a one-time step. When they're
  ready, they can run `/launch` and it walks them through getting onto GitHub and connecting
  a host. Until then, everything works locally.
- **Read the built-in guide.** The site they're previewing _is_ a short tour — **Getting
  started**, **Writing**, and **Personalizing**.

## If something goes wrong

Explain what failed in everyday words, not error codes. If a fix isn't obvious, offer to
help them report it so it can be looked into — and link the relevant install docs
(<https://gohugo.io/installation/>). Never leave them stuck without a next step.
