---
name: publish
description: Send your latest changes to the live site. Builds and checks the site, commits your work, then pushes to trigger the deploy that /launch set up. Use for everyday updates once the site is already online, whenever the owner wants to publish, go live, or push changes to the web. Not first-time setup; that's /launch. disable-model-invocation so it only runs when the owner asks.
disable-model-invocation: true
allowed-tools: Read, Bash(hugo:*), Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(git add:*), Bash(git commit:*), Bash(git push:*), Bash(git remote:*), Bash(git rev-parse:*), Bash(gh:*)
---

<!-- Outline

- Where the site stands
1. Check it's ready to publish
2. Build and check locally
3. Review and commit
4. Confirm, then push (gate)
5. Report, and watch the deploy

-->

# Publish your site

Send the owner's latest changes to the live site. This is the everyday update: build and check the site, commit the work, then push, which triggers the deploy that `/launch` set up. Publishing is outward-facing, since it changes a public website, so confirm before the push and keep the owner in plain language.

## Where the site stands

```!
echo "GitHub remote:       $(git remote get-url origin 2>/dev/null || echo 'none yet')"
echo "Deploy workflow:     $(grep -rlE 'actions/deploy-pages|cloudflare/wrangler-action' .github/workflows/ >/dev/null 2>&1 && echo 'present (GitHub Actions)' || echo 'none')"
host=$(awk '/^  launch:/{f=1} f&&/host:/{print $2; exit}' hugo.yaml 2>/dev/null)
echo "Launched to:         ${host:-no host recorded yet}"
echo "Uncommitted changes: $(git status --porcelain 2>/dev/null | wc -l | tr -d ' ') file(s)"
```

## 1. Check it's ready to publish

Read the check above.

- **GitHub remote is `none yet`.** The site was never launched, so there is nowhere to publish to. Don't push anything. Explain plainly and point them to `/launch`, then stop:
  > Your site isn't online yet, so there's nothing to publish to. When you're ready to put it on the internet, run `/launch` and I'll walk you through it. After that, publishing updates is this command.
- **A remote is set.** The site is on GitHub. Continue.

`Deploy workflow` and `Launched to` are hints for step 5, not gates: a remote is enough to push to. Step 5 reads the workflow line to decide whether it can watch the deploy, and the marker to word the result.

## 2. Build and check locally

Build the site the way the host will, and make sure it's clean before anything goes out:

```bash
hugo --gc --minify
```

If the build fails, stop and fix it before publishing. A broken build here would mean a broken live site. (A pre-push guard also builds before allowing a push, but checking now gives clearer errors and avoids a wasted push.)

## 3. Review and commit

Show the owner what will go live, then save it:

1. Summarize the uncommitted changes (from `git status` and `git diff`) as a short, plain list of what changed.
2. Commit anything not yet committed, with a clear message. Committing is routine here, so there's no need to ask first; the owner confirms at the push in step 4.

If there is nothing to commit and nothing unpushed, there is nothing to publish. Say so and stop.

## 4. Confirm, then push

The push is the moment the site changes for the public, so this is the one place to confirm. Show the summary from step 3 and ask plainly:

> Here's what will go live:
> <summary>
> Publish these to your site now?

On yes, push:

```bash
git push
```

This hands the changes to the host, which rebuilds and deploys the site.

## 5. Report, and watch the deploy

Whether the deploy is watchable comes from the repo, not the marker: a push-triggered deploy workflow in `.github/workflows/` (the **Deploy workflow** line in the check) means the deploy runs in GitHub Actions. Branch on that:

- **Deploy workflow present.** The push started an Actions run. It can take a few seconds to register, so give it a moment, then find and watch it:
  ```bash
  gh run list --commit "$(git rev-parse HEAD)" --limit 1
  gh run watch
  ```
  On success, give the address (the `baseURL` in `hugo.yaml`, or the host's page):
  > Published. Your changes are live at <address>.

  On failure, read the log (`gh run view --log-failed`), explain plainly, and offer to fix and publish again.
- **No workflow, but a host is recorded** (`Launched to`). The site is connected through the host's own dashboard (for example, Cloudflare building on its side), so there's no Actions run to follow. Set the expectation and point them to it:
  > Pushed. Your host is building the site now; it usually goes live in under a minute at <address>. You can watch the build in your host's dashboard.
- **No workflow and no host recorded.** The push updated GitHub, but nothing is serving the site yet. Be honest; don't claim it's live:
  > Saved and pushed to GitHub. To actually put the site on the web, run `/launch` to connect a host. After that, this command sends your updates live.

## Notes

- **This is the everyday loop.** Edit, then `/publish` when you want the changes online. `/launch` is the separate, one-time setup that makes publishing possible.
- **Nothing to configure here.** Publish reads where to go from the GitHub remote and the launch marker (`params.launch`) in `hugo.yaml`; both are set during `/launch`.
