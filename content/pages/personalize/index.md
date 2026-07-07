---
title: "Personalize"
description: "Layout, colors, fonts, your logo, and site identity."
weight: 2
---

<!--

- Layout
- Theme
- Colors, fonts, and spacing
- Fonts
- Name and tagline
- Icons and logo

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

The site ships with fast system fonts, so there are no third-party requests. To use a Google Font, ask for **`/change-font`** — it browses Google Fonts with you, then downloads and self-hosts your pick (still no calls to Google).

## Name and tagline

Your site's name and description live in `config/_default/hugo.toml`. Ask Claude to *"rename the site to …"* or *"update the tagline,"* and it edits them there.

## Logo and icon

TODO: https://fonts.google.com/icons

- The header logo is `assets/icons/logo.svg` — swap that file, or ask Claude to draw a new mark.
- The browser-tab icon (favicon) is `assets/favicons/icon.png` — swap that file for your own.

## The menu

Each page decides whether it appears in the top menu through its own front-matter (`menus: main`, with a `weight` for order). Ask Claude to *"put this page in the menu"* or *"reorder the menu,"* and it sets that for you.
