# The `maintainer/` folder

This folder holds context for **building the Threshold kit**, not for running a site built with it. If you are a site owner working on your own website, you can ignore everything here. Your context is `.claude/CLAUDE.md`, and nothing in this folder loads into your sessions.

Two files:

- **`design.md`** — the design of the kit: what it is, who it's for, the paths it supports, and the invariants that keep it coherent. Descriptive reference, not instructions.
- **`goals.md`** — the moving target: what is actually built versus still planned, and what to work on next.

These are committed so the design has history, but they never load on their own. A maintainer session pulls `design.md` in through the gitignored `CLAUDE.local.md` frame, and `goals.md` is read on demand. In a fresh clone neither loads, so the kit behaves exactly as it will for a site owner.
