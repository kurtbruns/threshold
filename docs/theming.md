# Theming

Threshold's entire look is controlled by **design tokens** — CSS variables
defined at the top of [`assets/css/main.css`](../assets/css/main.css) (the
"TOKENS" section). Change a token and it cascades everywhere. **Dark mode is
automatic**, based on the visitor's system setting.

## The quickest changes

| You want to… | Change this token |
| --- | --- |
| Rebrand the accent (links, focus, highlights) | `--color-accent` |
| Change the page background / text color | `--color-bg`, `--color-text` |
| Use a different body or heading font | `--font-body`, `--font-heading` (see fonts guide) |
| Make the reading column wider / narrower | `--container` |
| Adjust the left/right page padding | `--gutter` |

## Token groups

- **Color** — `--color-bg`, `--color-surface`, `--color-text`,
  `--color-text-muted`, `--color-border`, `--color-accent`,
  `--color-accent-contrast`.
- **Typography** — `--font-sans`, `--font-mono`, `--font-body`,
  `--font-heading`, the type scale (`--text-sm` … `--text-3xl`), and line
  heights (`--leading-normal`, `--leading-tight`).
- **Spacing** — `--space-1` … `--space-8`.
- **Radius** — `--radius-sm`, `--radius-md`, `--radius-lg`, `--radius-full`.
- **Layout** — `--container`, `--container-wide`, `--gutter`.

## Dark mode

Light values live in `:root`. The dark overrides live in the
`@media (prefers-color-scheme: dark)` block right below them — edit those values
to tune the dark palette. You don't need a toggle; the browser chooses based on
the operating-system theme.

## The CSS reset

Browser normalization is handled by **modern-normalize** (MIT), vendored at
`assets/css/vendor/modern-normalize.css` and bundled *before* `main.css`. It's
kept pristine so you can update it later by re-downloading the pinned version.
The few opinionated extras on top (image `max-width`, `prefers-reduced-motion`,
`text-wrap`, …) live in the "Base defaults" section of `main.css`.

## Tips

- Prefer changing **tokens** over editing individual element rules — that's what
  keeps the whole site consistent.
- Colors accept any CSS color value (`#hex`, `rgb()`, `hsl()`, `oklch()`, …).
- After editing, the preview reloads automatically; for a production build run
  `hugo --minify`.
