---
name: publish
description: Publish the site — build it, check it, commit the changes, and push them live. Use when the owner says "publish", "go live", "put it online", or "push my changes". Host-neutral: pushing triggers the connected host to rebuild and deploy. disable-model-invocation so it only runs when the owner asks for it.
disable-model-invocation: true
allowed-tools: Read
---

# Publish the site

Take the owner's changes live. The site builds to static files, and pushing to
the connected git remote triggers their host to rebuild and deploy. Confirm
before anything goes public.

## 1. Build and check it

Build the site, then look at it in the preview before publishing:

```bash
hugo --gc --minify
```

Glance at the pages that changed and confirm they look right. If the build fails,
fix it before going any further.

## 2. Make sure there's somewhere to publish to

Check that a git remote is set:

```bash
git remote -v
```

If there's no remote, the site isn't connected to a host yet — stop and help the
owner set that up first (see the deployment guide in `docs/`), then come back.

## 3. Show what will go live

Summarize the pending changes in plain language and get a clear yes:

```bash
git status
```

Tell the owner what changed ("you updated the About page and added two photos"),
and ask for a short note describing the update.

## 4. Commit and push

Commit with the owner's note, then push:

```bash
git add -A && git commit -m "<their note>" && git push
```

A build runs automatically before the push (the pre-push hook) and blocks it if
the site doesn't build — so a broken site can't go live.

## 5. Confirm it's on its way

Tell the owner it's published, and that their host will rebuild and deploy
shortly (usually under a minute). Point them to their site URL if it's handy.
