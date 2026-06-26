---
name: launch
description: Put the site on the internet for the first time. Connects the project to GitHub and sets up automatic publishing with a host (Cloudflare Pages or GitHub Pages), so that from then on changes go live with /publish. Use when the owner is ready to go live, or wants to launch, deploy, or get the site online for the first time. This is a one-time setup, separate from /publish, which sends later updates. disable-model-invocation so it only runs when the owner asks.
disable-model-invocation: true
allowed-tools: Read, Write, Bash(git remote:*), Bash(git push:*), Bash(git add:*), Bash(git commit:*), Bash(gh:*), Bash(hugo:*)
---

# Launch your site

Put the owner's site on the internet for the first time. This is a one-time setup
with two parts: get the project onto **GitHub**, then connect a **host** that
rebuilds and serves the site whenever it changes. After this, going live with new
edits is just `/publish`.

This is an outward-facing action: it creates a public repository and a public
website. Confirm clearly before anything is created or made public, and keep the
owner in plain language. Most of the work happens in a web browser, so this skill
is a guide as much as it is automation. Walk one step at a time and wait.

## Where the site stands

```!
echo "GitHub remote: $(git remote get-url origin 2>/dev/null || echo 'none yet')"
echo "GitHub CLI:    $(gh --version 2>/dev/null | head -1 || echo 'not installed')"
echo "Signed in:     $(gh auth status >/dev/null 2>&1 && echo 'yes' || echo 'no')"
echo "Hugo:          $(hugo version 2>/dev/null | head -1 || echo 'not installed')"
```

## 1. Get the project onto GitHub

Read the check above. If **GitHub remote** already shows an address, the project is
already on GitHub (this is the case for anyone who used "Use this template"). Push
anything local that isn't up there yet, then go to step 2.

If the remote is **none yet**, the owner downloaded the kit and needs a home for it
on GitHub. This is where a **GitHub account is required**, so explain that plainly:

> To put your site online, it needs to live on GitHub first. GitHub is a free
> service that stores your site and tells your host when to update it. You'll need
> a free account. Want me to walk you through it?

Then:

1. **Account.** If they don't have one, send them to <https://github.com/signup> to
   create a free account, and wait until they're done.
2. **Sign in from this computer.** If **Signed in** is `no`, run `gh auth login` and
   walk them through the browser prompt. (If `gh` isn't installed, install it first,
   the same way `/setup` handles tools, or point them at GitHub Desktop.)
3. **Create the repository and push.** Confirm the name and whether it should be
   **public** (anyone can see the source files) or **private**, then create it:
   ```bash
   gh repo create <name> --source=. --remote=origin --push
   ```
   Public is the simplest default. Note that a public repository means the site's
   source text is visible to anyone; private repositories work too, but some hosts
   or plans treat them differently (confirm before relying on this).

## 2. Choose a host

The host is the service that builds the site and serves it to visitors. Recommend
one of these two, and offer the list below if they want to look around first:

- **Cloudflare Pages (recommended).** Nothing is added to your project. You connect
  it once in Cloudflare's dashboard, and it gives you a web address right away.
- **GitHub Pages.** Keeps everything inside GitHub with no third-party service. It
  adds one small settings file to your project and serves from a web address under
  your GitHub name.

Other options to look into later: Netlify, Vercel, Render. They all work the same
way (connect the repo, build with Hugo). Pick one host now; the owner can change
later.

## 3a. Cloudflare Pages (recommended)

Guide them through the dashboard. The exact wording on Cloudflare's site changes
over time, so describe each step and adapt:

1. Go to <https://dash.cloudflare.com/> and sign in or create a free account.
2. Open **Workers & Pages → Create → Pages → Connect to Git**, authorize GitHub, and
   pick the repository from step 1.
3. Set the build settings:
   - **Framework preset:** Hugo
   - **Build command:** `hugo --gc --minify`
   - **Build output directory:** `public`
4. Add an environment variable so Cloudflare builds with the right Hugo:
   - **`HUGO_VERSION`** set to the version this kit uses (the `Hugo` line in the
     check above; the build needs the **extended** edition, which is what that
     version installs).
5. Save and deploy. Cloudflare builds the site and gives an address ending in
   `.pages.dev`.
6. Set the site's address to match so links resolve correctly. In
   `config/_default/hugo.toml`, set `baseURL` to the `.pages.dev` address (or a
   custom domain later), then commit and push.

From now on, every push rebuilds the site automatically.

## 3b. GitHub Pages

This path you can mostly do for them. Add the build recipe, then turn Pages on.

1. Create `.github/workflows/hugo.yml` with the workflow below. Set `HUGO_VERSION`
   to the version from the check above (the build needs the **extended** edition).

   ```yaml
   name: Deploy site to GitHub Pages

   on:
     push:
       branches: [main]
     workflow_dispatch:

   permissions:
     contents: read
     pages: write
     id-token: write

   concurrency:
     group: pages
     cancel-in-progress: false

   jobs:
     build:
       runs-on: ubuntu-latest
       env:
         HUGO_VERSION: 0.161.1
       steps:
         - name: Install Hugo (extended)
           run: |
             wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb
             sudo dpkg -i hugo.deb
         - name: Checkout
           uses: actions/checkout@v4
           with:
             fetch-depth: 0
         - name: Configure Pages
           id: pages
           uses: actions/configure-pages@v5
         - name: Build
           run: hugo --gc --minify --baseURL "${{ steps.pages.outputs.base_url }}/"
         - name: Upload artifact
           uses: actions/upload-pages-artifact@v3
           with:
             path: ./public

     deploy:
       needs: build
       runs-on: ubuntu-latest
       environment:
         name: github-pages
         url: ${{ steps.deployment.outputs.page_url }}
       steps:
         - name: Deploy to GitHub Pages
           id: deployment
           uses: actions/deploy-pages@v4
   ```

   The workflow sets the site's address for you (`--baseURL`), so there's nothing to
   change in the config for GitHub Pages.

2. Commit and push the workflow file.
3. On GitHub, open the repository's **Settings → Pages**, and under **Build and
   deployment → Source**, choose **GitHub Actions**.
4. The workflow runs on that push. When it finishes, Settings → Pages shows the live
   address.

## 4. Confirm it's live

Wait for the first build to finish (a minute or two), then open the address the host
gave you and check the site loads and looks right. If the build fails, read the
host's build log, fix the problem (often the Hugo version or a missing setting), and
push again.

## 5. Hand off

Tell the owner plainly that the site is live, and give them the address. Then set the
expectation for next time:

> Your site is live at <address>. From now on, whenever you want your latest changes
> on the web, just ask me to publish (or run `/publish`). It usually goes live in
> under a minute.

## Notes

- **This runs once.** After launch, `/publish` is the everyday way to send updates.
- **Custom domain** (e.g. `yourname.com`) is a later step, set up in the host's
  dashboard. Offer it only if they ask.
- **Hugo version.** Both hosts must build with the **extended** edition and should
  match the version this kit uses, so production matches the local preview.
