---
name: nuclear
description: Clears the demo content back to a blank slate so the owner can start fresh with their own site, keeping the engine, look, and setup intact. Detects an in-use site first (a launch marker or substantial owner content) and confirms harder if found; makes a recovery checkpoint; then clears the example home (to a blank "Welcome 🚪"), about, blog, and the onboarding guide pages, neutralizes the site identity, and clears the launch marker. Keeps layouts, assets, config, and .claude context. Use when the owner wants to start over, clear the demo content, or reset the site. Requires an explicit yes; leaves git history and the recovery checkpoint untouched. disable-model-invocation so it only runs when the owner asks.
disable-model-invocation: true
allowed-tools: Read, Edit, Write, Bash(git add:*), Bash(git commit:*), Bash(hugo:*)
---

<!-- Outline

- Check whether this is an in-use site before anything
    - Launch marker present (params.launch in hugo.yaml)? Substantial owner content?
    - If so: this is not the clear-the-demo case. Warn hard, spell out what's lost,
      require explicit confirmation (or bail)
- Describe exactly what will happen; this is destructive
    - Wait for an explicit yes/no
- Save first, so the reset is reversible
    - Commit anything pending as a recovery checkpoint. A repo already exists
      after /setup, so there's no git-init branch. Frame it to the owner plainly
      as a point they can undo back to.
- Clear the demo content
    - Home (reset to a blank page that says "Welcome 🚪")
    - About
    - Blog
    - The onboarding guide pages (content/pages) — a fresh personal site drops them;
      the owner can still ask Claude for help, and the checkpoint preserves them
- Neutralize the site identity (title, description) and clear the launch marker
  (params.launch in hugo.yaml) — a reset site is un-launched
- Keep the engine, look, and context (layouts, assets, config, .claude)
- Verify the build and hand back, telling the owner plainly how to undo this
  (restore from the recovery checkpoint)

 -->
