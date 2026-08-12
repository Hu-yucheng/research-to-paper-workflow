# Research to Paper Workflow Promotional Images Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Generate three coherent academic-technology promotional images, embed them in the repository README, and verify their rendering on GitHub.

**Architecture:** Each image is generated as an independent raster asset with one narrative responsibility. Final assets live in `docs/images/`, while README placement creates a three-step visual story: identity, workflow, and evidence guardrail.

**Tech Stack:** Built-in image generation, PNG raster assets, Markdown, PowerShell validation, Git, GitHub.

## Global Constraints

- Use deep navy, indigo, teal, and cool-white highlights across all three images.
- Keep the images academic, restrained, and credible; avoid cyberpunk overload, watermarks, logos, book-cover copies, and author portraits.
- Use only the exact short titles and labels defined below.
- Save every selected final image under `docs/images/` before referencing it from README.
- Preserve the Skill's evidence boundary and revision order: Evidence → Argument → Structure → Language.

---

### Task 1: Generate the three-image campaign

**Files:**
- Create: `docs/images/hero-research-to-paper.png`
- Create: `docs/images/workflow-five-stages.png`
- Create: `docs/images/evidence-before-language.png`

**Interfaces:**
- Consumes: visual rules and exact copy from `docs/superpowers/specs/2026-08-12-promotional-images-design.md`
- Produces: three landscape PNG files consumed by README

- [ ] **Step 1: Generate the hero image**

Use the built-in image generation tool with this production prompt:

```text
Use case: ads-marketing
Asset type: GitHub README hero banner for a Codex Skill
Primary request: Create a premium academic-technology campaign image for a Skill that guides research from choosing a question to a submission-ready paper.
Scene/backdrop: deep navy research space with abstract data nodes on the left, a structured scientific paper taking shape in the center, and a clean audited manuscript on the right; a teal evidence stream connects the full journey.
Style/medium: polished editorial 3D illustration with restrained scientific interface graphics, precise and credible.
Composition/framing: wide landscape banner, strong central safe area, clear left-to-right progression, generous margins.
Lighting/mood: cool white and teal highlights, focused, intelligent, trustworthy.
Color palette: deep navy, indigo, teal, cool white.
Text (verbatim): "RESEARCH TO PAPER" and "Evidence-driven workflow · 证据驱动科研写作"
Constraints: exact text only; no logos; no book covers; no author portraits; no watermark; visually connect research choice, evidence, IMRaD, English revision, and audit.
Avoid: generic laboratory stock art, excessive neon, tiny unreadable body text, decorative equations without meaning.
```

- [ ] **Step 2: Generate the workflow image**

```text
Use case: scientific-educational
Asset type: GitHub README workflow infographic
Primary request: Visualize a five-stage evidence-driven research writing workflow as five distinct connected modules.
Scene/backdrop: deep navy scientific interface with one continuous teal data stream.
Subject: five modules in a left-to-right sequence, each with a unique icon: compass/decision, evidence nodes, structured paper sections, precise language editing, audit checklist. Additional subtle entry lines connect into every module to show that users may begin from their current stage.
Style/medium: high-end academic technology infographic, restrained 3D depth, crisp geometry.
Composition/framing: wide landscape, five balanced modules, readable at GitHub README width.
Color palette: deep navy, indigo, teal, cool white.
Text (verbatim): "FIVE-STAGE WORKFLOW · 五阶段工作流", "A CHOICE", "B EVIDENCE", "C IMRaD", "D ENGLISH", "E AUDIT"
Constraints: exact labels only; preserve order A to E; no extra prose; no watermark; no logos; no book covers.
Avoid: circular process, random arrows, cyberpunk clutter, illegible microtext.
```

- [ ] **Step 3: Generate the evidence guardrail image**

```text
Use case: scientific-educational
Asset type: GitHub README evidence guardrail infographic
Primary request: Show how four evidence states feed a disciplined manuscript revision pipeline.
Scene/backdrop: deep navy analytical workspace.
Subject: four translucent evidence cards labelled VERIFIED FACT, INFERENCE, HYPOTHESIS, UNKNOWN enter a horizontal audit pipeline labelled EVIDENCE, ARGUMENT, STRUCTURE, LANGUAGE; the output is one clean scientific paper page. Verified Fact is brightest and most grounded; Unknown remains visibly unresolved rather than being hidden.
Style/medium: premium scientific data visualization with subtle glass layers and crisp editorial geometry.
Composition/framing: wide landscape, evidence cards on the left, pipeline in the center, manuscript on the right.
Color palette: deep navy, indigo, teal, cool white, a small amber accent for unresolved uncertainty.
Text (verbatim): "EVIDENCE BEFORE LANGUAGE", "事实 · 推断 · 假设 · 未知", "VERIFIED FACT", "INFERENCE", "HYPOTHESIS", "UNKNOWN", "EVIDENCE", "ARGUMENT", "STRUCTURE", "LANGUAGE"
Constraints: exact text only; preserve revision order; do not imply that hypotheses or unknowns become verified automatically; no watermark; no logos.
Avoid: generic AI brain imagery, fake charts, excessive text, hidden uncertainty.
```

- [ ] **Step 4: Inspect every generated output**

Open each PNG at original detail and verify subject relevance, palette consistency, composition, text legibility, absence of watermarks, and the required scientific boundaries. Regenerate only the image that fails.

- [ ] **Step 5: Commit selected image assets**

```powershell
git add docs/images/*.png
git commit -m "feat: add promotional image set"
```

### Task 2: Integrate images into README

**Files:**
- Modify: `README.md`
- Test: `tests/validate.ps1`

**Interfaces:**
- Consumes: the three final PNG files from Task 1
- Produces: a GitHub-renderable visual narrative with meaningful alternative text

- [ ] **Step 1: Add the hero image below the opening blockquote**

Insert:

```markdown
![Research to Paper Workflow：从研究选择到投稿审计的证据驱动工作流](docs/images/hero-research-to-paper.png)
```

- [ ] **Step 2: Add the workflow image in the five-stage section**

Insert before the Mermaid diagram:

```markdown
![五阶段科研写作工作流：选择、证据、IMRaD、英语与审计](docs/images/workflow-five-stages.png)
```

- [ ] **Step 3: Add the evidence image in the core guardrails section**

Insert before the guardrail list:

```markdown
![证据优先于语言：事实、推断、假设与未知的分级审计](docs/images/evidence-before-language.png)
```

- [ ] **Step 4: Run structural and link checks**

```powershell
.\tests\validate.ps1
Test-Path '.\docs\images\hero-research-to-paper.png'
Test-Path '.\docs\images\workflow-five-stages.png'
Test-Path '.\docs\images\evidence-before-language.png'
git diff --check
```

Expected: structural validation succeeds, all three path checks return `True`, and `git diff --check` reports no errors.

- [ ] **Step 5: Commit README integration**

```powershell
git add README.md
git commit -m "docs: showcase promotional visuals"
```

### Task 3: Publish and verify

**Files:**
- No new files

**Interfaces:**
- Consumes: committed image assets and README integration
- Produces: updated `origin/main` and a visually verified GitHub repository page

- [ ] **Step 1: Confirm a clean, intentional commit range**

```powershell
git status --short
git log --oneline -5
```

Expected: no uncommitted files; recent commits include the design, image set, and README integration.

- [ ] **Step 2: Push current HEAD to GitHub main**

```powershell
git push origin HEAD:main
```

- [ ] **Step 3: Verify local and remote SHAs**

```powershell
git rev-parse HEAD
git ls-remote origin refs/heads/main
```

Expected: both commands report the same commit SHA.

- [ ] **Step 4: Read back the GitHub page**

Open `https://github.com/Hu-yucheng/research-to-paper-workflow`, reload it, and confirm that all three README images render, the five-stage workflow remains visible, and no broken-image indicators appear.
