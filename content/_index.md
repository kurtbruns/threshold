---
title: "Home"
menus: main
weight: 1
---

<!-- Outline

The demo's front door: honest that it's the kit's demo, but built and worded
like a finished, designed site. The guides double as docs and as the example (§5).

- Hero / welcome (no heading): a short welcome that orients: this is your home
  page, it holds demo content for now, and /nuclear clears it to a blank slate to
  start fresh. The "what is this" and adopt framing (get your copy) lives in the
  demo banner, not here.
    - Demo-notice banner: demo-build-only chrome (site.Params.isDemo, set by
      .github/workflows/demo.yml). The shopper is the only reader who sees it;
      it is inert on an owner's build.
- Guides: the four onboarding guides in journey order, one line each on what they're for
    - Get started (get it running, first edits)
    - Personalize (make the look yours)
    - Write (text, images, emoji)
    - Launch (take it online)
- After the guides, one sentence pointing to the About page and the blog as
  example surfaces (the blog is a demo of what's possible, not genuine notes)
- Make it yours: a short, cheeky send-off, not an action list; the guides above
  are the how. The blank-page image lands the "rest is yours" beat.
-->

# Welcome

This is your site's home page. Currently, it holds the demo content that ships with Threshold to help you work with the kit. If you want to start fresh, run the `/nuclear` command to clear the content and layout back to a blank slate.

<!-- Demo-only chrome; see layouts/shortcodes/demo-notice.html for how it works. -->
{{< demo-notice >}}
You're viewing a **demo** of what you can build with Threshold, a starter kit for making a personal website with Claude Code. It's the starting point you get after you grab your own copy and set up the project. **[Get your copy here →](https://github.com/kurtbruns/threshold)**
{{< /demo-notice >}}

## Guides

These guides take you from a fresh copy of the site to one that's online. They cover the decisions that are yours to make; Claude Code handles the technical parts.

- **[Get started](/pages/get-started/)**: get the site running on your computer and make your first edits.
- **[Personalize](/pages/personalize/)**: change the look and feel, from colors and layout to fonts.
- **[Write](/pages/write/)**: add and edit your words, images, and emoji.
- **[Launch](/pages/launch/)**: put the site online when you're ready.

The site also ships with a couple of example pages, an [about](/about/) page and a [blog](/blog/), that you can keep or discard as you see fit.

## Make it yours

Decisions, decisions. The work about the work. This part is tricky. Good luck.

{{< image src="images/blank-page-in-typewriter.png" alt="" caption="A blank page in a typewriter from Adaptation (2002)" width="480" >}}
