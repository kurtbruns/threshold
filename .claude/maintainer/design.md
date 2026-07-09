# Threshold maintainer design notes

## 1. What Threshold is

Threshold is a starter kit for a personal website you run by talking to Claude Code. Underneath it's a plain Hugo site: a small, deliberately unflashy theme, the skills and instructions under `.claude/` that let Claude run it, and a real demo to start from. There is no npm and no build step, just Hugo with hand-written CSS and JavaScript. Everything the site needs is served from the site itself, fonts included, so it never calls out to another server. The owner brings the words, the look, and the judgment; the kit brings the plumbing.

## 2. Who it's for: one audience, several perspectives

Threshold is for a capable, curious person who has never built a website. They might be technical in another field, but they lack both the specific know-how and the confidence to begin. Claude Code carries the technical burden, so the kit can meet them where the project usually stalls: not in wanting a site, but in the setup and launch that stand between wanting one and having one.

These are the perspectives to keep in mind when authoring the kit. Most are the same person at a later moment; one, the shopper, hasn't committed to it yet. Each asks its own question and looks at a different part of the kit, so each doubles as a lens for reviewing that part end to end.

| Perspective | Their question | What they're looking at | What serves them |
| --- | --- | --- | --- |
| **The shopper** (may never adopt) | "What is this? Is it for me?" | README, template page, live demo | the front door (README) |
| **The arrival** | "How do I get this running?" | get-started page, the repo they just opened | `/setup` (hurdle 1) |
| **The maker** | "How do I make it mine and add my stuff?" | personalize and write pages, `variables.css`, `assets/`, `content/` | `/personalize`, conversation |
| **The launcher** | "How do I put it online, and what does it cost?" | launch page, host options | `/launch` (hurdle 2) |
| **The regular** | "How do I change something and push it live?" | nothing new, just talks to Claude | `CLAUDE.md`, automatic Save, `/publish` |
| **The tinkerer** | "Can I just do this myself?" | `assets/`, `layouts/`, git | the kit not fighting them: plain formats, no lock-in |

The arrival and the launcher face the two hardest moments, which are the kit's whole reason to exist (§4). The last, the tinkerer, is where "graduation" lives: the kit never pushes anyone there, but it takes care not to bar the door (see the non-goal note at the end).

## 3. How they work with it

There are three ways to work, and the owner moves freely between them.

**Delegate.** The default: describe what you want and Claude does it. This is how most changes happen, and it is the right mode for the technical work: adding a photo to the home page, changing the site's layout, or switching the font.

**Author directly.** Open the Markdown and write it yourself. This is encouraged wherever the words are the point, like the About page and blog posts, and it is a standing reminder that the site is plain files the owner can edit with or without Claude.

**Operate the stack.** Edit the CSS and layouts, and run git yourself. This is the tinkerer's door from §2. The kit is built so this is possible, but it never asks anyone to do it; it is an option, not a step.

However they work, the shape of the journey is the same. There are two ways in, GitHub's "Use this template" or a downloaded zip, and both converge on one everyday loop: edit the site by conversation, Claude saves a checkpoint quietly, and the owner publishes when a batch of changes is ready to go live.

The kit speaks a deliberately small vocabulary. There are two places, the **preview** on your computer and the **live** site on the web, and two verbs, **Save** and **Publish**. Save is an automatic, reversible checkpoint the owner never has to think about. Publish is the deliberate, confirmed step that sends saved work to the live site. Git, commits, pushes, and deploys stay under the hood. This is not concealment or training wheels; it is a simple, well-engineered practice that stands on its own terms, and anyone who wants to work with git directly still can.

## 4. The two hurdles

Setup and launch are the two walls a first-timer hits, and getting the owner over both is what the kit is for. Everything in between, the writing and the look, is the part they came to do; these two are the parts that would otherwise stop them. So each is owned by a page that explains the choices and a skill that does the work.

**Setup** gets the site running on the owner's computer. The get-started page explains it and `/setup` does it: check for Hugo and git, install what is missing, put the project under version control so there is an undo history, and start the preview so the owner lands on a site they can see. How they arrived changes only a little. A "Use this template" clone already has git and a remote, so setup mostly installs tools and starts the preview; a downloaded zip has neither, so `/setup` runs `git init` first. Setup leaves no marker. Its state is read from the environment, which is why `/setup` is safe to run again at any time.

**Launch** gets the site online. The launch page covers the choices, the cost, and the hosts, and `/launch` does the work: put the project on GitHub, set up a build-and-deploy pipeline that runs on every push, and connect the chosen host. Launch happens once, and unlike setup it leaves a marker. `params.launch` in `hugo.yaml` records the host and date, and from then on the everyday `/publish` reads that marker and takes over going live.

At both walls the division of labor is the same. Claude does the plumbing; the owner makes the decisions and holds anything personal, the host account, the payment, the domain, the secrets. The kit removes the technical friction; it does not take the wheel.

## 5. The kit at a glance

A map of what is in the kit and the few decisions that shape each part, not a file-by-file inventory.

**Context** lives in `.claude/`. It is what lets the owner run the site by conversation: the operating context (`CLAUDE.md`) that Claude loads every session, a set of skills for the procedures worth guiding, and a permissions file that scopes what Claude may touch. The skills share a common shape, described in §6.

**Content** is the demo site: a home page, an About page, a small blog, and the four onboarding guides under `content/pages/`. The demo does double duty. It has to read as a real personal site worth making your own, and it teaches, because the guides are both the documentation and the example. It is also disposable: `/nuclear` clears it to a blank slate when the owner is ready to make the site truly theirs.

**Theme** is a sensible, clean, unopinionated default that holds the owner's identity rather than imposing one of its own. It is built to be modified, and the things an owner would most want to adjust are made easy to reach: how wide the content is, the background color, the fonts. Adjusting those is where the owner jumps in and the site starts to feel like theirs, and Claude can take it further whenever they ask.

**Structure** is deliberately plain. A single `hugo.yaml` holds the configuration, with no multi-environment scaffolding. The whole asset pipeline runs through Hugo itself: stylesheets are concatenated in a set order, JavaScript is bundled by Hugo's built-in esbuild, and every image passes through one partial that makes it responsive. Links and images also run through render hooks that validate them at build time. Two scripts sit alongside: `hugo-version.sh`, the single source for the pinned Hugo version, and `dev-hugo.sh`, which runs the preview.

## 6. Design invariants

These are the rules that keep the kit coherent as it grows. Each states a constraint and, in brief, why it holds.

**Pages teach; skills do.** Each concept has a single home. A page explains what something is and how to decide about it, in plain narrative with no commands. A skill does the work, with the steps and mechanics. When a page reaches the point of action it hands off to a skill, and the skill does not re-explain. Defining each concept once is what keeps a page and its skill from drifting apart.

**Skills follow one contract.** Every skill has the same shape, and the shape is the safety model. A skill sets `disable-model-invocation`, so it runs only when the owner asks for it, and it lists a tightly scoped set of `allowed-tools`, so it can touch only what it needs. If it acts on the environment, it starts by reading that environment instead of assuming. It asks for confirmation exactly once, at the single outward or destructive step, and not for ordinary edits. And it hands back in plain language. The same shape every time makes a skill predictable to build, to read, and to trust.

**State is read, not stored.** Skills coordinate without a database. Setup has no marker at all; its state is inferred from the environment, which is why `/setup` can be run again safely. Launch writes a single marker, `params.launch` in `hugo.yaml`, and both `/publish` and `/nuclear` read it to know the site is live. A fresh clone carries no marker, so it correctly reads as not yet launched.

**No dependencies, and everything self-hosted.** There is no npm and no build step beyond Hugo itself. Fonts and assets are vendored or generated locally, and the site makes no outside requests, which a maintainer can confirm by grepping the layouts and assets for external hosts and finding none. When the kit needs a new capability, it arrives the kit's way: a CSS component, an ES module, or a Hugo shortcode, wired through the existing pipeline, never an npm package or a call to another server. The same rule covers any asset the owner brings in, like a font or an icon: it is downloaded and self-hosted, not linked from a third-party server at runtime.

**The build fails loudly rather than ship something broken.** Broken internal links and missing images stop the build, so neither can reach the live site. Raw HTML is left off, which is simply Goldmark's default that the kit chooses not to override. The Hugo version is pinned as a floor for the owner and as the exact version for CI, and the extended build is required because the image pipeline encodes WebP. Two layers keep a broken build off the live site: the publish flow builds before it pushes, so the owner sees the failure early, and the deploy pipeline builds again before going live, so a build that does not compile is never served.

**Git history stays a plain, unbroken trail.** Both ways in start from a clean base: the template is a single base commit, and a fresh `git init` from a zip makes its own. No skill ever rewrites history, so the owner's undo trail stays intact and the base state stays diff-able against the starter kit.

## On comments, a house style

Comments are context, and they earn their place the same way the owner context in `.claude/CLAUDE.md` does, with one difference in timing. `CLAUDE.md` loads every session; a comment loads only when Claude or the owner opens that file to change it. That is just-in-time context, delivered at the moment a change is being made and there is no room to re-explain, which is exactly what makes a good comment load-bearing. The test is the one Claude Code's own guidance applies to a line of `CLAUDE.md`: would removing it invite a wrong change? If not, cut it.

The house style, drawn from the kit's best comments:

- **Load-bearing or gone.** Keep a comment only where its absence would invite a mistake. The code already says what it does; delete anything that merely repeats it.
- **Say why, not how.** Carry what the code cannot show: the intent, the constraint, the reason a choice is non-obvious. Don't narrate how the language works.
- **Right altitude.** Concrete enough to steer the next edit, not a tutorial on Hugo or CSS.
- **One purpose per block.** Each block does a single job; if it is doing two, split it.
- **Pitch to the reader.** Owner-facing where an owner might land (a "change this to…" pointer, `variables.css`, `hugo.yaml`); terse and precise where only Claude reads, like the asset pipeline.
- **No em dashes.** Commas, periods, and semicolons carry every pause a comment needs.

Keep them short; a comment that has to be read twice is too long. And where a concept already has a home elsewhere (the first invariant), point at that home rather than restating it.

## On graduation, a stated non-goal

The kit is not designed to graduate anyone. It is a starter kit, not a course, and it never pushes the owner toward learning the stack. But because it is built to be simple, durable, and free of lock-in, the possibility is real: someone can learn from it and come to see a durable idea they can keep using in many shapes. That is an emergent result of the invariants above, not a program the kit runs. The guardrail for us is to keep it that way and not add scaffolding whose purpose is to teach the stack.
