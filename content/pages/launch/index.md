---
title: "Launch"
description: "The steps you need to take to launch your site out into the big wide world."
weight: 4
---

<!-- Outline

- Intro: a static site is just files; going live = put the project on GitHub,
  then connect a host that rebuilds it on every change. /launch walks you
  through it; after that, updates are just /publish.

- How going live works (the concept, explained once)
    - Push-to-publish: you push to GitHub, a GitHub Action builds the site and
      deploys it. One mechanism, the same for either host.
    - Who does what: a few steps are yours (accounts, a domain, secrets);
      Claude handles the rest and can watch the deploy for you.

- 1. Put your project on GitHub (needs a free account)
    - Why GitHub: it stores the site and runs the step that publishes it.

- 2. Choose a host — the deciding question: do you want a custom domain?
    - Cloudflare Workers (recommended): your own domain, control over crawlers,
      deploy settings kept in the repo. Cloudflare is also a registrar.
    - GitHub Pages (the fast on-ramp): free yourname.github.io address, live
      today, no third-party account. Migrate to Cloudflare later.
    - Other hosts work too: connect a repo in a host's dashboard, or see Hugo's
      host-and-deploy list. Tradeoff: only the GitHub Actions route lets Claude
      watch the deploy without extra tooling.

- 3. Custom domain (optional)
    - Don't have one yet: register through Cloudflare (registrar + DNS + hosting
      in one place).
    - Already own one: point its nameservers at Cloudflare, or keep it where it
      is and configure DNS.
    - Not ready for a domain at all? That's the sign to start on GitHub Pages.

- 4. Go live (first deploy)
    - Run /launch; it sets up GitHub + the host and does the first deploy. Watch
      it build, then open the address.

- After launch
    - Everyday publishing is just /publish.

- Cost summary
    - Hosting is free (GitHub Pages and Cloudflare). A domain is about $15/year.
      Other hosts may charge monthly.

 -->

You are ready to launch your static site on the World Wide Web 🌐. The good news is a static site is about as easy as it gets. Because a static site is just a collection of files in a folder, publishing your site is as simple as syncing this folder with some remote location. Many hosting providers will host your site for little to no cost and you can have the peace of mind that it will stay online for many years to come. The bad news is, there are some hoops you will need to jump through.

This guide walks through the steps to set up and publish your website. Once you have completed the guide, you can ask Claude Code to publish the website, and your changes will automatically get published to the live site.

There is also a `/launch` skill that you can run to have Claude Code help you walk through the guide.

## Connect to Github (needs a GitHub account)

- To start, you need a GitHub account.

We are using Git to orchestrate publishing changes to the site. Once this is set up we'll have a "push to publish" deploy pipeline where when you push changes from your local machine to a repository online, the site will get built and deployed along the way.

Connect the local project you've been working with to a GitHub repository. This repository is a remote copy of all of the files that are in the project.


- Requires a GitHub account


## Choose a host

Next, you'll want to choose a hosting provider for the site. 

https://gohugo.io/host-and-deploy/

## Custom Domain (optional)

In many cases, you're going to want a custom domain for your website. To purchase a domain, you'll need to go through a registrar like Cloudflare domains and first check that the domain you are interested in is available.

## First deploy (go live)

## After launch

## Cost summary