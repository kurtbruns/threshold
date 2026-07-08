<!-- Maintainer build state & priorities for the Threshold kit.
     Committed for history, but a MOVING TARGET: prompt-on-demand, NOT
     auto-imported into the frame. design.md is the stable intent; this file
     is what's actually built and what to work on next. Keep it short and
     current — when it goes stale it's worse than absent. -->

# Threshold — build state & priorities

The companion to [`design.md`](design.md). Where `design.md` describes the *intended* design, this file tracks what is actually built and what to do next. It moves often, so it is deliberately **not** auto-imported into the maintainer frame — pull it in when planning a build pass.

## How we work

- **Outlines are the source of truth.** Every page, skill, and context file carries an `<!-- Outline -->` block. Shape the outline first, then flesh it to prose; coherence for the target audience (see `design.md` §2) comes before polish.
- **Skeleton before content.** Get the structure of the whole kit right before writing any one surface — nothing is shaped in isolation.
- **Decisions go to `design.md`.** When a design choice firms up, record it there and keep this file to state and priorities.

## Build state — spec'd vs. shipped

*Snapshot; update as it moves.*

**Claude context (`.claude/`)**
- `CLAUDE.md` (owner operating context) — **outline only**, no prose yet.
- Skills **shipped**: `change-font`, `publish`, `launch`, `upgrade-hugo`.
- Skills **outline only**: `setup`, `personalize`, `nuclear`.
- `settings.json`, `launch.json`, `hooks/pre-push-build.sh` — shipped. (Permissions scoping bug — phantom `config/`, root `hugo.yaml` not writable — tracked as a separate task.)
- `maintainer/design.md` — mid-overhaul: §1–2 fleshed, §3–6 still outline.

**Content / onboarding**
- `write` page — mostly complete.
- `get-started`, `personalize`, `launch` pages — rich outlines, `TODO` bodies.
- Demo content (home / about / blog) — shipped, placeholder-grade.

**Theme / structure**
- Theme, layouts, image system, `hugo.yaml`, scripts — shipped and working.

## Priorities

*To sequence together — placeholder, not yet ordered.*

1. Finish the `design.md` overhaul (flesh §3–6, fold in the accuracy fixes noted at the foot of that file).
2. _next: TBD._
