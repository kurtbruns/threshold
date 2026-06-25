---
name: nuclear
description: Reset the site to a blank canvas. Removes all the example pages and posts, resets Home and About to placeholders, and neutralizes the site name — while keeping your theme, layouts, and build untouched. Use when the owner wants a fresh start, a blank slate, or to clear the demo content. Destructive, so it always confirms first and makes a git checkpoint.
disable-model-invocation: true
allowed-tools: Read, Edit, Write
---

# Reset to a blank canvas

This clears the example/demo content so the owner can start from scratch, while
keeping the design and the site engine intact. It is destructive — follow these
steps in order, and never skip the confirmation or the checkpoint.

## 1. Confirm first

Tell the user plainly what will happen and wait for an explicit "yes". For example:

> This clears all the example content — everything under `content/pages/`, the
> example blog posts — and resets your Home and About pages to blank
> placeholders and the site name to "My Site". Your theme, layouts, logo, and
> build all stay exactly as they are. I'll make a git checkpoint first so it's
> fully recoverable. Want me to go ahead?

If they hesitate or say no, stop and change nothing.

## 2. Make a recovery checkpoint

So nothing is ever truly lost, commit the current state first:

```bash
git add -A && git commit -m "Checkpoint before /nuclear reset"
```

If the project isn't a git repository, say so and offer to `git init` — do not
proceed without a checkpoint.

## 3. Clear the example content

- Remove the guide pages: `rm -rf content/pages`
- Remove the example blog posts but keep the section: delete the post bundles
  inside `content/blog/` (e.g. `hello-world/`, `second-post/`), keeping
  `content/blog/_index.md`.
- Reset Home and About to placeholders (next step).

## 4. Neutralize the site identity

In `config/_default/hugo.toml`, set `title = "My Site"` and the `[params]`
`description` to something generic like "A new website." Leave everything else
— theme, imaging, markup, emoji — untouched.

## 5. Leave a clean, working starting point

Replace the Home and About content with short placeholders.

`content/_index.md`:

```markdown
---
title: "Home"
menus: main
weight: 1
---

# My Site

Welcome. Ask Claude Code to start building — add a page, write a post, or change the look.
```

`content/about/index.md`:

```markdown
---
title: "About"
menus: main
weight: 2
---

Tell visitors who you are.
```

Give `content/blog/_index.md` a one-line intro so the empty blog still reads sensibly.

## 6. Keep the engine, the look, and the context

Do **not** touch any of these — they are the kit, not the demo:

- `layouts/` and `assets/` (theme CSS, JS, the logo `assets/icons/logo.svg`, favicons)
- the build configuration in `config/`
- `.claude/` (Claude Code context and skills) and `docs/` (durable guidance)

The site must still build and stay fully styled afterward.

## 7. Verify and hand back

Build and preview to confirm the site is clean and still works:

```bash
hugo --gc --minify
```

Show the result, and remind the user that everything before the reset is saved
in the "Checkpoint before /nuclear reset" commit if they want anything back.
