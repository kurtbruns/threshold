# Images

Add a photo by dropping it into your page's `images/` folder and referencing it with a normal Markdown image. Threshold makes it responsive and fast automatically — there are no settings to learn.

## The easy way (Markdown)

Keep each page's photos in an `images/` folder next to its `index.md` (a Hugo "page bundle"):

    content/my-page/
      index.md
      images/
        photo.jpg

Then in `index.md`:

    ![A short description of the photo](images/photo.jpg)

That's it. On build, Threshold:

- resizes the photo to several widths and serves the right one for each screen (with sharp 2× versions for retina displays),
- creates modern **WebP** versions with an original-format fallback,
- adds lazy-loading and reserves the right space so the page doesn't jump,
- **strips metadata** (including GPS location) from the delivered images.

Always write a short, meaningful **alt description** inside the `[ ]` — it helps people using screen readers, and search engines too.

## With a caption

Use the `image` shortcode when you want a caption under the photo. It centers the image and puts the caption beneath:

    {{< image src="images/photo.jpg" alt="A short description" caption="A sunny afternoon." >}}

To stop a photo from filling the whole column, cap how wide it can grow with `width` — a bare number is read as pixels, or pass any CSS length like `30rem`:

    {{< image src="images/photo.jpg" alt="A short description" width="480" >}}

## Notes

- **iPhone HEIC photos:** Hugo can't read `.heic` files. Convert to JPEG first (on a Mac: open in Preview → File → Export → Format: JPEG), then add it.
- **Big camera photos are fine** — Threshold downscales them for the web. Just keep an eye on repo size if you commit many full-resolution originals.
- **SVGs and animated GIFs** are passed through unchanged.
