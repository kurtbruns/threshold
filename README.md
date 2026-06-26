# Threshold

A Hugo static-site starter kit you shape with **Claude Code** — build and run your website by conversation, no coding required.

Clone it, open it in Claude Code, and tell it what you want: *"rename the site to Maria's Kitchen,"* *"add a page about my work,"* *"make the links green,"* *"add these photos."* Claude edits the files, previews the result, and publishes when you're ready. The repo ships the context and skills Claude needs to do all of this for you.

## What you get

- **Run it by talking.** No HTML, CSS, or commands to memorize — describe changes in plain language.
- **Real photos, handled for you.** Drop in a camera photo; the kit makes it responsive and fast, and strips GPS location data automatically.
- **Theme by variable.** The whole look comes from a handful of CSS variables — change one and it updates everywhere. Dark mode is automatic.
- **Yours, with no lock-in.** Plain Hugo, plain CSS and JavaScript — no npm, no frameworks. Deploy to any static host with a `git push`.
- **A few handy skills:** `/change-font` (self-host a Google Font), `/publish` (build + push live), and a blank-canvas reset.

## Before you start

You'll install three things: **Hugo** (builds the site), **Claude Code** (your assistant), and a way to get this project onto your computer. Pick the path that fits you.

### Path A — Homebrew (macOS, comfortable in the terminal)

```bash
# Hugo (extended edition) + GitHub CLI
brew install hugo gh

# Claude Code
brew install --cask claude-code
```

Homebrew installs the **extended** edition of Hugo, which this kit needs. Git ships with macOS already; if `git` isn't found, run `xcode-select --install`.

### Path B — Friendly (any OS, no terminal required)

1. **Hugo** — follow the official guide and choose the **extended** edition: <https://gohugo.io/installation/>. (On Windows the quickest is `winget install Hugo.Hugo.Extended`.)
2. **Claude Code** — the easiest start is the **Desktop app**, which works without the terminal: <https://claude.com/claude-code>. You'll need a paid Claude plan (**Pro** or **Max**) — the free plan doesn't include Claude Code.
3. **This project on your computer** — install **GitHub Desktop** (<https://desktop.github.com/>) and use it to clone this repository, or download it from the GitHub page via **Code → Download ZIP**.

> **Why "extended"?** Threshold encodes WebP images, which only Hugo's **extended** edition can do. Homebrew, `winget Hugo.Hugo.Extended`, and the official release binaries are all extended.

## Quick start

1. Get your own copy. On GitHub click **Use this template** to create your own repository (recommended), or clone this one directly:
   ```bash
   git clone https://github.com/kurtbruns/threshold.git my-site
   cd my-site
   ```
2. Open the folder in Claude Code:
   ```bash
   claude
   ```
   (Or open the folder in the Claude Code desktop app or VS Code extension.)
3. **Just ask.** Try *"show me the site,"* *"rename it to …,"* *"write an About page about me,"* or *"add a blog post about my trip."* Claude makes the change and shows you a live preview.

New here? The site you just cloned **is** a short guide — open it and read **Getting started**, **Writing**, and **Personalizing**. Once it feels like yours, ask Claude to **clear the demo content** for a clean slate.

## Going live

Threshold is **host-agnostic**: it builds to plain static files and commits nothing host-specific, so you're never locked in. Connect any static host to your repo once, then publishing is a `git push` — or just ask Claude to **`/publish`**. Step-by-step instructions for Cloudflare, Netlify, and GitHub Pages are in [`docs/deploying.md`](docs/deploying.md).

## What's where

| Folder | What's in it |
| --- | --- |
| `content/` | Your pages and posts (Markdown) |
| `assets/css/` | The look — `variables.css` plus per-piece components |
| `assets/js/` | A little interactivity, bundled by Hugo |
| `config/` | Site settings: name, menu, image defaults |
| `.claude/` | The context and skills that let Claude run your site |
| `docs/` | Human references — deploying and troubleshooting |

Most of the time you won't touch these directly — you'll ask Claude. But it's all plain files if you ever want to.

## Under the hood (for the curious)

- **Hugo extended, no `package.json`** — Hugo natively fingerprints CSS, bundles JS (esbuild), and processes images.
- **Plain CSS**, organized as variables + components. **Plain ES modules** for JavaScript.
- **Markdown only** — raw HTML is off; custom embeds are authored as small Hugo shortcodes.
- New features are added as CSS + JS through Hugo's pipeline — no new dependencies.

## License

[MIT](LICENSE) © 2026 Kurt Bruns. Use it, change it, and build whatever you like.
