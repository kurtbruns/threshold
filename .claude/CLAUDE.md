# Helping run this website

You're helping the **owner of this website**, who is likely not a programmer. It's their site, built with Threshold (a Hugo static-site kit). They shape it by talking to you. Do the work for them, then explain what changed in plain language. Skip the jargon unless they ask.

## Working style

- **Just do it.** When they ask for a change, make the edit and show the result. Don't hand back a list of steps to run.
- **Preview before you call it done.** Start the dev server and check that the page looks right (the "Preview site" config runs `hugo server`). Share what you see.
- **Plain language.** Explain changes the way you'd tell a friend, not a release note.
- **No new tools or dependencies.** Everything is plain Hugo, CSS, and a little JavaScript. Don't add npm packages, frameworks, or build steps (see "Adding features").
- **Small, reversible steps.** Change one thing, show it, save it, then move on.

## Where things live

- **Pages and posts:** `content/`. `content/_index.md` is the home page, `content/about/index.md` the About page, and `content/blog/` the posts. Each `.md` file is one page.
- **Photos:** an image used on a single page goes in an `images/` folder next to that page's `.md` file (a "page bundle"). An image shared across several pages goes in `assets/images/`. The home page (`content/_index.md`) lives at the content root, so its images go in `assets/images/` too.
- **Look and feel:** `assets/css/variables.css` for colors, fonts, and sizes, and `assets/css/components/` for per-piece styles. Dark mode is automatic.
- **Site settings:** `config/_default/hugo.toml` holds the site name, description, and top menu.
- **Logo and icon:** `assets/icons/logo.svg` for the header, and `assets/favicons/` for the browser tab.
- **Guides:** the example content shows how things look. How-to guides are in `docs/`.

## Everyday tasks

- **Edit text:** open the page's `.md` file in `content/` and edit the Markdown.
- **Add a page:** create `content/<name>.md` with a title. Add it to the menu under `[menus]` in `config/_default/hugo.toml` if it should appear in the nav.
- **Add a blog post:** create `content/blog/<slug>.md`, or a folder with an `images/` subfolder.
- **Add a photo:** for an image used on one page, drop it in that page's `images/` folder; for one shared across pages (or on the home page), put it in `assets/images/`. Reference it with a normal Markdown image either way — `![a short description](images/photo.jpg)` — since Threshold checks the page's own folder first, then falls back to `assets/`, so the same `images/…` path works in both cases. It makes the image responsive and strips location data automatically. For a caption or a width cap, use the `image` shortcode: `{{< image src="images/photo.jpg" alt="…" caption="…" width="480" >}}`.
- **Formatting** (bold, links, lists, headings, tables): standard Markdown. The example blog post is a quick tour of how it all renders.

## Look and feel

- **Colors, fonts, and spacing:** change a variable in `assets/css/variables.css` and it updates everywhere. Prefer changing a variable over editing a component.
- **Switch the font:** use the `/change-font` skill. It browses Google Fonts and self-hosts the choice.
- Common variables: `--primary-color` (links and accents), `--background`, `--font-color`, `--container-width` (reading width), `--font-body`, and `--font-heading`.

## Adding features

Threshold ships capabilities, not a grab-bag of widgets. When they ask for something interactive, such as an image carousel, build it with plain CSS and a small ES module in `assets/`, wired through Hugo's existing pipeline:
- Add styles to a new `assets/css/components/<name>.css` and list it in `layouts/partials/pipes/style.html`.
- Add behavior as a module imported from `assets/js/main.js`.
- **No new dependencies.** If something looks like it needs a library, find the plain CSS or JS way first, and explain the trade-off before suggesting anything heavier.

## Content is Markdown

Write content in Markdown. Raw HTML in `.md` files is turned off on purpose. If they need to embed something custom, such as a video, an iframe, or a widget, author a small shortcode in `layouts/shortcodes/` and use that instead. It's reusable and keeps their content clean. Offer to make the shortcode for them.

## Save a checkpoint after each change

The site is tracked with Git, which gives the owner an undo history. After a change they're happy with, commit it quietly with a short, plain-language message (for example, "Add About page" or "Make the links green"). Treat saving as part of finishing the change. Don't make them think about Git or show them the commands.

This is what lets them change their mind. If they ask to undo something or go back to how things were, use Git to revert the last change or restore an earlier checkpoint, then show the result. Saving this way is local. Publishing (`/publish`) is what pushes the site live.

## Preview and publish

- **Preview:** start the "Preview site" server and open the page. Reload as you edit; it hot-reloads ordinary content edits.
- **After structural changes** (new pages or sections, moving or renaming a page bundle, or editing `config/`): use the "Preview site — structural changes (no fast render)" config, or restart the server. Fast render only re-renders changed pages, so a move or rename can leave a stale route (a 404 on the new path) even when the site is fine. If a route looks wrong but `hugo --gc --minify` builds it into `public/`, the preview is stale, not the site.
- **Build check:** `hugo --gc --minify` should finish without errors.
- **Publish:** Threshold is host-agnostic. Going live is a `git push` to their host. A build runs automatically first and blocks the push if it fails.

## First time here?

If the site still looks like the Threshold example (example posts, "Threshold" as the name), offer to make it theirs. Ask for the site name, a one-line description, and any color or font preference. Then update the config and styles, and show the result. If they'd rather start clean, offer to clear the example content and leave them a simple home page.
