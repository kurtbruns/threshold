<!-- Maintainer build state & priorities for the Threshold kit.
     Committed for history, but a MOVING TARGET: prompt-on-demand, NOT
     auto-imported into the frame. design.md is the stable intent; this file
     is what's actually built and what to work on next. Keep it short and
     current; when it goes stale it's worse than absent. -->

# Threshold build state and priorities

The companion to [`design.md`](design.md). Where `design.md` describes the *intended* design, this file tracks what is actually built and what to do next. It moves often, so it is deliberately **not** auto-imported into the maintainer frame; pull it in when planning a build pass.

## Build state

**All of the kit's prose is written and final.** Every page, skill, and document has settled content:

- **Spec & front door:** `maintainer/design.md`, `README.md`.
- **Owner context:** `.claude/CLAUDE.md`.
- **Onboarding pages:** `get-started`, `personalize`, `write`, `launch`, plus `content/_index.md` and the demo.
- **Skills:** `setup`, `launch`, `publish`, `nuclear`, `upgrade-hugo`.

Theme, layouts, image system, `hugo.yaml`, and scripts are shipped and working. `design.md` §5 is the map of what's where. A structural audit already ran and passed clean (the self-hosted and no-dependencies invariants), so what's left is coherence, not structure.

## Next: a cross-kit coherence review

Each part of the kit was written on its own. The next pass reads the whole thing end to end and checks that the finished pieces agree with each other — the kind of drift that writing them separately can't catch. It proposes fixes; it does not rewrite settled prose.

Check, across surfaces:

- **Vocabulary** (`design.md` §3). The kit speaks a small, deliberate vocabulary: two places (**preview**, **live**) and two verbs (**Save**, **Publish**), with git, commits, pushes, and deploys under the hood. Flag any drift, and watch for outdated phrasings that contradict §2–§3: "non-technical", "artists/designers/writers", "two ways", "live preview".
- **Audience** (`design.md` §2). Every surface is pitched to the one audience: a capable, curious first-time site-builder, met where the project stalls, never talked down to.
- **Page ↔ skill seams** (`design.md` §6, "pages teach; skills do"). Each concept has one home: the page explains and hands off, the skill does the work and doesn't re-explain. Read each page against what it hands to (get-started↔setup and launch↔launch to their skills; personalize↔`CLAUDE.md`, since personalization has no skill and hands off to conversation) and check the seam holds.
- **Skill contract** (`design.md` §6). All five skills share one shape: `disable-model-invocation`, tightly scoped `allowed-tools`, read the environment before acting, one confirmation gate, plain-language hand-back — and a description that leads with what and when, no mechanics narration. `publish` and `upgrade-hugo` are the reference implementations; judge the rest against them.
- **Cross-links and shared facts.** Inline links and "What's next" footers resolve and point sensibly, and any fact stated in more than one place agrees (which skill installs which tool, the two hosts, the launch marker, cost figures).
- **Invariants across surfaces** (`design.md` §6): self-hosted / no dependencies, the build fails loud, state is read not stored, git history stays a plain trail.

**Scope note.** The vocabulary and audience lenses are about what the **owner reads or hears** — the pages, home, README, and the skills' owner-facing messages. Claude-facing context (`CLAUDE.md`, skill mechanics) only has to stay *consistent* with what the owner is taught; it need not speak the owner vocabulary. `design.md` and this file are the yardstick, not subjects of the review.

## Known and intentional — do not "fix" these

- The **launch page has no "What's next" footer**: it's the terminal page and ends on the payoff.
- The **`about` / `blog` demo is deliberately light** (`design.md` §5) — Threshold's own honest site, not a gap.
- Two structural micro-items were assessed and left as-is: the `params.launch` read in `publish` is a stable two-space coupling (producer and consumer both ours), and the container-width vs image `sizes` gap is a harmless micro-optimization.
- The **own-the-stack / "Working with Robots" philosophy is parked in issue #32**, seeking a home (a new guide, blog post, or video). A known open thread, not a missing surface.

## Working discipline

- Read across the whole kit, not one document at a time. `design.md` is the source of truth for intent; this file for decisions already made.
- Propose each fix as a diff the owner reviews in their IDE before committing. Commit scoped with `git commit -- <pathspec>` so unrelated staged work stays untouched.
- Anything destructive or high-stakes warrants a pause, not a silent change.
