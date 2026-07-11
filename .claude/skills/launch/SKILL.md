---
name: launch
description: Puts the site on the internet for the first time. Connects it to GitHub and sets up an automatic build-and-deploy pipeline on Cloudflare Workers (recommended, for a custom domain) or GitHub Pages (the fast on-ramp when you don't have a domain yet). Use when the owner is ready to go live, or wants to launch, deploy, or get the site online for the first time. One-time setup, separate from /publish, which sends later updates.
disable-model-invocation: true
allowed-tools: Read, Write, Edit, Bash(git remote:*), Bash(git push:*), Bash(git add:*), Bash(git commit:*), Bash(gh:*), Bash(hugo:*), Bash(bash scripts/hugo-version.sh), Bash(mkdir:*), Bash(cp:*)
---

# Launch your site

Put the owner's site on the internet for the first time. This is a one-time setup with two parts: get the project onto **GitHub**, then set up a **host** that rebuilds and serves the site whenever it changes. Both host options deploy through a **GitHub Actions** workflow, so every deploy is a run you can watch. After this, going live with new edits is just `/publish`.

This is an outward-facing action: it creates a public repository and a public website. Confirm clearly before anything is created or made public, and keep the owner in plain language. You confirm once, here, before the repository is created or the site is made public; the pushes that follow in the host's guide are part of that same launch, not new outward steps, so carry on through them without stopping to re-confirm. Some of the work happens in a web browser, so this skill is a guide as much as it is automation. Walk one step at a time and wait.

**Who does what.** A few steps below only the owner can do, since they involve their accounts, payment, and secrets: creating a GitHub or Cloudflare account, creating an API token, buying or registering a domain, and pasting secret values. Walk them through those one at a time. Everything else is yours to do and to check: copying the workflow, editing `wrangler.jsonc` and `hugo.yaml`, running `gh` commands, and watching the deploy. Set that expectation up front:

> A few of these steps only you can do, since they involve your accounts, payment, and passwords. I'll walk you through each, then handle the rest and watch the deploy for you.

## Where the site stands

Before anything else, run these to see where the site stands:

```bash
git remote get-url origin
gh --version
gh auth status
hugo version
bash scripts/hugo-version.sh
```

A command that errors is telling you something: `git remote get-url origin` failing means there's no remote yet; `gh auth status` failing means not signed in; a missing `gh` or `hugo` prints "command not found."

## 1. Get the project onto GitHub

From what those show: if the project already has a remote, it's already on GitHub (this is the case for anyone who used "Use this template"). Push anything local that isn't up there yet, then go to step 2.

If there's **no remote yet**, the owner downloaded the kit and needs a home for it on GitHub. This is where a **GitHub account is required**, so explain that plainly:

> To put your site online, it needs to live on GitHub first. GitHub is a free service that stores your site and runs the step that publishes it. You'll need a free account. Want me to walk you through it?

Then:

1. **Account.** If they don't have one, send them to <https://github.com/signup> to create a free account, and wait until they're done.
2. **Sign in from this computer.** If `gh auth status` showed you're not signed in, run `gh auth login` and walk them through the browser prompt. (If `gh` isn't installed, install it first, the same way `/setup` handles tools, or point them at GitHub Desktop.)
3. **Create the repository and push.** Confirm the name and whether it should be **public** (anyone can see the source files) or **private**, then create it:
   ```bash
   gh repo create <name> --source=. --remote=origin --push
   ```
   Public is the simplest default. Note that a public repository means the site's source text is visible to anyone; private repositories work too, but some hosts or plans treat them differently (confirm before relying on this).

## 2. Choose a host

Both are free and both deploy through GitHub Actions, so the deploy is a run you can watch. Pick by how far along the owner is:

- **Cloudflare Workers (recommended).** The default for a site they mean to keep: their own **custom domain** (Cloudflare is also a registrar), control over crawlers, and deploy settings kept in the repo as `wrangler.jsonc`. A bit more setup (an API token), and it's the platform Cloudflare builds on going forward.
- **GitHub Pages (the fast on-ramp).** The quickest way to be live: the project is already on GitHub, so this needs nothing but a workflow file and gives a free `yourname.github.io` address. Great when they don't have a domain yet or just want it online today.

When in doubt, or in a hurry, start with GitHub Pages; switching to Cloudflare later is easy (swap the workflow, add `wrangler.jsonc`, set `baseURL`, point the domain).

Other hosts work too: you can connect the repo directly in a host's dashboard, or use any host from [Hugo's host-and-deploy list](https://gohugo.io/host-and-deploy/). The difference is visibility. The two options above give me a deploy run I can watch and debug with nothing extra to install, whereas a host that builds on its own side leaves no run in the repo, so I could only follow it if you set up that host's own command-line tool (like `wrangler` or `netlify`) yourself.

Once they pick, follow that host's guide, then come back here for step 3:

- **Cloudflare Workers:** [hosts/cloudflare-workers.md](hosts/cloudflare-workers.md)
- **GitHub Pages:** [hosts/github-pages.md](hosts/github-pages.md)

## 3. Confirm it's live

Both hosts deploy from GitHub Actions, so watch the run. Follow it with `gh run watch`, or open the repository's **Actions** tab. When it's green, open the address and check the site loads and looks right. If it fails, read the log (`gh run view --log-failed`, or the Actions tab), fix the problem (often the Hugo version, a secret, the project name, or the domain setup), and push again.

## 4. Record the launch marker

Once the site is confirmed live, record it in `hugo.yaml` so `/publish` knows a deploy pipeline exists and can point the owner at the right place afterward. Add this under `params`:

```yaml
params:
  launch:
    host: cloudflare      # or github-pages
    date: 2026-07-07      # today
```

This is a *hint*, not gospel: `/publish` reads it to shape its message, never to hard-block. Commit it with the launch changes. (It's absent in the starter kit itself, so a fresh clone starts un-launched.)

## 5. Hand off

Tell the owner plainly that the site is live, and give them the address. Then set the expectation for next time:

> Your site is live at <address>. From now on, whenever you want your latest changes on the web, just ask me to publish (or run `/publish`). It usually goes live in under a minute.

## Notes

- **This runs once.** After launch, `/publish` is the everyday way to send updates.
- **Custom domain.** With Cloudflare Workers it's built in: add the domain to your Cloudflare account, then set `routes[].pattern` in `wrangler.jsonc` and `baseURL` in `hugo.yaml` to match. GitHub Pages supports custom domains too, but you buy the domain elsewhere and add it under Settings → Pages.
- **Hugo version.** The kit pins one Hugo version, `module.hugoVersion.min` in `hugo.yaml`, printed by `scripts/hugo-version.sh`. Both workflows install that exact extended version automatically.

## Supporting files

- **`hosts/`**: per-provider setup guides opened in step 2 ([cloudflare-workers.md](hosts/cloudflare-workers.md), [github-pages.md](hosts/github-pages.md)).
- **`templates/`**: copyable files the host guides put in place: the deploy workflows ([cloudflare-workers.deploy.yml](templates/cloudflare-workers.deploy.yml), [github-pages.deploy.yml](templates/github-pages.deploy.yml)) and Cloudflare's [wrangler.jsonc](templates/wrangler.jsonc).
