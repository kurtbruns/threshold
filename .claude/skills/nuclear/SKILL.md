---
name: nuclear
description: Resets the site to a true blank canvas so the owner can start fresh. Deletes the demo pages (About, blog, onboarding guides), blanks the home page, neutralizes the site identity and launch marker, and strips the layout by removing the header and footer; the engine, styles, config, and .claude context stay. Makes a recovery checkpoint first and asks for one explicit confirmation. Use when the owner wants to start over, clear the demo, or reset the site.
disable-model-invocation: true
allowed-tools: Read, Edit, Write, Bash(git rm:*), Bash(git add:*), Bash(git commit:*), Bash(hugo:*)
---

<!-- Outline

- Check whether this is an in-use site before anything
    - Launch marker present (params.launch in hugo.yaml)? Substantial owner content?
    - This decides how hard the single confirmation warns, not whether to add a
      second gate.
- Confirm once, plainly, before touching anything; this is destructive
    - Describe exactly what will happen and wait for an explicit yes/no.
    - If the site looks in-use, escalate the same gate: spell out what's lost and
      require an explicit yes, or bail. Still one confirmation, just harder.
- Save first, so the reset is reversible
    - Commit anything pending as a recovery checkpoint. A repo already exists
      after /setup, so there's no git-init branch. Frame it to the owner plainly
      as a point they can undo back to.
- Clear the demo content
    - Delete the About page, the blog, and the onboarding guide pages
      (content/pages) with git rm; a fresh personal site drops them, and the
      checkpoint preserves them.
    - Reset the home page to a blank page that says "Welcome 🚪".
- Strip the layout to a blank canvas
    - Edit layouts/_default/baseof.html to remove the header and footer, leaving
      just the main content and the style/script pipeline.
    - Delete the now-unused partials (header.html, footer.html, logo.html,
      nav.html) with git rm; the checkpoint brings them back if the owner wants
      a nav later.
- Neutralize the site identity (title, description) and clear the launch marker
  (params.launch in hugo.yaml); a reset site is un-launched
- Keep the engine and setup: the asset/image pipeline, config, .claude, and the
  theme's CSS (unused header/nav rules are harmless)
- Verify the build and hand back, telling the owner plainly how to undo this
  (restore from the recovery checkpoint)

 -->
