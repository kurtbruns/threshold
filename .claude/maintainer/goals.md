<!-- Maintainer build state & priorities for the Threshold kit.
     Committed for history, but a MOVING TARGET: prompt-on-demand, NOT
     auto-imported into the frame. design.md is the stable intent; this file
     is what's actually built and what to work on next. Keep it short and
     current; when it goes stale it's worse than absent. -->

# Threshold build state and priorities

The companion to [`design.md`](design.md). Where `design.md` describes the *intended* design, this file tracks what is actually built and what to do next. It moves often, so it is deliberately **not** auto-imported into the maintainer frame; pull it in when planning a build pass.

## How we work

- **Outlines are settled; now we flesh.** Every page, skill, and context file carries a settled `<!-- Outline -->` block, and that outline is the contract for its prose. This pass writes each document's prose, faithful to its outline; coherence for the target audience (`design.md` §2) comes before polish.
- **Skeleton before content.** Get the structure of the whole kit right before writing any one surface; nothing is shaped in isolation.
- **Decisions go to `design.md`.** When a design choice firms up, record it there and keep this file to state and priorities.

## Build state: spec'd vs. shipped

*Snapshot; update as it moves.*

**Claude context (`.claude/`)**
- All skills carry **settled outlines**. Prose done: `publish`, `launch`, `upgrade-hugo`. Prose `TODO`: `setup`, `personalize`, `nuclear`.
- `CLAUDE.md` (owner operating context): outline **settled**; prose `TODO`.
- `settings.json`, `launch.json`: shipped.
- `maintainer/design.md`: fully fleshed (the spec this pass works from).

**Content / onboarding**
- All pages carry **settled outlines**. `write`: prose mostly complete. Home (`_index.md`): prose done. `get-started`, `personalize`, `launch`: prose `TODO`.
- `about` / `blog` demo: intentionally light placeholders, settled as-is (the demo is Threshold's own honest site; §5).

**Theme / structure**
- Theme, layouts, image system, `hugo.yaml`, scripts: shipped and working.

## Order (flattened DAG)

The DAG order, spec first, then the owner's operating model, then each page before the skill that acts on it, roughly following the owner's journey. **Every outline is settled**; the same order now drives the prose-fleshing pass. The status below tracks the **prose**.

| # | File | Anchors | Prose |
| --- | --- | --- | --- |
| 1 | `maintainer/design.md` | the spec | fleshed |
| 2 | `README.md` | discover, the front door | fleshed |
| 3 | `.claude/CLAUDE.md` | owner operating context | TODO |
| 4 | `content/pages/get-started` | the working model | TODO |
| 5 | `.claude/skills/setup` | hurdle 1 | TODO |
| 6 | `content/pages/personalize` | layout, fonts, icons, logo, look | TODO |
| 7 | `.claude/skills/personalize` | make it yours; absorbs change-font | TODO |
| 8 | `content/pages/write` | the Markdown tutorial | mostly done |
| 9 | `content/_index.md` and demo | the demo as teacher | fleshed |
| 10 | `content/pages/launch` | hosts, domain, cost | TODO |
| 11 | `.claude/skills/launch` | hurdle 2 | fleshed |
| 12 | `.claude/skills/publish` | everyday go-live | fleshed |
| 13 | `.claude/skills/nuclear` | reset | TODO |
| 14 | `.claude/skills/upgrade-hugo` | occasional maintenance | fleshed |

Flesh coupled nodes together: `CLAUDE.md` with `get-started`, and each page with the skill it hands off to.

## Fleshing workflow

To flesh a node, write its prose from the settled outline and `design.md`, applying the sweeps below. The specific wording is worked out in the file; it is not recorded here.

- One node (or a coupled pair) at a time, in DAG order.
- Make the change, then wait for the owner to review the visual diff in their IDE and confirm before committing. No need to paste diffs; the owner reads them in the IDE.
- Once the prose is settled, strip the file's `<!-- Outline -->` block before committing. The outline is scaffolding for writing; a finished file carries none, so it can't drift from the prose.
- Commit scoped with `git commit -- <pathspec>` (that file plus any `goals.md` status update), message "Flesh X". The owner keeps unrelated work staged; a pathspec commit leaves it untouched.
- Keep the prose faithful to the settled outline; nudge the outline only if the prose reveals it drifted.
- Destructive or high-stakes nodes (e.g. `nuclear`) still warrant a pause rather than silent changes.

## Decisions this pass

Only the calls an agent could not re-derive from the files. Fold the durable ones into `design.md` as they firm up.

- **Sweeps to apply while settling each file:** the audience (`design.md` §2), and the three ways to work and vocabulary (§3). Older files still carry pre-reframe language ("non-technical", "artists/designers/writers", "two ways", "live preview"); fix it wherever it appears.
- **`publish` and `upgrade-hugo` are the reference implementations** of the §6 skill contract; model the others on them.
- **Skill descriptions follow Anthropic's shape:** lead with what the skill does and when to use it, no mechanics narration, no `disable-model-invocation` tail. All six are trimmed to this; match it for new skills.

## Structural pass: done

A deep-dive pass (docs research + a `.claude/` audit + a content/theme audit) ran before fleshing; the self-hosted and no-dependencies invariants passed clean. Everything it surfaced is now fixed, so fleshing starts from a solid structure. Two minor items were assessed and left as-is on purpose: the `params.launch` read in `publish` is a stable two-space coupling (both producer and consumer are ours), and the container-width vs image `sizes` gap is a harmless micro-optimization.
