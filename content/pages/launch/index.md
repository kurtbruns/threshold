---
title: "Launch"
description: "The steps you need to take to launch your site out into the big wide world."
weight: 4
---

Launching is how your site moves from the preview on your computer to a live address on the web. It's a one-time setup. Your site is just a folder of files, so putting it online means keeping a copy on GitHub and connecting a host that rebuilds and serves the site whenever it changes.

This guide walks through each step. You can follow it yourself, or run `/launch` and Claude takes you through it together, one step at a time, pausing wherever a step is yours to do. Either way you only do this once; from then on, sending later changes live is the `/publish` skill.

## Connect to GitHub

Your site needs a home online before it can go live, and that home is [GitHub](https://github.com): a free service that stores a copy of your files and runs the step that builds and deploys the site whenever you publish. You'll need a free GitHub account, which is the one part of this step that's yours; creating it takes a minute.

From there, the work runs through GitHub's command-line tool, `gh`. It's what lets Claude handle the GitHub side from the command line, rather than leaving you to click through the website. If you run `/launch`, Claude installs `gh` for you, the same way [`/setup`](/pages/get-started/) installed Hugo and Git. To install it yourself on a Mac, use Homebrew:

```
brew install gh
```

The [GitHub CLI install page](https://cli.github.com/) covers other systems. With that in place, Claude signs you in, creates a repository on GitHub (a remote copy of your project folder), and connects the two, so from then on every publish sends your changes up and the site rebuilds automatically.

## Choose a host

A host is the service that stores your built site and serves it to visitors. This kit recommends two, and both are free:

- **Cloudflare Workers** — the one to reach for if you want a site you mean to keep: your own custom domain (Cloudflare can sell you one too), more control over details like which crawlers may visit, and its deploy settings kept in the project alongside everything else. It takes a little more setup.
- **GitHub Pages** — the fast on-ramp: your site already lives on GitHub, so this needs almost nothing and gives you a free `yourname.github.io/your-repo` address. Ideal when you just want to be online today.

If you're not sure, start with GitHub Pages; moving to Cloudflare later is easy.

With either one, `/launch` sets up a GitHub Action, a small automation stored in your repository that builds the site with Hugo and deploys it every time you publish. That's what makes publishing a single step later: there's no build command for you to configure, and the deploy runs where Claude can watch it.

You're not limited to these two. [Hugo's host-and-deploy guide](https://gohugo.io/host-and-deploy/) lists many more hosts and, for each, the ways to build and deploy to it. The difference is that you'd wire up that build-and-deploy step yourself, and Claude can't follow a deploy that runs on the host's side unless you install that host's own command-line tool.

## Custom domain

A custom domain is a web address that belongs to you, like `yourname.com`, instead of a free one the host hands out. For a site you mean to keep it's worth having, the difference between a name that's yours and a name that's borrowed.

- **If you don't own one yet**, register it through Cloudflare and buy and connect it in one place, the simplest path. You can also skip this for now, launch on a free address, and add the domain whenever you're ready.
- **If you already own one**, point it at your host by changing its DNS settings, or move it to Cloudflare to keep everything together.

## What it costs

Hosting is free on both options. The only cost is a custom domain, about $15 a year, and even that can wait. There's no monthly hosting bill and no build fees.

## What you get

What launching gets you is a pipeline between the site on your computer and the site on the web. Whenever you want your latest changes live, you publish, and they're usually online in under a minute, with no files to upload and nothing to click through. Ask Claude to publish, or run `/publish`, and the pipeline does the rest.

You're not tied to Claude for it, either. The pipeline deploys on every push to your GitHub repository, so publishing is really just a `git push`, and you can send changes live yourself with git whenever you prefer.
