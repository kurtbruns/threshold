# Theming

Threshold's look lives in plain CSS under `assets/css/`, split the way you'd
expect:

- **`variables.css`** — the **colors, fonts, and key sizes** as CSS variables.
  Change one value and it updates everywhere. **Dark mode is automatic.**
- **`reset.css`** — a few baseline defaults (on top of vendored modern-normalize).
- **`components/`** — one file per **component**: `scaffolding.css` (the basic
  elements — text, links, lists, code, tables), `layout.css` (header / main /
  footer), and any new piece you add.

The build concatenates these into one fingerprinted file, so splitting them up
costs nothing in page weight. **To add a new component, create
`components/<name>.css` and add it to the list in
`layouts/partials/pipes/style.html`** (just like adding an `@import`).

## The quickest changes (edit `variables.css`)

| You want to… | Change this variable |
| --- | --- |
| Rebrand links / buttons / highlights | `--primary-color` |
| Change the page background / text color | `--background`, `--font-color` |
| Use a different body or heading font | `--font-body`, `--font-heading` |
| Make the reading column wider / narrower | `--container-width` |
| Adjust the left/right page padding | `--gutter` |

## The variables

- **Colors** — `--background`, `--background-soft`, `--font-color`,
  `--font-color-subtle`, `--border-color`, `--primary-color`,
  `--primary-contrast`.
- **Fonts** — `--font-body`, `--font-heading`, `--font-mono`.
- **Sizes** — `--line-height`, `--container-width`, `--gutter`,
  `--header-height`.

## Dark mode

Light values are the default in `variables.css`. The dark overrides sit in the
`@media (prefers-color-scheme: dark)` block right below them — edit those to
tune the dark palette. No toggle needed; the browser follows the OS theme.

## Tips

- Prefer changing a **variable** over editing a component — that keeps the whole
  site consistent.
- Colors accept any CSS color value (`#hex`, `rgb()`, `hsl()`, `oklch()`, …).
- The preview reloads as you edit; for a production build run `hugo --minify`.
