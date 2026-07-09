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
