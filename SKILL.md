---
name: research-to-paper-workflow
description: Use when choosing a research direction, organizing literature or experimental evidence, separating claims from hypotheses, planning or drafting IMRaD sections, revising scientific English without changing meaning, or auditing a manuscript before submission.
---

# Research to Paper Workflow

## Overview

Move a research project from its current stage to the next inspectable artifact. Enter at any stage, but never let polished language conceal an unresolved evidence gap.

## Core Contract

1. Identify the current stage from the supplied material.
2. Identify what is verifiable and what is missing.
3. Confirm the concrete artifact needed this turn.
4. Advance only the current stage unless its admission condition is met.
5. End substantive work with the decision card.

Infer answers already present in the input. Ask at most one question, and only when its answer would materially change the artifact. When possible, produce a useful partial artifact before asking.

Revise in this order:

`evidence -> argument -> structure -> language`

## Route by Current Stage

| Observable situation | Route | Load | Primary artifact |
|---|---|---|---|
| Comparing topics, directions, supervisors, environments, or plans | A. Research Choice | [research-choice.md](references/research-choice.md) | Decision record and comparison matrix |
| Holding literature, observations, data, figures, or interpretations | B. Evidence and Claim | [evidence-and-claims.md](references/evidence-and-claims.md) | Fact-inference-hypothesis ledger and claim-evidence-gap matrix |
| Scientific meaning is stable enough to organize sections or paragraphs | C. IMRaD Construction | [imrad-functions.md](references/imrad-functions.md) | Functional outline, paragraph plan, or bounded draft |
| Meaning is explicit and the task is English revision | D. Scientific English | [scientific-english.md](references/scientific-english.md) | Meaning-preserving revision and change notes |
| A partial or complete manuscript needs integrated review | E. Pre-Submission Audit | [audit-rubric.md](references/audit-rubric.md) | Readiness verdict and P0-P3 findings |

Route to the latest stage supported by the material. Do not force a user with confirmed methods and results back through topic selection. Record upstream state as `passed`, `not checked`, or `blocked`.

If a request spans stages, complete the earliest unresolved stage that controls downstream validity. Safe downstream work may proceed separately when it does not depend on the unresolved issue.

## Protect the Scientific Boundary

Use these labels consistently:

- **Verified fact**: directly supported by supplied data or a checked source.
- **Inference**: an interpretation supported indirectly or conditionally.
- **Hypothesis**: a testable explanation not yet established.
- **Unknown**: information required before evaluation.

Never invent data, sample sizes, statistical significance, methods, controls, citations, experimental conditions, novelty, or mechanisms. Never strengthen certainty, causality, generality, or novelty during polishing.

If evidence conflicts, show the alternatives and mark each item `verified`, `pending verification`, or `cannot determine`. State the observation, analysis, or source check that could discriminate among them.

When current or external evidence is required, verify with available research tools when authorized and cite checked sources near the supported claim. Otherwise label the claim unverified.

## Maintain the Research Dossier

Use [research-dossier-template.md](assets/research-dossier-template.md) as the durable schema. Create or update a file only when the user requests a saved artifact or supplies a working directory. Otherwise render the relevant section in the response.

Do not silently replace an earlier scientific decision. Record what changed, why it changed, and which new evidence caused the change.

## Output the Decision Card

End every substantive invocation with:

```markdown
## 本轮决策卡

- 当前阶段：
- 已确认事实：
- 待验证推断或假设：
- 本轮关键决定：
- 形成的成果：
- 未解决问题：
- 下一阶段准入条件：
- 建议下一步：
```

Keep it compact and evidence-based. Do not report a task as complete without an inspectable artifact or completion evidence.

## Handle Common Failure Modes

- **Insufficient material:** produce the useful partial artifact, list the blocking gap, then ask one question if necessary.
- **Midstream entry:** perform the requested stage and expose unchecked upstream assumptions without restarting irrelevant work.
- **Language request with logic failure:** report scientific issues first, then make only safe edits independent of those issues.
- **Submission audit with missing attachments:** bound the verdict to what was actually checked and list unchecked artifacts.
- **Full-paper request before evidence is stable:** produce the current-stage artifact, not plausible filler.

## Example

User: “三组纤维素膜的吸水率下降、湿态强度升高，因此钙离子交联了网络。帮我写 Results 和 Discussion。”

Route to Evidence and Claim. Treat the supplied property trends as observations, the calcium-mediated network as a hypothesis, and missing replication/statistics/structural characterization as gaps. Draft only result blocks supported by available evidence; do not turn the proposed mechanism into fact.

## Source Boundary

This Skill is an independent workflow synthesis. Read [source-map.md](references/source-map.md) when explaining provenance, refining the Skill from user-supplied book notes, or preparing public documentation. Do not reproduce chapters, proprietary exercises, or long quotations.

