---
title: "Hello, world"
date: 2026-06-20
description: "A quick tour of Markdown and how it looks on this site."
---

Welcome! This is an example post — and a quick crash-course in **Markdown**, the plain-text format you'll write in. Everything below shows how the default styling looks, so you can see what you're working with. Replace it with your own writing, or delete it and start fresh.

## Headings organize a page

Use `##` for a section heading and `###` for a subheading. (The `#` level is reserved for the page title above.)

### Text you write every day

You can make words **bold**, *italic*, or `monospaced`, and link to [another page](https://example.com). Separate paragraphs with a blank line — that's what creates the space between these blocks of text.

## Lists

Bulleted lists use `-`:

- Drop a thought here
- And another
- Nesting works too, with indentation

Numbered lists use `1.`:

1. First, write something
2. Then, refine it
3. Finally, publish

## Quotes and code

> Markdown lets you focus on writing. The site handles how it looks.

Wrap inline bits like `hugo server` in backticks. For a longer snippet, fence it with three backticks:

```js
function greet(name) {
  return `Hello, ${name}!`;
}
```

## Tables

| Element   | Markdown            |
| --------- | ------------------- |
| Bold      | `**text**`          |
| Link      | `[text](url)`       |
| Image     | `![alt](photo.jpg)` |

## Images

Drop a photo into this page's `images/` folder and reference it with a normal Markdown image. The site automatically makes it responsive, fast, and privacy-safe (it even strips the GPS location that phones embed in photos):

![A mirror-polished sculpture reflecting a blue sky](images/sculpture.jpg)

When you want a caption — or to cap how wide an image gets — use the `image` shortcode instead. It centers the image by default; add `width` to keep it from filling the whole column:

{{< image src="images/sculpture.jpg" alt="A mirror-polished sculpture reflecting a blue sky" caption="A chrome sculpture catching the afternoon sky." width="480" >}}

That's the whole toolkit. Anything you can write in Markdown will render with this same clean styling — so go ahead and make this site your own.
