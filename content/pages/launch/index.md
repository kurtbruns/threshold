---
title: "Launch"
description: "The steps you need to take to launch your site out into the big wide world."
weight: 4
---

<!-- 

Outline

- Connect to github (needs a GitHub account)
    - We are going to use GitHub to orchestrate publishing local changes to your site you make on your computer to the live site on the web. 
- Choose a host
    - Recommend Clouflare Pages or Github pages
    - List other options and see also: https://gohugo.io/host-and-deploy/ 
- Custom domain (optional) + DNS
- The publishing pipeline
    - Push-to-publish: how it's wired (GitHub Actions builds & deploys)
        - Github actions
        - Connect github to your host (Cloudflare / Netlifly) and input the build command
        - rsync
- First deploy (go live)
- After launch
    - Everyday publishing is just `/publish`
- Cost summary
    - Domain is about $15 per year
    - Github pages and Cloudflare are free
    - Other hosts may cost some amount per month

-->

You are ready to launch your static site on the World Wide Web 🌐. The good news is a static site is about as easy as it gets. Because a static site is just a collection of files in a folder, publishing your site is as simple as syncing this folder with some remote location. Many hosting providers will host your site for little to no cost and you can have the peace of mind that it will stay online for many years to come. The bad news is, there are some hoops you will need to jump through.

This guide walks through the steps to set up and publish your website. Once you have completed the guide, you can ask Claude Code to publish the website, and your changes will automatically get published to the live site.

There is also a `/launch` skill that you can run to have Claude Code help you walk through the guide.



---

## Connect to Github (needs a GitHub account)

- To start, you need a GitHub account.

We are using Git to orchestrate publishing changes to the site. Once this is set up we'll have a "push to publish" deploy pipeline where when you push changes from your local machine to a repository online, the site will get built and deployed along the way.

Connect the local project you've been working with to a GitHub repository. This repository is a remote copy of all of the files that are in the project.


- Requires a GitHub account


## Choose a hosting provider

Next, you need to choose a hosting provider to host the site. This could be a linux server you have access to, 

## Custom Domain

In many cases, you're going to want a custom domain for your website. To purchase a domain, you'll need to go through a registrar like Cloudflare domains and first check that the domain you are interested in is available.


---


"Push to publish". Your changes get pushed to to a remote repository on github and, simultaneously, the site is built and sent to your hosting provider.

**Cost**

Assuming you've completed the setup and have a local version of the starter kit up and running on your computer you are ready to launch your site.

## Connect to Github

## Custom Domains

How to configure a domain (DNS)

## Choosing a Host

- Github Pages
- Cloudflare
- Netlify
- etc

## Publishing

Run the `/publish` skill 