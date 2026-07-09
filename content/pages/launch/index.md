---
title: "Launch"
description: "The steps you need to take to launch your site out into the big wide world."
weight: 4
---

<!-- Outline

- Intro (no heading): going live is a one-time setup. Your site is a folder of
  files, so putting it online means keeping a copy on GitHub and connecting a
  host that rebuilds and serves it whenever it changes. Claude handles the
  machinery; a few steps are yours. After this, new changes go live with Publish.

- The one decision: do you want a custom domain?
    - This is the question that picks your host; everything else follows from it.

- Choosing a host
    - Cloudflare Workers (recommended): your own custom domain, more control
      (crawlers, settings kept with the project). A little more setup.
    - GitHub Pages (the fast on-ramp): a free yourname.github.io address, online
      today, needs only a free GitHub account. No domain yet? Start here; move to
      Cloudflare later.
    - Both are free to host. Other hosts work too, with a tradeoff (only these two
      let Claude watch the go-live for you without extra tools).

- Custom domain (optional)
    - What it is and why you'd want one (a name that's yours).
    - Don't own one yet: register through Cloudflare (buy and connect in one place).
    - Already own one: point it at your host (its DNS settings), or move it to
      Cloudflare.
    - About $15/year; not required to go live.

- What it costs
    - Hosting is free on both hosts. A domain is optional, about $15/year. That's it.

- Who does what
    - Yours: creating the accounts, payment, a domain, pasting any secret values.
    - Claude's: everything else, and watching the first go-live for you.

- When you're ready
    - Run /launch to do it together, one step at a time.
    - After launch, going live with later changes is just Publish (/publish).

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