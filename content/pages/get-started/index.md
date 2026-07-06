---
title: "Get started"
description: "How to work with your Threshold site."
weight: 1
---

## Outline

- What this is (intro)
- Get set up
    - Download the project and open it in Claude Code
    - Install Hugo and Git
        - The project needs Hugo and Git to run which involves some technical setup.
        - Run the /setup skill. 
            - Checks operating system, git version, hugo version, brew version
            - Walks you through getting the local environment setup and pre-requisites installed. Then starts the live preview.
            - Installs what's missing.
                - Recommended path is Homebrew (also allows easy install of `gh` later)
            - Initializes the git repository
            - Starts the preview server
        - Start the preview server
- What's in the kit
    - Lay of the land
        - Everything is in a project folder on your computer
- Two ways to work
    - The kit is designed to work with Claude Code.
    - Example claude prompts
    - Edit the markdown yourself
        - you don't need a subscription forever
        - You also can edit files in the project folder yourself using an application like sublime or VSCode.
- Next steps
    - Personalize
    - Writing
    - Launching & publishing




This guide walks you through the basics of the kit and explains how to install necessary dependencies.

**The kit is designed to work with Claude Code**

Examples of prompts:

- "I have some photos here: `~/Downloads/photos/` that I would like to add to the blog post that I've been writing. Please copy the photos into the blog post and place them on the page so I can decide which ones should go where."
- "Let's add a gallery to the home page that show cases some of the pieces in my portfolio."
- "Can we change the font to a serif font? Please give me some options to choose from. "
- "Publish the changes we made in this session" (requires completing the [launch guide](pages/launch))

Skills

---



Threshold is built to run on plain language. You tell Claude Code what you want — *"add a Projects page"*, *"make the links warmer"* — and it edits the files, previews the result, and tells you what changed. You don't need to know Hugo, Markdown, or Git to use it.

The first time you open the kit, ask for **`/setup`**. It checks for the two tools the site needs, installs anything missing, gets the project ready, and starts a live preview so you can see your site straight away.

- Local Site (define)
- Live Site (Mention in passing and link to the launch guide)

## What you need

Two free tools, both installed for you by **`/setup`**:

- **[Hugo](https://gohugo.io/installation/)** — the engine that builds your site.
- **Git** — tracks your changes and pushes them live when you publish.

## Make a change

Just ask:

- *"Change the site name to Maria's Kitchen."*
- *"Add a page called Projects and put it in the menu."*
- *"Use a warmer color for the links."*
- *"Add this photo to my About page."*

Claude makes the edit, previews it, and tells you what changed. Don't like it? Ask it to undo.

## See your changes

Claude keeps a live preview running while you work, so the site updates as you go. Ask it to *"show me the site"* any time.

## Shortcuts you can ask for

Claude already understands your whole site, so most things are just a plain request. A few common jobs also have a named shortcut:

- **`/change-font`** — browse Google Fonts and self-host your pick.
- **`/publish`** — build, check, and push your site live.
- **`/nuclear`** — clear the example content and start from a blank slate.

## Going live

Publishing happens in two stages. The first time, run **`/launch`** — a one-time setup that puts your project on GitHub and connects a host so the site rebuilds itself whenever it changes. After that, going live with new changes is just **`/publish`**. The [Launch](/pages/launch/) page walks through it.
