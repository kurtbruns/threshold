---
title: "Get started"
description: "Get your site running on your own computer and learn how to work with it."
weight: 1
---

This guide gets your site running on your own computer. You'll install the tools it needs, start the preview, and make your first change.

## Set up your site

After you download the project and open it in Claude Code, your site needs two tools: [Hugo](https://gohugo.io/), which builds the site, and [Git](https://git-scm.com/), which tracks your changes.

The kit can set this up for you: in Claude Code, run `/setup`. It checks what you already have, helps you install anything missing, and starts the preview.

To install the tools yourself instead, the recommended path on a Mac is [Homebrew](https://brew.sh/), a package manager that installs both with one command and keeps them easy to update. It's what `/setup` uses too. The steps below run in a terminal.

1. Install Homebrew, if you don't have it, by following the instructions at [brew.sh](https://brew.sh/).
2. Install Hugo and Git:
    
    ```
    brew install hugo git
    ```
3. Confirm they're ready:
    
    ```
    hugo version
    git --version
    ```
    
    Each should print a version number, confirming both are installed.

On Windows or Linux, follow [Hugo's installation guide](https://gohugo.io/installation/) and install [Git](https://git-scm.com/install/) instead of using Homebrew.

## See your site

If you ran `/setup`, your preview is already running. In the desktop or web app it opens automatically in a preview pane. From a terminal, open the address it printed (usually `http://localhost:1313`). Any time it isn't running, like after you reopen the project, just ask Claude to start the preview server, or run `hugo server` yourself.

This is your **preview**: a private copy that runs on your own computer and updates the moment anything changes. Nothing is online yet, so it's yours alone to experiment with.

When the site is ready to share, you **publish** it and it goes **live** on the web for visitors to see. Putting it online is a one-time setup, covered in the [Launch guide](/pages/launch/).

## Making changes

This kit is designed to work well with Claude Code: describe a change in plain language and it makes it, updating your preview as you go. For example:

> I want to change the headings to a serif font. Please give me some options to pick from.

Because every change is **saved** automatically, you can experiment freely and undo anything that isn't right.

Some common jobs also have a shortcut you can run directly:

- `/setup`: installs what your site needs and starts the preview, so you land on a site you can see.
- `/personalize`: makes the site yours, from the name and colors to layout and fonts, with options to pick from.
- `/launch`: puts your site online for the first time.
- `/publish`: sends your latest changes to the live site.
- `/nuclear`: clears the demo back to a blank canvas so you can start fresh.

You're never limited to talking to Claude, though. Everything is plain files you can write and run yourself whenever you like, and the [Write guide](/pages/write/) shows how to work in your own voice.

## What's next

- **[Personalize](/pages/personalize/)**: make the look yours — colors, layout, and fonts.
- **[Write](/pages/write/)**: add and edit your words, images, and emoji.
- **[Launch](/pages/launch/)**: put your site online.
