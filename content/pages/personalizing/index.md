---
title: "Personalizing"
description: "Colors, fonts, your logo, and site identity."
weight: 3
---

Make the site look and feel like yours. Most changes are one sentence to Claude Code away — *"make the links green,"* *"use a rounded heading font,"* *"rename the site."* Here's what's under the hood, in case you want to poke at it directly.

## Colors, fonts, and spacing

The whole look comes from a handful of variables in `assets/css/variables.css` — change one and it updates everywhere:

- `--primary-color` — links, buttons, and accents
- `--background` and `--font-color` — page and text colors
- `--font-body` and `--font-heading` — the typefaces
- `--container-width` — how wide the reading column is

Dark mode is automatic — the site follows each visitor's system setting.

## Fonts

The site ships with fast system fonts, so there are no third-party requests. To use a Google Font, ask for **`/change-font`** — it browses Google Fonts with you, then downloads and self-hosts your pick (still no calls to Google).

## Name and tagline

Your site's name and description live in `config/_default/hugo.toml`. Ask Claude to *"rename the site to …"* or *"update the tagline,"* and it edits them there.

## Logo and icon

- The header logo is `assets/icons/logo.svg` — swap that file, or ask Claude to draw a new mark.
- The browser-tab icon lives in `assets/favicons/`.

## The menu

Each page decides whether it appears in the top menu through its own front-matter (`menus: main`, with a `weight` for order). Ask Claude to *"put this page in the menu"* or *"reorder the menu,"* and it sets that for you.
