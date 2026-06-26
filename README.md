# Threshold

Threshold is a starter kit for building a website with [Claude Code](https://claude.com/claude-code). You describe the site you want in plain language, and Claude makes the changes, shows you a preview, and publishes when you're ready. You don't need to know HTML, CSS, or how to use a code editor.

It's built on [Hugo](https://gohugo.io/), a fast website generator. Your site ends up as ordinary files that you own and can host anywhere for little to no cost.

## What you can do

Tell Claude what you want in your own words:

- "Rename the site to Maria's Kitchen."
- "Write an About page about me."
- "Add a blog post about my trip to Japan."
- "Make the links green and the headings bigger."

Claude takes care of the details behind each request. Photos are a good example. Drop in a picture straight from your phone, and Threshold resizes it into a fast-loading version, so large images never slow your pages down. It also removes the GPS location your phone records inside each photo, so you never publish the spot where it was taken. The look is just as easy to manage: colors, fonts, and spacing all come from a short list of settings, so one change updates the whole site, and dark mode works on its own.

Your changes aren't set in stone. If something isn't right, ask Claude to undo it or take the site back to an earlier version.

## Before you begin

You need three things on your computer: Hugo, which builds the site; Claude Code, which makes the changes; and a copy of this project. Choose the setup that matches how you like to work.

### With Homebrew (macOS, terminal)

If you're comfortable in the terminal and use [Homebrew](https://brew.sh/), install everything at once:

```bash
# Hugo (extended edition) and the GitHub CLI
brew install hugo gh

# Claude Code
brew install --cask claude-code
```

Homebrew installs the extended edition of Hugo, which this kit requires. Git already comes with macOS. If `git` isn't found, run `xcode-select --install` to add it.

### Without the terminal (any operating system)

If you'd rather not use the terminal, install each piece from its own download page:

1. **Hugo.** Follow the [official install guide](https://gohugo.io/installation/) and choose the **extended** edition. On Windows, the quickest option is `winget install Hugo.Hugo.Extended`.
2. **Claude Code.** The [desktop app](https://claude.com/claude-code) is the easiest way to start, and it works without the terminal. Claude Code requires a paid Claude plan, either Pro or Max. The free plan doesn't include it.
3. **This project.** Install [GitHub Desktop](https://desktop.github.com/) and use it to clone this repository. You can also download the project from its GitHub page under **Code → Download ZIP**.

> **Why the extended edition?** Threshold converts your images to WebP, a modern format that only Hugo's extended edition can produce. Homebrew, `winget Hugo.Hugo.Extended`, and the official release binaries all give you the extended edition.

Not sure you installed everything correctly? Once the project is open in Claude Code, run `/setup`. It checks what's on your computer and walks you through anything that's missing.

## Quick start

1. **Get your own copy.** On GitHub, click **Use this template** to create your own repository. This is the recommended path. You can also clone this repository directly:
   ```bash
   git clone https://github.com/kurtbruns/threshold.git my-site
   cd my-site
   ```
2. **Open the project in Claude Code.** From the project folder, run:
   ```bash
   claude
   ```
   You can also open the folder in the Claude Code desktop app or the VS Code extension.
3. **Get set up.** Type `/setup`. It checks that Hugo and the other pieces are installed, helps you add anything that's missing, and starts a live preview of your site.
4. **Ask for what you want.** Try "rename it to …," "write an About page about me," or "add a blog post about my trip." Claude makes the change and shows you the result.

The site you just downloaded is itself a short guide. Open it and read **Getting started**, **Writing**, and **Personalizing**. When it feels like yours, ask Claude to clear the example content and give you a clean slate.

## Handy commands

A few common tasks have their own command. Type it to Claude like any other request:

- `/setup` gets a fresh download ready. It checks your tools and starts a live preview. Run this one first.
- `/change-font` sets the site to a Google Font and self-hosts it for speed and privacy.
- `/launch` puts your site on the internet for the first time. Run it once, when you're ready to go live.
- `/publish` builds the site and pushes it live.
- `/nuclear` clears the example content so you can start from a blank canvas.

## Going live

When you're ready to go live, run `/launch`. It puts your site on the internet for the first time: it gets the project onto GitHub and connects a host (Cloudflare Pages or GitHub Pages) that rebuilds the site whenever it changes. After that, sending your latest changes live is a single `/publish`.

Threshold builds to plain static files and isn't tied to any one host, so you're never locked in. The [deployment guide](docs/deploying.md) covers the hosts in detail, including other options like Netlify.

## License

[MIT](LICENSE) © 2026 Kurt Bruns
