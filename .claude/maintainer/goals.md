<!-- Maintainer build state & priorities for the Threshold kit.
     Committed for history, but a MOVING TARGET: prompt-on-demand, NOT
     auto-imported into the frame. design.md is the stable intent; this file
     is what's actually built and what to work on next. Keep it short and
     current; when it goes stale it's worse than absent. -->

# Threshold build state and priorities

The companion to [`design.md`](design.md). Where `design.md` describes the *intended* design, this file tracks what is actually built and what to do next. It moves often, so it is deliberately **not** auto-imported into the maintainer frame; pull it in when planning a build pass.

## How we work

- **Outlines are the source of truth.** Every page, skill, and context file carries an `<!-- Outline -->` block. Shape the outline first, then flesh it to prose; coherence for the target audience (see `design.md` §2) comes before polish.
- **Skeleton before content.** Get the structure of the whole kit right before writing any one surface; nothing is shaped in isolation.
- **Decisions go to `design.md`.** When a design choice firms up, record it there and keep this file to state and priorities.

## Build state: spec'd vs. shipped

*Snapshot; update as it moves.*

**Claude context (`.claude/`)**
- `CLAUDE.md` (owner operating context): outline **settled**; prose not written yet.
- Skills **shipped**: `change-font`, `publish`, `launch`, `upgrade-hugo`.
- Skills **outline only**: `setup`, `personalize`, `nuclear`.
- `settings.json`, `launch.json`, `hooks/pre-push-build.sh`: shipped.
- `maintainer/design.md`: **settled** and fully fleshed (the spec this pass works from).

**Content / onboarding**
- `write` page: mostly complete.
- `get-started`, `personalize`, `launch` pages: rich outlines, `TODO` bodies.
- Demo content (home / about / blog): shipped, placeholder-grade.

**Theme / structure**
- Theme, layouts, image system, `hugo.yaml`, scripts: shipped and working.

## Outline settling order (flattened DAG)

The order to settle each file's `<!-- Outline` block, flattened from the dependency DAG: the spec first, then the owner's operating model, then each page before the skill that acts on it, roughly following the owner's journey. Status here means the outline is settled against `design.md`, a separate axis from whether the prose is finished (see Build state).

| # | File | Anchors | Status |
| --- | --- | --- | --- |
| 1 | `maintainer/design.md` | the spec | **settled** |
| 2 | `README.md` | discover, the front door | **settled** (outline) |
| 3 | `.claude/CLAUDE.md` | owner operating context | **settled** |
| 4 | `content/pages/get-started` | the working model | **settled** |
| 5 | `.claude/skills/setup` | hurdle 1 | **settled** |
| 6 | `content/pages/personalize` | layout, fonts, icons, logo, look | **settled** |
| 7 | `.claude/skills/personalize` | make it yours; absorbs change-font | in-progress |
| 8 | `content/pages/write` | the Markdown tutorial | in-progress |
| 9 | `content/_index.md` and demo | the demo as teacher | in-progress |
| 10 | `content/pages/launch` | hosts, domain, cost | in-progress |
| 11 | `.claude/skills/launch` | hurdle 2 | in-progress |
| 12 | `.claude/skills/publish` | everyday go-live | in-progress |
| 13 | `.claude/skills/nuclear` | reset | in-progress |
| 14 | `.claude/skills/upgrade-hugo` | occasional maintenance | in-progress |

Settle coupled nodes together: `CLAUDE.md` with `get-started`, and each page with the skill it hands off to. `change-font` folds into `/personalize` (its `fetch-google-font.sh` script moves in), so handle it at node 7.

## Settling workflow

To settle a node, read its `<!-- Outline` block against `design.md` and the decisions below, then reconcile it. The specific fixes are re-derived by reading the file; they are not recorded here.

- One node (or a coupled pair) at a time, in DAG order.
- Show `git diff HEAD -- <file>`, then commit scoped with `git commit -- <pathspec>` (that file plus the `goals.md` status flip), message "Settle X outline". The owner keeps unrelated work staged; a pathspec commit leaves it untouched.
- Outlines only; prose fills are deferred. Carry in-flight prose cleanups that ride along.
- Nodes 9 (demo content) and 13 (nuclear) are their own conversations; pause rather than settling silently.

## Decisions this pass

Only the calls an agent could not re-derive from the files. Fold the durable ones into `design.md` as they firm up.

- **Sweeps to apply while settling each file:** the audience (`design.md` §2), and the three ways to work and vocabulary (§3). Older files still carry pre-reframe language ("non-technical", "artists/designers/writers", "two ways", "live preview"); fix it wherever it appears.
- **`change-font` folds into `/personalize`; its `fetch-google-font.sh` script moves into the personalize skill.** `/personalize` becomes the make-it-yours home for layout, colors, fonts, icons, and logo. Fonts and icons are the asset case (browse Google Fonts or Material Symbols, pull the choice in, self-host it; the script does the font fetch); layout and colors change what is already built in. We reversed the earlier keep-separate call once the unified browse-and-self-host pattern was clear. (Now in design.md.)
- **`publish` and `upgrade-hugo` are the reference implementations** of the §6 skill contract; model the others on them.
