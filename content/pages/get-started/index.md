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

This guide gets your site running on your own computer. You'll install the tools it needs, start the live preview, and make your first change.

## Set up your site

After you download the project and open it in Claude Code, you need to install Hugo and Git.

Run the `/setup` skill

- Explain what the setup skill does including setting up version control. This allows you to save checkpoints and experiment with different options.

## How your site works

- Everything is in a project folder on your computer
- Local site vs. live site (define both here, once)

## Three ways to work

### Talk to Claude

**Example prompts:**

- "I have some photos here: `~/Downloads/photos/` that I would like to add to the most recent blog post. Please copy the photos into the post's folder and insert them on the page so I can decide which ones should go where."
- "Let's add a gallery to the home page that show cases some of the pieces in my portfolio."
- "Let's add the ability to render math equations to the site."
- "Can we change the font to a serif font? Please give me some options to choose from. "
- "Publish the changes we made in this session" (requires completing the [launch guide](/pages/launch/))

**Skills:**

- `/setup`: installs what your site needs and starts the preview, so you land on a site you can see.
- `/personalize`: makes the site yours, from the name and colors to layout and fonts, with options to pick from.
- `/launch`: puts your site online for the first time.
- `/publish`: sends your latest changes to the live site.
- `/nuclear`: clears the demo back to a blank canvas so you can start fresh.

### Edit the markdown yourself (you're not locked into a subscription)

TODO: open a page's file in any text editor and edit the Markdown in `content/`; encouraged for voice-heavy pages (About, blog).

### Operate the stack (you own it)

TODO: it's plain Markdown, CSS, and layouts over Git, so you can edit and publish yourself if you ever want to. An option, not a step; you're not tied to using AI forever.

## Make your first change

## Where to go next
