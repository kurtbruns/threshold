---
title: "Write"
description: "Formatting text, adding images, and emoji."
weight: 3
---

The pages of the site live in the `content/` folder. This is where you would create a project, essay, or other piece of writing.

Everything on your site is written in Markdown and organized into page bundles.



## How to create a new page

A page is a folder with an `index.md` file inside it. That folder is a *page bundle* — it keeps the page's text and its images together in one place:

```
content/example/
├── index.md
└── images/
    ├── photo.jpg
    └── diagram.png
```

To add one, just ask — *"add a page called Projects"* — and Claude creates the bundle, writes the front matter at the top of `index.md`, and (if you like) adds it to the menu.

## Images

To add an image, drop a photo into the page's `images/` folder and reference it with a normal Markdown image. A wide photo fills the column edge to edge. The site automatically makes it responsive, fast, and privacy-safe — it even strips the GPS location that phones embed in photos:

![A panoramic view across a forested lake dotted with small islands](images/vista.jpg)

When you want a caption — or to cap how wide an image gets — use the `image` shortcode instead. It centers the image by default; add `width` to keep it from filling the whole column:

{{< image src="images/sculpture.jpg" alt="A mirror-polished sculpture reflecting a blue sky" caption="A chrome sculpture in San Francisco." width="480" >}}

## Markdown crash course

Markdown is just text with a few light marks that turn into formatting.

### Headings organize a page

Use `##` for a section heading and `###` for a subheading. (The `#` level is reserved for the page title above.)

### Everyday text

You can make words **bold**, *italic*, or `monospaced`, and link to [another page](https://example.com). Separate paragraphs with a blank line — that's what creates the space between these blocks of text.

### Lists

Bulleted lists use `-`:

- Drop a thought here
- And another
- Nesting works too, with indentation

Numbered lists use `1.`:

1. First, write something
2. Then, refine it
3. Finally, publish

### Quotes and code

> Markdown lets you focus on writing. The site handles how it looks.

Wrap inline bits like `hugo server` in backticks. For a longer snippet, fence it with three backticks:

```js
function greet(name) {
  return `Hello, ${name}!`;
}
```

### Tables

| Element   | Markdown            |
| --------- | ------------------- |
| Bold      | `**text**`          |
| Link      | `[text](url)`       |
| Image     | `![alt](photo.jpg)` |

## Emoji

Paste emoji straight into your text and they appear as-is: 🎉 📷 ✅ 🌿

You can also type them by name between colons — `:tada:` becomes 🎉 and `:camera:` becomes 📷.

## Extending Markdown

Raw HTML is turned off on purpose — it keeps your pages clean and safe. When you want to embed something custom (a video, a map, an interactive widget), ask Claude to make a **shortcode** for it: a small, reusable tag like the `image` one above. You write something like `{{</* video … */>}}` in your page, Claude builds the piece once, and you can reuse it anywhere.

That's the whole toolkit. Anything you can write in Markdown renders with this same clean styling — so go ahead and make it your own.
