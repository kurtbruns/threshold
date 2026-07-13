# GitHub Pages (the fast on-ramp)

The quickest way to be live. The project is already on GitHub, so this needs nothing but a workflow file, no third-party account, and it deploys from GitHub Actions where `/publish` can watch it. Best when a free address under your GitHub name (like `yourname.github.io/your-repo`) is fine for now, or you just want the site online today. You can migrate to Cloudflare later.

## Set it up

1. Copy the workflow into place:
   ```bash
   mkdir -p .github/workflows
   cp .claude/skills/launch/templates/github-pages.deploy.yml .github/workflows/deploy.yml
   ```
   It reads the kit's Hugo pin from `scripts/hugo-version.sh`, so there's no version to hardcode, and it sets the site's address for you (`--baseURL`), so there's nothing to change in `hugo.yaml`.
2. Commit and push the workflow file.
3. On GitHub, open the repository's **Settings → Pages**, and under **Build and deployment → Source**, choose **GitHub Actions**.
4. The workflow runs on that push. Return to the skill's "Confirm it's live" step to watch it.

Record `host: github-pages` in the launch marker (see the skill's "Record the launch marker" step).

**The address.** GitHub serves this repo at `yourname.github.io/your-repo`, and the workflow resolves `--baseURL` from GitHub at deploy time, so it always matches. A bare `yourname.github.io` is GitHub's one-per-account personal site: it requires the repo to be named exactly that. If the owner wants it for a site they mean to keep, rename the repo to `yourname.github.io` and the next deploy adopts the new address automatically; otherwise leave the name as is.
