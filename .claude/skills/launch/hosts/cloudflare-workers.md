# Cloudflare Workers (recommended)

The default for a site you mean to keep: your own **custom domain** (Cloudflare doubles as a registrar and DNS), control over crawlers, and deploy settings kept in the repo as `wrangler.jsonc`. It deploys from GitHub Actions, so the run is visible to `/publish`, and it's the platform Cloudflare builds on going forward.

This path is for a **custom domain**. If you're not ready to set one up yet and just want to be live today, use [GitHub Pages](github-pages.md) and migrate here later.

## Set it up

1. **Create a Cloudflare account** at <https://dash.cloudflare.com/> (free). Note your **Account ID** from the right-hand sidebar of the Workers & Pages overview (it's also in the dashboard URL).
2. **Get your domain onto Cloudflare.** The domain's DNS needs to live on this Cloudflare account so wrangler can point it at the site.
   - **Don't have a domain yet?** Register one with Cloudflare: **Domain Registration → Register Domains**, search for the name, and buy it. Cloudflare sells at cost and sets up DNS automatically, keeping registration, DNS, and hosting in one place.
   - **Already own one elsewhere** (GoDaddy, Namecheap, and the like)? Add it as a site under **Websites → Add a site**, then change the domain's nameservers at your current registrar to the pair Cloudflare gives you. Registration can stay where it is; you can transfer it to Cloudflare later if you want.

   Either way, once the domain shows as active on Cloudflare, continue.
3. **Get an API token.** Go to **My Profile → API Tokens → Create Token**, and use the **Edit Cloudflare Workers** template, scoped to your account and your domain's zone. Create it and copy the value (it's shown once).
4. **Store the two secrets in the repo** (paste each value when prompted):
   ```bash
   gh secret set CLOUDFLARE_ACCOUNT_ID
   gh secret set CLOUDFLARE_API_TOKEN
   ```
5. **Add the deploy settings.** Copy the template to the repo root and fill it in:
   ```bash
   cp .claude/skills/launch/templates/wrangler.jsonc wrangler.jsonc
   ```
   Edit `wrangler.jsonc`: set `name` to a project name, and `routes[].pattern` to your domain.
6. **Add the workflow:**
   ```bash
   mkdir -p .github/workflows
   cp .claude/skills/launch/templates/cloudflare-workers.deploy.yml .github/workflows/deploy.yml
   ```
7. **Set the site's address.** In `hugo.yaml`, set `baseURL` to your custom domain (like `https://yourdomain.com/`).
8. Commit `wrangler.jsonc`, the workflow, and `hugo.yaml`, then push. Return to the skill's "Confirm it's live" step to watch the run.

Record `host: cloudflare` in the launch marker (see the skill's "Record the launch marker" step).
