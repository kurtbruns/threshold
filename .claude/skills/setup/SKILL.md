---
name: setup
description: First-run setup for a freshly downloaded copy of the kit. Checks for the tools the site needs, guides installing anything missing, initializes version control, and starts the preview so the owner can see their site. Run right after downloading the kit, when the owner says "set up" or "get started", or when the preview won't run.
disable-model-invocation: true
allowed-tools: Read, Edit, Write, Bash(git init:*), Bash(git add:*), Bash(git commit:*), Bash(hugo:*)
---

<!-- Outline

Goal: take a freshly downloaded copy from nothing to a running preview, in as
few visible steps as possible. Land the owner at a site they can see, ready to
give their first instruction. Keep it friendly and plain; the owner may be
setting up a dev environment for the first time.

1. Take stock (a quick, visible check)
   - Detect OS, and whether Hugo (extended), Git, and Homebrew are present.
     These are read-only checks Claude can run directly (command -v, git
     --version, uname), so they need no extra permission.
   - Detect whether the project is a git repo yet (a ZIP download won't be; a
     "Use this template" clone already is)

2. Install what's missing (macOS for now; the owner runs the install)
   - Recommended path is Homebrew (the same installer handles gh when you launch
     later). Installing needs an admin/sudo step, so Claude gives the exact
     command and the owner runs it in their own Terminal rather than Claude
     running it.
   - Hugo must be the *extended* edition (WebP image encoding)
   - Alternatives: the no-terminal install guide; point non-macOS owners at the
     official install docs

3. Start saving (version control, quietly)
   - Only if not already a repo: git init, then a first commit that captures the
     base state (the diff-able starting point; makes later "undo" work)
   - This is the owner's automatic Save history; set it up here, don't teach it

4. Start the preview
   - Run the dev server in the background; confirm it's up and share the link
   - If the build fails, fix it before handing back

5. Hand off
   - Invite the first real instruction and stop
   - Natural next step: /personalize (make it yours). Later: going live with /launch

 -->

# Set up your site

_(To be fleshed out.)_
