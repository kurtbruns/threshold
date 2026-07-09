# The `maintainer/` folder

This folder holds context for **building the Threshold kit**, not for running a site built with it. If you are a site owner working on your own website, you can ignore everything here. Your context is `.claude/CLAUDE.md`, and nothing in this folder loads into your sessions.

Three files:

- **`frame.md`** — the imperative "you are the maintainer" overlay: the job, the rules, and an `@import` of `design.md`. This is what actually flips Claude into maintenance mode.
- **`design.md`** — the design of the kit: what it is, who it's for, the paths it supports, and the invariants that keep it coherent. Descriptive reference, not instructions.
- **`goals.md`** — the moving target: what is actually built versus still planned, and what to work on next.

## How the frame loads

All three files are committed so the design has history, but none of them load on their own. They come in through `CLAUDE.local.md`, a gitignored file in the repo root that Claude Code loads automatically at the start of every session.

`CLAUDE.local.md` is just a pointer — a single line that imports `frame.md`:

```
@.claude/maintainer/frame.md
```

From there, `frame.md` sets the maintainer persona and imports `design.md`; `goals.md` is read on demand rather than loaded up front. Because `CLAUDE.local.md` is gitignored, it exists only in a maintainer's working copy. A fresh clone doesn't have it, so none of this loads and Claude behaves exactly as it does for a site owner.

## Example prompts: exploring the space

A large share of what an owner will ask for is some form of "make my site do X." These are collected to explore the space of possible requests, in the owner's own words, not to prescribe an outcome. What Claude actually produces on any given prompt is not fully determined, and settling the intended behavior for each is future work, whether by dogfooding them against the kit or by nailing them down in the design. The ethos that shapes how any of these are handled lives in `.claude/CLAUDE.md`; the underlying invariant is `design.md` §6.

**Look and layout**
- "Can we show a gallery of my work on the home page?"
- "I'd like my projects to appear as cards."
- "Can we add little callout boxes for notes and warnings?"

**Reading and content**
- "I write about math sometimes. Can the site show equations properly?"
- "I'd like a search box so people can find my posts."
- "Can readers copy my code snippets with one click?"
- "I want to drop this YouTube video into the post."

**Interactive touches**
- "Can these photos become a swipeable carousel?"
- "When someone clicks a photo, can it open up larger?"

**Needs an outside service**
- "Can people send me a message from a contact form?"
- "I'd like readers to be able to comment on my posts."
- "How can I tell how many people are visiting my site?"
- "Can I add a little store to sell a few prints, with checkout?"

**Probably not a static site**
- "I want visitors to sign up for accounts and log in."
- "Can I add a dashboard that updates live?"
