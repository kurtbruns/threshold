# Troubleshooting

A few things that occasionally trip people up, and how to fix them. When in doubt, ask Claude Code — describe what you're seeing and it can usually sort it out.

## A photo won't show up

- **iPhone HEIC photos:** Hugo can't read `.heic` files. Convert to JPEG first (on a Mac: open in Preview → File → Export → Format: JPEG), then add it.
- **Check the path:** the image should be in an `images/` folder next to the page's `.md`, referenced like `![description](images/photo.jpg)`.

## The deployed site looks unstyled or won't build

- **Hugo version:** make sure your host's `HUGO_VERSION` matches the version in `config/_default/hugo.toml` and uses the **extended** build. A mismatch is the most common cause of a failed deploy — see [deploying](deploying.md).
- **Build settings:** they should be `hugo --gc --minify` (build command) and `public` (output directory).

## My changes aren't showing

- **In the preview:** ask Claude to reload, or restart the preview server. Moving or renaming files can occasionally leave the dev server stale.
- **On the live site:** give your host a minute to rebuild after a push, then hard-refresh your browser (Cmd/Ctrl + Shift + R).

## Emoji typed as `:tada:` aren't turning into 🎉

Emoji shortcodes are enabled in this kit (`enableEmoji` in the config). Pasted emoji always work; if a `:name:` isn't converting, it's probably not a known emoji alias — paste the emoji directly instead.

## A build fails with "Broken internal link"

Threshold checks every internal link when it builds. If a page links to another page (or a file) that doesn't exist, the build stops and names the link and the page it's on — for example, a link to `/pages/about/` when the page actually lives at `/about/`. Fix the link to point at the real page (ask Claude if you're unsure of the path) and the build passes. This is on purpose — it means a broken link can never reach your live site.

## Still stuck?

Ask Claude Code, and paste any error message you see — most build errors say exactly what's wrong, often a version mismatch or a typo in a page's front-matter.
