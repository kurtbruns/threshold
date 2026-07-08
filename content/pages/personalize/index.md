---
title: "Personalize"
description: "Layout, colors, fonts, icons, your logo, and site identity."
weight: 2
---

<!-- Outline

- Intro (no heading): the look and feel is yours to shape. Change any of it by
  asking Claude or by editing the files yourself; everything lives in a few
  predictable places.

- Name and tagline (your identity in words; hugo.yaml)

- Layout (how a page is arranged: content width, the overall structure). Browse a
  reference like 1linelayouts for ideas, or show Claude a sketch; Claude offers
  options and previews them.

- Colors (the palette; light + dark, auto-responsive; the tokens in
  assets/css/variables.css)

- Fonts (concept home)
    - Ships with fast system fonts, so no third-party requests
    - Browse Google Fonts, then Claude downloads and self-hosts your pick (still
      no calls to Google); this is part of /personalize

- Icons (concept home)
    - Browse Material Symbols for the icons you want
    - Claude pulls the SVGs into assets/ and uses them, self-hosted and
      dark-mode-aware like the logo

- Logo and favicon (concept home)
    - Header logo: assets/icons/logo.svg (swap the file, or ask Claude to draw one)
    - Browser-tab icon: assets/favicons/ (swap for your own)

- Spacing and type sizes (the rest of the design tokens in variables.css)

- The menu (which pages show up top; each page's own front matter decides)

- Going further (reassurance, not a workflow): it's plain CSS and layouts under
  assets/ and layouts/; edit directly when you're ready.

- When you're ready to make it yours in one pass: run /personalize.

 -->

Change the look and feel of the site to make it yours.

The pages of the site live in the `content/` folder. This is where you would create a project, essay, or other piece of writing.

## Layout

TODO: https://1linelayouts.com/

## Theme

TODO: The site is light & dark responsive

Colors, fonts, spacing, and more

There is a main stylesheet called `assets/css/variables.css` which contains a handful of variables that control.

### Fonts

The site ships with fast system fonts, so there are no third-party requests. To use a Google Font, ask for **`/change-font`**. It browses Google Fonts with you, then downloads and self-hosts your pick (still no calls to Google).

## Name and tagline

Your site's name and description live in `hugo.yaml`. Ask Claude to *"rename the site to …"* or *"update the tagline,"* and it edits them there.

## Logo and icon

TODO: https://fonts.google.com/icons

- The header logo is `assets/icons/logo.svg`. Swap that file, or ask Claude to draw a new mark.
- The browser-tab icon (favicon) is `assets/favicons/icon.png`. Swap that file for your own.

## The menu

Each page decides whether it appears in the top menu through its own front-matter (`menus: main`, with a `weight` for order). Ask Claude to *"put this page in the menu"* or *"reorder the menu,"* and it sets that for you.
