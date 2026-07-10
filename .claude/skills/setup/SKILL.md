---
name: setup
description: Gets a freshly downloaded copy of the kit running. Checks for the tools the site needs, helps install anything missing, initializes version control, and starts the preview. Use right after downloading the kit, when the owner says "set up" or "get started", or when the preview won't run.
disable-model-invocation: true
allowed-tools: Read, Edit, Write, Bash(command -v:*), Bash(uname:*), Bash(git --version), Bash(git rev-parse:*), Bash(git init:*), Bash(git add:*), Bash(git commit:*), Bash(hugo:*), Bash(bash scripts/dev-hugo.sh:*), mcp__Claude_Preview__preview_start
---

# Set up your site

Take a freshly downloaded copy of the kit from nothing to a running preview, and leave the owner looking at a site they can see, ready for their first instruction. The owner may be setting up a development environment for the first time, so keep it friendly and plain, and say what each step is for.

Installing the tools is the one part the owner does themselves. Homebrew and the installers need an admin step and are deliberately not among this skill's tools, so hand over the exact command and have the owner run it in their own Terminal. Everything else, the checks, version control, and the preview, is yours.

## Take stock

Run a quick, read-only check of what's already here:

```!
echo "OS:            $(uname -s)"
echo "Hugo:          $(hugo version 2>/dev/null || echo 'not installed')"
echo "Git:           $(git --version 2>/dev/null || echo 'not installed')"
echo "Homebrew:      $(command -v brew >/dev/null 2>&1 && echo installed || echo 'not installed')"
echo "In a git repo: $(git rev-parse --is-inside-work-tree >/dev/null 2>&1 && echo yes || echo no)"
```

Read the results before acting:

- **Hugo** must be installed. The **extended** edition (its version line includes the word `extended`) is recommended — it lets the image pipeline output smaller WebP images — but isn't required; without it, images fall back to their original format and the build still succeeds.
- **Git** is needed for saving the owner's work and, later, publishing it.
- **Homebrew** is the recommended installer on macOS.
- **In a git repo** says whether saving is set up already: a "Use this template" clone is a repo; a downloaded ZIP is not.

## 1. Install what's missing

If Hugo or Git is missing, the owner installs it and you supply the commands. On macOS, Homebrew is the simplest path.

- If Homebrew itself is missing, point the owner to the one-line installer at [brew.sh](https://brew.sh/). It asks for their password, so they run it in their own Terminal.
- Then have them install the tools:
  ```
  brew install hugo git
  ```
  Homebrew's Hugo is the extended edition, which gives you the smaller WebP images.

Once they confirm the commands have run, re-run the stock check to make sure both tools are present. On Windows or Linux, point them to [Hugo's installation guide](https://gohugo.io/installation/) (the extended edition is recommended for WebP) and [Git's downloads](https://git-scm.com/downloads).

## 2. Set up saving

If the project isn't a git repo yet, initialize one so the owner has an undo history from the first moment:

```
git init
git add -A
git commit -m "Initial commit"
```

That first commit is the base state: the point "undo" can return to, and what the starter kit is diffed against. Do it quietly; there's no need to teach Git. If the project is already a repo (a template clone), leave its history alone and skip this.

## 3. Start the preview

Get the owner looking at their running site. Which path depends on where this session runs:

- **Desktop or web app:** the Claude Preview panel is available. Start the preview through it with the `Preview site (Hugo server)` config (from `.claude/launch.json`), so the site opens in a pane beside the chat instead of a background process the owner has to go find.
- **Terminal:** no panel exists, so run the dev server in the background and share the address it prints:
  ```
  bash scripts/dev-hugo.sh
  ```
  It usually serves at `http://localhost:1313`.

Either way, confirm the site actually comes up. If the build fails, fix it before going on; the owner should land on a working site, not an error.

## 4. Hand off

Tell the owner the site is running, where to see it (the preview pane beside the chat, or the address it's serving on in a terminal), and what they can do next, then stop and let them steer:

> Your site is running. Take a look at the preview, then tell me what you'd like to change.

## Notes

- **Nothing here is public or destructive,** so there's no confirmation step, and `/setup` is safe to run again anytime; it reads the environment rather than leaving a marker.
- **The owner runs the installs, not you.** The tool installers need an admin step and are kept out of this skill's tools by design; your part is to hand over the exact commands and verify the result.
