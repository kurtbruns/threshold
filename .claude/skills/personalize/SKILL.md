---
name: personalize
description: Guides the owner through making the site theirs, from its identity (name, logo, favicon) to its layout and its look (colors and fonts), offering options and previewing as they go. Use for first-run personalization after /setup, or whenever the owner wants to make the site their own.
disable-model-invocation: true
allowed-tools: Read, Edit, Write, Bash(git add:*), Bash(git commit:*), Bash(bash .claude/skills/personalize/scripts/fetch-google-font.sh:*)
---

# Make the site yours

Walk the owner through a guided pass over their site's look and identity, in three movements: its **identity** (name, tagline, logo, favicon), its **layout**, and its **look** (colors and fonts). This is the make-it-yours moment, usually right after `/setup`. For each choice, offer a few options, make the change, and show it in the preview, then let the owner react. The spirit is to follow their taste, never to impose a look.

This is the doing, not the teaching. Don't lecture the owner on what each choice is. Just move through them and make the changes. Every change here is a local edit and nothing goes public, so there is no confirmation step. Save each accepted change quietly as you go.

Take the three movements in order, but hold them loosely. The owner can skip any part, linger on one, or stop partway and come back later. Encourage, don't gate: a site with just a new name and logo is already more theirs than it was.

## 1. Identity

A good place to start is the name and logo: swapping the starter kit's own name and door mark for the owner's is the fastest way the site begins to feel like theirs. The rest is optional, so offer the pieces and follow the owner's lead.

- **Name and tagline.** Ask what they want the site called and how they'd describe it in a line, then set `title` and `params.description` in `hugo.yaml`.
- **Logo.** The header logo is `assets/icons/logo.svg`, the default door mark. Swap the file for the owner's own, or offer to draw one from their idea. It uses `currentColor`, so it adapts to light and dark on its own.
- **Favicon.** The browser-tab icon is `assets/favicons/icon.png`, a square image the build resizes to the sizes browsers need. Replace it with the owner's own.
- **Home page (optional).** The home page is the site's front door and often carries the most personality. If the owner wants, give it a character of its own, a custom layout or a hero, rather than the default.

## 2. Layout

Layout is the overall arrangement: how wide the reading column is, where the header and menu sit, the structure of the page. Offer a few options, or work from something concrete the owner points you at, a reference like [1linelayouts](https://1linelayouts.com/) or a sketch of their own. The reading column's width is `--container-width` in `assets/css/variables.css`; bigger structural changes live in `layouts/`.

Preview each option, and check it on small screens as well as large: a layout built for a wide window often has to adapt on a phone, collapsing the menu or rearranging the page. Layout work touches templates and structural CSS, so restart the preview on the "no fast render" config while you do it (see `CLAUDE.md`), then switch back once it settles.

## 3. The look

**Colors** are a set of named values in `assets/css/variables.css`. Offer the owner a few directions, or take a color they name, then edit the tokens. There are two sets, light and a dark `@media` block; change both so the site stays balanced in either mode, and preview it in light and dark.

**Fonts** start as fast system fonts. When the owner wants a custom one, browse [Google Fonts](https://fonts.google.com/) together, then self-host their pick with the bundled script:

```
bash .claude/skills/personalize/scripts/fetch-google-font.sh "Family Name" "400,700"
```

It downloads the font into the site and writes the `@font-face` rules, so there are no calls to Google at runtime. Then point `--font-body` (and `--font-heading` if they want headings to differ) at the family in `variables.css`. The script hosts one family at a time, so a re-run replaces it; both variables can share that family, or one can stay on system fonts.

If a change calls for an **icon** along the way (a social link, a button), source and self-host it per the Icons rule in `CLAUDE.md`: draw one, take a file the owner supplies, or browse [Material Symbols](https://fonts.google.com/icons) together, then pull the SVG into `assets/`. A single-color icon can use `currentColor`, so it follows the text into light and dark like the logo.

## Hand off

When the owner has gone as far as they want, hand back in plain language. Invite them to keep shaping the site by just talking to you, or to start writing their own words. When they're ready to put the site online, that's `/launch`.

## Notes

- **Nothing here is public or destructive,** so there's no confirmation step; save each accepted change as you go, and `/personalize` is safe to run again anytime.
- **This is the guided setup moment, not a catch-all.** Later one-off tweaks ("make the links green") stay conversational; the owner doesn't need the skill for those.
- **Offer options, follow their taste.** Every choice here is the owner's; give them something to react to, and never settle a matter of taste for them.
