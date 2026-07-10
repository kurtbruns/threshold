---
title: "Personalize"
description: "Make the site yours: identity, layout, colors, and type."
weight: 2
---

Here's how to change the look and feel of your site to make it yours. Threshold ships with sensible defaults, so change as much or as little as you like.

To be walked through it all in one guided pass, run **`/personalize`** and Claude takes you through it one choice at a time, previewing and saving as you go. You can also change anything just by asking, or by editing the plain files yourself.

## Identity

Every site carries a few marks that say whose it is. Which ones you use is up to you: a title and a tagline, a logo in the header, the icon in the browser tab, or a custom home page. You don't need all of them. Just pick the ones that feel right to you.

> Change the site name to "Field Notes" and replace the door logo with my own.

## Layout and navigation

Layout is how your site is arranged: how wide the text runs, what sits in the header, and where the menu lives. You might move the menu into a fixed sidebar on the left, or leave it across the top. For ideas, browse a gallery like [1linelayouts](https://1linelayouts.com/), or sketch something and hand it to Claude, and you'll see a few options in the preview.

> Change the layout to a fixed sidebar on the left with the menu in it.

When you change the layout, remember that people will visit on phones as well as on desktops. A design built for a wide screen often has to adapt on a narrow one: a menu might collapse behind a button, or the page might rearrange itself. It's worth checking that a new layout looks right on both.

> Check that the layout looks good on both desktop and mobile.

## The look

Color and type set the mood. Out of the box the site has both a light and a dark theme, and it switches between them automatically to match each visitor's device. So when you change a color, you're choosing it for both, and Claude keeps the two in balance.

> Let's change the color of links to be purple and try a serif font for the headings. Show me what this looks like in both light and dark modes.

For type, the site starts with fast system fonts that load instantly and keep it private, since nothing is fetched from another server. When you want more character, browse [Google Fonts](https://fonts.google.com/), pick one, and Claude downloads it and serves it from your own site. Most of these look-and-feel values live together in one small file, `assets/css/variables.css`, if you'd like to see them.

## What's next

- **[Write](/pages/write/)**: add and edit your words, images, and emoji.
- **[Launch](/pages/launch/)**: put your site online.
