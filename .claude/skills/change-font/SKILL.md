---
name: change-font
description: Change the website's font to a self-hosted Google Font. Use when the user wants to change, pick, browse, or add a font for the site — body text or headings. Sends them to Google Fonts to browse, then downloads and self-hosts their choice so there are no requests to Google (better privacy and speed).
argument-hint: [font name]
allowed-tools: Read, Edit, Write
---

# Change the site font

Switch the site to a **self-hosted** Google Font: the font files are downloaded into the project so the browser never calls Google's servers. Keep the conversation friendly and plain — the user may not be technical.

## 1. Pick a font
If the user already named a font (for example `/change-font Poppins`), use that and skip to step 2.

Otherwise send them to Google Fonts to browse, and open it in their browser if you can:

  https://fonts.google.com/

Ask them for:
- the **font name**, spelled as it appears on Google Fonts (e.g. "Inter", "Poppins");
- whether to use it for **body text, headings, or both** (default: both).

## 2. Confirm weights
Confirm which weights to include. A sensible default is **400,700** (regular and bold). Add more only if they want them (e.g. a light or black weight).

## 3. Download and self-host it
Run the bundled script from the project root, with the family quoted and the weights comma-separated:

```bash
bash ${CLAUDE_SKILL_DIR}/scripts/fetch-google-font.sh "Inter" "400,700"
```

It downloads the `.woff2` files into `static/fonts/` and writes `assets/css/components/fonts.css` (already wired into the build) with the `@font-face` rules. If it reports the font or a weight wasn't found, re-check the spelling and available weights on Google Fonts and try again.

## 4. Use the font
Edit `assets/css/variables.css` and set the variable(s) the user chose, with the family first and the system stack kept as the fallback:

- body → `--font-body: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;`
- headings → `--font-heading: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;`

Replace `Inter` with their font and set only the variable(s) they asked for.

## 5. Show the result
Make sure the preview is running and confirm the new font is visible. Tell them plainly what changed.

## Notes
- One custom family at a time — running this again replaces the current one.
- To return to the default system font, set the variable(s) back to just the system stack; the next build drops the webfont automatically.
