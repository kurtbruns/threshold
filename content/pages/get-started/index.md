---
title: "Get started"
description: "Get your site running on your own computer and learn how to work with it."
weight: 1
---

<!-- Outline

- Intro (no heading): what this guide does. Get your site running, learn how you work with it.
- Set up your site
    - Needs Hugo and Git; run /setup (installs tools, sets up saving, starts the preview)
    - Starting the preview manually (fallback)
- How your site works (the model, defined once, here)
    - It's a folder on your computer
    - Two places: on your computer (the preview) and live (on the web)
    - Two moments: Save (automatic, your undo history) and Publish (make it live)
- Three ways to work (a spectrum; you move freely between them)
    - Delegate: talk to Claude, the default way in. Example prompts + the
      owner-facing skill list (the happy-path skills: /setup, /personalize,
      /launch, /publish, /nuclear; /upgrade-hugo is occasional maintenance,
      keep it out of the primary list).
    - Author directly: write it yourself, in your own voice. Open a page's file
      in a text editor (Sublime, VS Code, anything) and edit the Markdown in
      content/. Encouraged for voice-heavy pages (About, blog); see the Write
      guide. A nudge, not a rule; Claude still helps whenever you ask.
    - Operate the stack: you own it. Plain Markdown, CSS, and layouts over Git,
      so you can graduate to editing and publishing yourself. Not tied to using
      AI forever. An option, not a step.
- Make your first change (a tiny guided edit, seen in the preview)
- Where to go next: Personalize, Write, Launch

-->

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
4. Start the preview:
    ```
    hugo server
    ```
    Open the address it prints (usually `http://localhost:1313`) and you'll see your site.

On Windows or Linux, follow [Hugo's installation guide](https://gohugo.io/installation/) and install [Git](https://git-scm.com/downloads), then run `hugo server`.

## Making changes

When you start the preview server, or ask Claude to, you're looking at the **preview**: a private copy that runs on your own computer and updates the moment anything changes. Nothing is on the internet yet, so it's yours to experiment with. Try it now: with the preview open, ask Claude to *change the site title to your name*, and watch the header update on its own. Claude saves a checkpoint after every change, so you can always go back if something isn't right.

When the site is ready to share, you **publish** it and it goes **live** on the web for visitors to see. Putting it online is a one-time setup, covered in the [Launch guide](/pages/launch/).

You'll make changes in one of three ways, moving freely between them: hand the task to Claude, write parts yourself, or do it all yourself. Most people start by talking to Claude and reach for the others as they go.

### Talk to Claude

This is the default, and how most changes happen: describe what you want, and Claude does it. Some things you might say:

- "I have some photos in `~/Downloads/photos/` that I'd like to add to my most recent blog post. Please copy them into the post's folder and place them on the page so I can decide what goes where."
- "Let's add a gallery to the home page that showcases some of my portfolio pieces."
- "Add the ability to render math equations to the site."
- "Can we switch to a serif font? Give me a few options to choose from."
- "Let's change the layout to use a fixed sidebar on the left."
- "Publish the changes we made this session." (once you've completed the [Launch guide](/pages/launch/))

Some common jobs also have a shortcut you can run directly:

- `/setup`: installs what your site needs and starts the preview, so you land on a site you can see.
- `/personalize`: makes the site yours, from the name and colors to layout and fonts, with options to pick from.
- `/launch`: puts your site online for the first time.
- `/publish`: sends your latest changes to the live site.
- `/nuclear`: clears the demo back to a blank canvas so you can start fresh.

### Write it yourself

Everything on your site is plain Markdown, so you can open a page and edit it directly, in your own voice. Open any page's `index.md` in a text editor (Sublime, VS Code, whatever you like) and write. It's especially worth doing where the words are the point, like your About page and blog posts. This is a nudge, not a rule: Claude is still there to help whenever you want it. The [Write guide](/pages/write/) covers how the content is organized.

### Run it all yourself

Underneath, the site is just plain files, Markdown, CSS, and layouts, tracked in Git. If you ever want to, you can edit and publish it yourself, with or without Claude; you're never locked into using AI to run it. The kit is built so this is possible, but it never asks you to: it's an option, not a step.

## Where to go next

- **[Personalize](/pages/personalize/)**: make the look yours, from colors and layout to fonts.
- **[Write](/pages/write/)**: add and edit your words, images, and emoji.
- **[Launch](/pages/launch/)**: put the site online.
