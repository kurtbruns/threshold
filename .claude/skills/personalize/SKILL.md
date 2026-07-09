---
name: personalize
description: Guides the owner through making the site theirs, from the name and tagline to colors, layout, fonts, icons, logo, and favicon, offering options and previewing as they go. Use for first-run personalization after /setup, or whenever the owner wants to make the site their own.
disable-model-invocation: true
allowed-tools: Read, Edit, Write, Bash(git add:*), Bash(git commit:*), Bash(bash .claude/skills/personalize/scripts/fetch-google-font.sh:*)
---

<!-- Outline

- The make-it-yours flow: a guided first-run pass through the owner's look and identity.
  Embodies the seed: offer options, preview, follow their taste; never impose a look.
- Open with a one-line orientation, then take one choice at a time (don't re-teach the
  Personalize page; just proceed).
- Walk the choices, offering options and previewing each:
    - Name and tagline (hugo.yaml)
    - Layout (the overall arrangement: content width, structure). Offer a few options,
      or work from a reference or a sketch the owner shows you; preview.
    - Colors (assets/css/variables.css: the token variables; light + dark)
    - Fonts: browse Google Fonts with the owner, then run the bundled
      scripts/fetch-google-font.sh to download and self-host the pick, and set
      --font-body / --font-heading in variables.css (no calls to Google at runtime)
    - Icons: browse Material Symbols, pull the chosen SVGs into assets/, and use them,
      self-hosted and following currentColor like the logo
    - Logo and favicon (assets/icons/logo.svg, assets/favicons/)
- Let them skip or defer any choice: encouragement, not a gate.
- Commit after each accepted change (the quiet, automatic checkpoint; the owner never
  thinks about it).
- Scope: the guided identity-setup moment, not a catch-all. Everyday tweaks
  ("make the links green") stay conversational.
- Hand off: invite them to keep going by talking, or to write their own words (see the
  Write guide). Point to /launch when they're ready to go live.

 -->
