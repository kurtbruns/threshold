# Deploying your site

Threshold is **host-agnostic**. The site builds to plain static files in `public/`, so it runs on any static host — and nothing host-specific is committed to your repo, so you're never locked in.

The pattern is the same everywhere:

1. **Connect a host to your git repo** — a one-time setup.
2. **Push** — your host rebuilds the site and puts it live. (The `/publish` skill does the build → check → commit → push for you.)

## What every host needs

| Setting | Value |
| --- | --- |
| Build command | `hugo --gc --minify` |
| Output directory | `public` |
| Hugo | the **extended** build, pinned with a `HUGO_VERSION` |

Set `HUGO_VERSION` to the version this kit uses — see `[module.hugoVersion]` in `config/_default/hugo.toml` (currently `0.161.1`), or newer. The kit needs the **extended** build; each host below installs it automatically once you pin a recent version. The snippets use `0.161.1` — keep that in sync with the config.

Pick a host below; after the one-time connect, publishing is just a push.

## Cloudflare (recommended)

Two options — Workers is Cloudflare's current model; Pages is the simplest if you'd rather not add a config file.

**Workers**

1. Add `wrangler.jsonc` at your repo root:
   ```jsonc
   {
     "name": "my-site",
     "compatibility_date": "2025-01-01",
     "assets": { "directory": "./public" }
   }
   ```
2. Cloudflare dashboard → **Workers & Pages** → connect your repo (**Workers Builds**).
3. Set the build command to `hugo --gc --minify` and add an environment variable `HUGO_VERSION` (see above).

**Pages** (no config file)

1. Dashboard → **Workers & Pages → Create → Pages → Connect to Git**, pick your repo.
2. Build command `hugo --gc --minify`, output directory `public`.
3. Add an environment variable `HUGO_VERSION`.

Official guide: <https://gohugo.io/host-and-deploy/host-on-cloudflare/>

## Netlify

1. In Netlify: **Add new site → Import from Git**, pick your repo (it auto-detects Hugo).
2. Add `netlify.toml` at your repo root:
   ```toml
   [build]
     command = "hugo --gc --minify"
     publish = "public"

   [build.environment]
     HUGO_VERSION = "0.161.1"
   ```

Netlify installs the extended Hugo automatically from `HUGO_VERSION`.

Official guide: <https://docs.netlify.com/build/frameworks/framework-setup-guides/hugo/>

## GitHub Pages

GitHub Pages builds from a workflow file you commit.

1. Add `.github/workflows/deploy.yml`:
   ```yaml
   name: Deploy to GitHub Pages
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
         - uses: actions/checkout@v4
         - name: Install Hugo (extended)
           run: |
             curl -sSL -o hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
             tar -xzf hugo.tar.gz hugo && sudo mv hugo /usr/local/bin/
         - id: pages
           uses: actions/configure-pages@v5
         - run: hugo --gc --minify --baseURL "${{ steps.pages.outputs.base_url }}/"
         - uses: actions/upload-pages-artifact@v3
           with:
             path: ./public
     deploy:
       needs: build
       runs-on: ubuntu-latest
       environment:
         name: github-pages
         url: ${{ steps.deployment.outputs.page_url }}
       steps:
         - id: deployment
           uses: actions/deploy-pages@v4
   ```
2. In your repo: **Settings → Pages → Source: GitHub Actions**.
3. Push to `main` — the **Actions** tab shows the build, and the site goes live.

Official guide (has the latest action versions): <https://gohugo.io/host-and-deploy/host-on-github-pages/>

## After you're connected

From then on, just ask Claude to **publish** (the `/publish` skill): it builds, checks the site, commits your changes, and pushes — your host rebuilds and deploys, usually within a minute.
