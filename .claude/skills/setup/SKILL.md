---
name: setup
description: First-run setup for a freshly downloaded copy of the kit. Checks for the tools the site needs, guides installing anything missing, initializes version control, and starts the live preview so the owner can see their site. Run right after downloading the kit, when the owner says "set up" or "get started", or when the preview won't run.
disable-model-invocation: true
allowed-tools: Read, Edit, Write, Bash(git init:*), Bash(git add:*), Bash(git commit:*), Bash(hugo:*)
---

<!-- Outline

Goal: take a freshly downloaded copy from nothing to a running live preview, in as
few visible steps as possible. Land the owner at a site they can see, ready to give
their first instruction. Owner may never have used a terminal — friendly and plain.

1. Take stock
   - Detect OS, and whether Hugo (extended), Git, and Homebrew are present
   - Detect whether the project is a git repo yet (a ZIP download won't be)

2. Install what's missing (macOS for now)
   - Recommended path is Homebrew (also sets up `gh` for /launch later)
   - Hugo must be the *extended* edition (WebP image encoding)
   - Escape hatches: owner pastes a command in their own Terminal; or the no-terminal
     install guide
   - Point non-macOS owners at the official install docs

3. Initialize version control (quietly)
   - Only if not already a repo; enables checkpoints, /publish, and the pre-push safety net

4. Start the live preview
   - Run the dev server in the background; confirm it's up and share the link
   - If the build fails, fix it before handing back

5. Hand off
   - Invite the first real instruction and stop
   - Optional, only if asked: going live later (/launch), the built-in guide

-->

# Set up your site

_(To be fleshed out.)_
