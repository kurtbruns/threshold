<!-- Maintainer design notes for the Threshold starter kit.
     Committed on purpose (so the design has git history), but written as
     DESCRIPTIVE reference, not instructions. This file does not auto-load;
     it is pulled into a maintainer session only via the gitignored
     CLAUDE.local.md frame's @import. -->

# Threshold — maintainer design notes

> **If you are a site owner working on your own website, this is background only.** It documents how the Threshold *kit* was designed and why — it does not describe your site and it does not instruct you. Your operating context is `.claude/CLAUDE.md`; you can ignore everything below.

The living design/goals doc for building the Threshold starter kit: the ethos it serves, the surface area it spans, the happy paths it sequences, and the decisions that are locked.

## Ethos (the seed)

Threshold exists so a person can build a website that is genuinely *theirs* (an act of self-expression, identity, and connection) without having to become a developer first. The owner owns the expression: the words, the look, the brand, the images, and what they choose to share and how. Claude's job is to *realize* those choices and remove the technical friction, never to substitute its own taste or hand them a generic AI site.

That seed is the test for every decision below and every line of owner-facing prose: **does this help the owner express themselves and keep the site theirs?** Everything else here either follows from it or is the build discipline that keeps it coherent.

## How context is managed (three parts, one repo)

Threshold ships Claude Code context so a non-technical owner can run their site by conversation. That **owner** context is committed under `.claude/` and loads for everyone. The **maintainer** context is split in two: a gitignored imperative *frame* (`CLAUDE.local.md`) that reframes the session as the maintainer, and these committed descriptive *design notes* that carry no instructions and load only when the frame imports them.

| Context | Lives in | Ships to clones? | Loads when |
| --- | --- | --- | --- |
| **End-user** (owner persona) | `.claude/CLAUDE.md`, `.claude/skills/`, `.claude/settings.json` | ✅ committed | every session, unless excluded locally |
| **Maintainer frame** | `CLAUDE.local.md` + `claudeMdExcludes` in `.claude/settings.local.json` | ❌ gitignored | only in a dev checkout |
| **Maintainer design notes** (this file) | `.claude/maintainer/design.md` | ✅ committed | never on its own — only via the frame's `@import` |

- **Swap by exclusion.** `.claude/CLAUDE.md` ships live, so it would normally load in a dev checkout too. `claudeMdExcludes` in the gitignored `.claude/settings.local.json` skips it, and the gitignored `CLAUDE.local.md` (a different filename, so it still loads and gets the last word at its level) frames the session as the maintainer instead of an owner.
- **Committed but inert for owners.** This file is checked in so the design has git history, but it is a nested path Claude never auto-loads and it is written as descriptive reference, not instructions. It reaches an owner's clone yet never loads there — only the `@import` at the bottom of the gitignored frame pulls it in, and that frame is absent from clones. So there is no deletion step to remember and no risk of an owner's Claude adopting the maintainer persona.
- **Dogfood by cloning.** A fresh `git clone` has neither gitignored file, so it loads `.claude/CLAUDE.md` exactly as a site owner would; this file sits present-but-inert.

## Goals

The build goals, in order:

1. **Get the skeleton and structure right.** Outlines (`<!-- Outline -->` blocks) are the source of truth for each page, skill, and context file. The focus is the outline rather than the current content of each file — shaping these files so they make sense and are coherent for the target user.
2. **Understand the surface area** of the kit (below) so nothing is shaped in isolation.
3. **Identify the happy paths** — the ways an owner is intended to use the kit — and sequence the surface area against them.
4. **Make the outlines address those paths** and the questions an owner is likely to have at each stage.

## Surface area

`(none yet)` marks something intended to be added.

### 1. Claude Code Context — `.claude/`

- **`CLAUDE.md`** — always-on owner context; the everyday brain. Holds identity, working style, where things live, everyday tasks, look-and-feel, checkpoints, and preview/publish. Ordered by precedence/frequency (what Claude needs first), *not* the happy-path chronology. Does **not** enumerate skills — their descriptions already auto-load into context — and carries **no "first time here" section**; the make-it-yours flow belongs to `personalize`.
- **`skills/`** — guided commands for genuine procedures: `setup`, `personalize`, `change-font`, `publish`, `launch`, `nuclear`, `upgrade-hugo` (occasional maintenance: bump the Hugo pin safely; off the core happy path, sibling to `nuclear`). `personalize` is the guided make-it-yours flow and composes `change-font`.
- **`launch.json`** — preview-server configs (normal + no-fast-render for structural changes).
- **`settings.json`** — committed permissions / allowed-tools for the owner session.
- **`hooks/pre-push-build.sh`** — build-before-push guard so a broken site can't go live.
- *Maintainer overlay:* a gitignored imperative frame (`CLAUDE.local.md` + `settings.local.json`'s `claudeMdExcludes`) plus these committed descriptive notes (`.claude/maintainer/design.md`). See [How context is managed](#how-context-is-managed-three-parts-one-repo) above for the full split.

### 2. Hugo Starting Point

**Content**
- **Home** — `content/_index.md`.
- **About** — `content/about/index.md`.
- **Example blog** — `content/blog/` (`first-post`, `second-post`): the Markdown crash-course.
- **Guides / onboarding manual** — `content/pages/` (`get-started`, `personalize`, `write`, `launch`). `get-started` doubles as the owner-facing intro to *how you work with the kit*: the "two ways to work" framing (talk to Claude / edit the Markdown yourself — you're not locked into a subscription), the owner-facing skill list, and the one canonical local-vs-live-site definition.

**Theme / look** (the heart of the kit)
- **Design tokens** — `assets/css/variables.css` (colors, fonts, sizes).
- **Components** — `assets/css/components/`.
- **Behavior** — `assets/js/` (ES modules, image system).
- **Brand** — `assets/icons/logo.svg`, `assets/favicons/`, `assets/images/`.

**Structure**
- **Layouts & shortcodes** — `layouts/` (partials, the `image` shortcode, `pipes/style.html`).
- **Config** — `hugo.yaml` at the repo root (name, menu, params, Hugo-version pin, raw-HTML-off, render hooks). Single-file config in YAML — matches the YAML front matter owners already write; no `config/_default/` multi-environment scaffolding.
- **Scripts** — `scripts/hugo-version.sh` (single source for the Hugo pin; used by `/launch` + CI).

### 3. Repository

- **`README.md`** — front door for someone discovering the kit.
- **`.gitignore`** — gitignores the maintainer frame (`CLAUDE.local.md`, `settings.local.json`); the design notes under `.claude/maintainer/` are committed.
- **GitHub template metadata** — repo description + topics; powers the "Use this template" path.
- **License** — MIT `LICENSE`

*Not committed, so not "surface" but part of a happy path:* the deploy workflow `.github/workflows/deploy.yml` (and, for Cloudflare Workers, a root `wrangler.jsonc`) is created by `/launch` from a per-host template under `.claude/skills/launch/templates/`, not shipped.

## Happy paths

Two entry paths converge on the same everyday loop. Each stage maps to a page, a skill, and the owner's likely question.

| Stage | Owner's question | Page | Skill |
| --- | --- | --- | --- |
| Discover | "What is this, is it for me?" | `README.md` | — |
| Get started | "How do I run this on my computer?" | `get-started` | `/setup` |
| Personalize | "How do I make it mine?" | `personalize` | `/personalize` (composes `/change-font`) |
| Write | "How do I add my content?" | `write` | — |
| Launch | "How do I put it online?" | `launch` | `/launch` |
| Publish | "How do I push updates live?" | (launch) | `/publish` |
| Reset (optional) | "How do I start fresh?" | — | `/nuclear` |

**Entry A — Use this template (GitHub):** clone is owner-ready (has git history + remote) → `/setup` for local tooling + preview → personalize → write → `/launch` (already on GitHub, so mostly host setup) → `/publish`.

**Entry B — Download the zip:** open in Claude Code → `/setup` (install tools, `git init`, preview) → personalize → write → `/launch` (create GitHub repo + connect host) → `/publish`.

**Everyday loop:** edit by conversation → automatic checkpoint commit → `/publish` when ready to go live.

## Locked decisions

Each of these either follows from the ethos above or is the build discipline that keeps it coherent.

**The seed, operationally**

- **Expression is the owner's; the kit removes the friction. (Design compass, not a runtime rule.)** Every taste and identity decision belongs to the owner: the words, the look (colors, fonts, spacing), the brand (name, tagline, logo), the images and what is in them, and what they share. This shapes how *we build the kit*, rather than a labor contract we transcribe into the shipped `CLAUDE.md`: neutral-but-tasteful defaults (a starting point, never a stamp), skills that offer-and-preview instead of deciding (`/change-font` is the reference), a demo that reads as a real personal site worth making yours, and owner-facing prose that invites their voice without lecturing. Owning the expression means holding the direction and the final say, not doing the manual work; the kit takes the labor (mechanics, plumbing, and the writing itself whenever they want it). In the shipped `CLAUDE.md` this whole principle reduces to a single line of behavior: for choices about the site's look and identity, offer options and let the owner pick. The rest is our design job, not an instruction aimed at their Claude.

**Owner experience (flows from the seed)**

- **Owner vocabulary: two places, two verbs.** The canonical language every owner-facing surface reuses. Two places: your site *on your computer* (the **preview**) and your site *live* (on the web). Two verbs: **Save** (a local, reversible checkpoint, private to your computer) and **Publish** (send saved changes to the live site). Git / commit / push / deploy / repository / localhost stay Claude-internal and never appear in owner prose. Three ways to work follow from the seed: *delegate* (talk to Claude), *author directly* (write your own words, encouraged), and *operate the stack* (graduate to editing CSS/layouts and publishing via Git yourself: not tied to AI forever). Operating the full stack is reassurance, not a co-equal documented workflow.
- **Saves are an automatic, invisible undo buffer; publish is the milestone.** Claude commits quietly at natural stopping points (a requested change is complete and previews correctly, never mid-task or a broken state), with plain-language messages. The owner never sees, names, or thinks about commits; "undo" and "go back to this morning" are semantic requests Claude resolves against the buffer. This splits the two jobs a commit was overloaded with: the *safety net* is the automatic buffer (noise is fine, no human reads it), and the *meaningful milestone* is **publish**, which is already the deliberate, gated moment. Rejected: user-prompted saves (a non-technical owner will not save reliably, so "undo" fails when it is needed most, re-imposing the version-management burden git-as-undo exists to remove) and per-turn "is this a commit?" guessing (fuzzy, not a clean model). Accepted cost: a graduating owner inherits a noisy history (squashable, rare, base-diff unaffected). The asymmetry is the point: save is frequent and effortless-by-design, so automatic; publish is rare and outward-facing, so always confirmed.
- **Prefer plain, but capability is not forbidden. Self-host it.** The no-dependencies stance is anti-bloat and pro-privacy, not anti-capability. Default to the plain Hugo/CSS/JS way; when a real need arises (math via a vendored KaTeX, a lightbox, and the like), add it the kit's way: self-hosted (no external CDN or third-party request, the same ethos as the self-hosted fonts), no npm or build step, wired through Hugo's existing pipeline (a component in `assets/css/`, a module from `assets/js/`, or a shortcode), tradeoff explained first. Reject framework/npm bloat and external calls, not justified additions.
- **`/personalize` is the make-it-yours flow; it composes `/change-font`.** The personalize *page* teaches what is changeable; the `/personalize` *skill* is the guided first-run pass through identity choices (name, tagline, colors, font, logo/favicon) that embodies the seed: offer options, preview, follow their taste. It *delegates* the font step to `/change-font` rather than absorbing it (kept standalone for reuse). Scope is the guided identity-setup moment, typically right after `/setup`; everyday tweaks stay conversational, no skill. Layer-2 on the DAG: decided now, stubbed, fleshed after the spec pair.

**Build discipline**

- **Pages teach; skills do.** A page answers "what is this, and how do I decide?" (narrative, readable without Claude, no commands or mechanics); a skill answers "do it with me now" (steps, commands, templates, Claude-internal mechanics, expectation-setting). Each concept is defined once at its home and referenced elsewhere, never redefined: the working model in `get-started`; fonts and logo in `personalize`; hosts, domain, and cost in the `launch` page. Handoff always runs page → skill ("when you're ready, run /X"); skills do not re-teach, they proceed or give a one-line orientation and point back. Not every stage needs both (`write` is page-only; `change-font` is a skill whose concept lives in `personalize`). This single-source-of-truth rule is what prevents the launch skill↔page drift.
- **Guides are human scaffold; Claude operates from `.claude/`.** The onboarding pages (`content/pages/`) exist for the *owner* to read; Claude never loads them unless explicitly directed and draws all its operating knowledge from `.claude/CLAUDE.md` + skill descriptions. Two consequences. (1) The Claude context must stay dialed to cover operating knowledge on its own: anything an owner needs to *do* must be reachable by conversation (a skill or `CLAUDE.md`), never only by reading a page. The pages add readable-without-Claude narrative and the Markdown tutorial, which are convenience, not operating dependencies. (2) `/nuclear` may therefore clear the guide pages as part of a fresh start (a real published site shouldn't carry the kit's onboarding pages), because removing them costs the owner a reference but costs Claude nothing. Guard: nuclear is built for the clear-the-demo moment, so it must first detect signs of an in-use site (a launch marker in `hugo.yaml`, or substantial owner content) and, if found, warn hard and require explicit confirmation before wiping, since someone who has already launched rarely means to nuke their real site.
- **Owner-facing context lives in `get-started`, not a standalone page.** The kit explains *how you work with it* — talk-to-Claude vs. edit-the-Markdown-yourself, the skill list, local vs. live — inside `get-started`, kept practical rather than a "how Claude Code works" lecture. Promote to its own page only if it outgrows a section. Correspondingly, `CLAUDE.md` (the brain) does **not** enumerate skills (their descriptions auto-load) and drops the "first time here" section; the make-it-yours flow belongs to `personalize`.
- **CLAUDE.md is ordered for Claude, not for the owner's journey.** The brain is reference loaded every turn, so it's ordered by precedence/frequency (identity → working style → where things live → everyday tasks → look-and-feel → checkpoints → preview/publish), not the discover→publish chronology the owner experiences. The chronology is the pages' job. Its content is pruned to what is non-default and project-specific (Anthropic's test: would removing this cause Claude to make mistakes?); self-evident or default-agent behavior ("just do it", "small reversible steps") is cut, since a bloated brain gets ignored.
- **Two one-time gates, tracked differently.** The owner clears two hurdles once each: **setup** (local tooling, version control, a running preview) and **launch** (online, with a deploy pipeline). Their state is how skills know where the owner is. Setup has no marker; it is inferred from the environment (Hugo + Git installed, the project is a git repo, the preview runs), so `/setup` is idempotent and safe to re-run. Launch is recorded explicitly as `params.launch` (host + date) in `hugo.yaml`, written by `/launch` once the site is confirmed live; `/publish` reads it to shape its message and `/nuclear` reads it as the in-use signal that gates a wipe. A fresh clone carries no marker, so it reads as un-launched.
- **Git history stays a plain trail, never rewritten.** Both entry paths start clean (template = single squashed base commit; zip + `/setup` = fresh `git init` whose first commit is the base state). No skill rewrites history (no orphan-root squashes, `filter-repo`, or force-pushes). This preserves the owner's undo history, keeps the base state diff-able against the starter kit, and avoids destructive git surgery for negligible `.git`-size savings. `/launch` does not "start history fresh"; `/nuclear` clears the working tree but leaves history (and its recovery checkpoint) untouched.
