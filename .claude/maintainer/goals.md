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

## Outline settling order (flattened DAG)

The order to settle each file's `<!-- Outline` block, flattened from the dependency DAG: the spec first, then the owner's operating model, then each page before the skill that acts on it, roughly following the owner's journey. Status here means the outline is settled against `design.md`. That is a separate axis from whether the prose is finished (the build-state section above), so a shipped skill can still read as in-progress until its outline is reconciled with the new spec.

| # | File | Anchors | Status |
| --- | --- | --- | --- |
| 1 | `maintainer/design.md` | the spec | **settled** |
| 2 | `README.md` | discover, the front door | **settled** (outline) |
| 3 | `.claude/CLAUDE.md` | owner operating context | **settled** |
| 4 | `content/pages/get-started` | the working model | **settled** |
| 5 | `.claude/skills/setup` | hurdle 1 | in-progress |
| 6 | `content/pages/personalize` | fonts, logo, look | in-progress |
| 7 | `.claude/skills/personalize` | make it yours, composes change-font | in-progress |
| 8 | `content/pages/write` | the Markdown tutorial | in-progress |
| 9 | `content/_index.md` and demo | the demo as teacher | in-progress |
| 10 | `content/pages/launch` | hosts, domain, cost | in-progress |
| 11 | `.claude/skills/launch` | hurdle 2 | in-progress |
| 12 | `.claude/skills/publish` | everyday go-live | in-progress |
| 13 | `.claude/skills/nuclear` | reset | in-progress |
| 14 | `.claude/skills/upgrade-hugo` | occasional maintenance | in-progress |

Settle coupled nodes together: `CLAUDE.md` with `get-started` (they share the working model), and each page with the skill it hands off to. `change-font` has no outline block (shipped prose) but is composed by `/personalize`, so audit it alongside node 7.
