<!-- Threshold — end-user Claude Code context (the SITE OWNER's sessions).
     Maintainer/dev notes live in the gitignored CLAUDE.local.md, which also
     excludes this file from the maintainer's checkout. Specs: #9, #18.
     Keep this under ~200 lines and in plain language. -->

# Helping run this website

You're helping the **owner of this website** — likely not a programmer. This is their site,
built with **Threshold** (a Hugo static-site kit). They shape it by talking to you: editing
text, adding pages and photos, changing the look, and publishing. Do the work for them and
explain what changed in plain language; skip the jargon unless they ask for it.

## Working style
- **Just do it.** When they ask for a change, make the edit and show the result — don't hand
  back a list of steps for them to run.
- **Preview before you call it done.** Start the dev server and check the page actually looks
  right (the "Preview site" config runs `hugo server`). Share what you see.
- **Plain language.** Explain changes the way you'd tell a friend, not a release note.
- **No new tools or dependencies.** Everything is plain Hugo, CSS, and a little JavaScript.
  Don't add npm packages, frameworks, or build steps (see "Adding features").
- **Small, reversible steps.** Change one thing, show it, then move on.

## Where things live
- **Pages & posts:** `content/`. `content/_index.md` is the home page, `content/about.md` the
  About page, `content/blog/` the posts. Each `.md` file is one page.
- **Photos:** in an `images/` folder next to the page's `.md` file (a "page bundle").
- **Look & feel:** `assets/css/variables.css` (colors, fonts, sizes) and
  `assets/css/components/` (per-piece styles). Dark mode is automatic.
- **Site settings:** `config/_default/hugo.toml` — site name, description, and the top menu.
- **Logo & icon:** `assets/icons/logo.svg` (header) and `assets/favicons/` (browser tab).
- **Guides:** the example content shows how things look; how-to guides are in `docs/`.

## Everyday tasks
- **Edit text:** open the page's `.md` in `content/` and edit the Markdown.
- **Add a page:** create `content/<name>.md` with a title, then add it to the menu under
  `[menus]` in `config/_default/hugo.toml` if it should appear in the nav.
- **Add a blog post:** create `content/blog/<slug>.md` (or a folder with an `images/` subfolder).
- **Add a photo:** drop it in the page's `images/` folder and reference it with a normal Markdown
  image — `![a short description](images/photo.jpg)`. Threshold makes it responsive and strips
  location data automatically. For a caption or a width cap, use the `image` shortcode:
  `{{< image src="images/photo.jpg" alt="…" caption="…" width="480" >}}`.
- **Formatting** (bold, links, lists, headings, tables): standard Markdown — the example blog
  post is a quick tour of how it all renders.

## Look & feel
- **Colors / fonts / spacing:** change a variable in `assets/css/variables.css` — it updates
  everywhere. Prefer changing a **variable** over editing a component.
- **Switch the font:** use the `/change-font` skill (browses Google Fonts, self-hosts the choice).
- Common variables: `--primary-color` (links/accents), `--background`, `--font-color`,
  `--container-width` (reading width), `--font-body`, `--font-heading`.

## Adding features (the pattern)
Threshold ships *capabilities*, not a widget grab-bag. When they ask for something interactive —
say an image carousel — **build it with plain CSS plus a small ES module in `assets/`**, wired
through Hugo's existing pipeline:
- Add styles to a new `assets/css/components/<name>.css` and list it in
  `layouts/partials/pipes/style.html`.
- Add behavior as a module imported from `assets/js/main.js`.
- **No new dependencies.** If something looks like it needs a library, find the plain CSS/JS way
  first and explain the trade-off before suggesting anything heavier.

## Content is Markdown
Write content in Markdown. **Raw HTML in `.md` files is turned off** on purpose. If they need to
embed something custom (a video, an iframe, a widget), **author a small shortcode** in
`layouts/shortcodes/` and use that — it's reusable and keeps their content clean. Offer to make
the shortcode for them.

## Preview & publish
- **Preview:** start the **"Preview site"** server and open the page; reload as you edit — it
  hot-reloads ordinary content edits.
- **After structural changes** (new pages or sections, moving/renaming a page bundle, editing
  `config/`): use the **"Preview site — structural changes (no fast render)"** config, or restart
  the server. Fast render only re-renders *changed* pages, so a move/rename can leave a stale route
  (a 404 on the new path) even when the site is fine. When a route looks wrong but `hugo --gc
  --minify` builds it into `public/`, the preview is stale, not the site.
- **Build check:** `hugo --gc --minify` should finish without errors.
- **Publish:** Threshold is host-agnostic — going live is a `git push` to their host (a build
  runs automatically first and blocks the push if it fails).

## First time here?
If the site still looks like the Threshold example (example posts, "Threshold" as the name),
offer to **make it theirs**: ask for the site name, a one-line description, and any color or font
preference, then update the config and styles and show the result. If they'd rather start from a
clean slate, offer to clear the example content and leave them a simple home page.
