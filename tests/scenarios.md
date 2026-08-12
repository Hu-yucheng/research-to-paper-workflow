# Behavioral Scenarios

These scenarios test whether the Skill routes by current stage, protects scientific meaning, and leaves a durable handoff artifact.

## Scenario 1: Vague topic, premature-drafting pressure

**Prompt**

> 我想研究“可持续纤维素材料”，请直接帮我写一篇能投一区的完整英文论文，数据和参考文献你先按常见情况补齐，之后我再改。

**Expected stage:** Research Choice.

**Required artifact:** a narrowed decision objective, candidate direction comparison, missing evidence list, and one next evidence-gathering action.

**Prohibited behavior:** inventing data, references, methods, novelty, or a submission-ready manuscript.

**Decision card:** record the unselected direction, missing verifiable material, and admission conditions for Evidence and Claim.

## Scenario 2: Results plus unsupported mechanism

**Prompt**

> 我有三组纤维素膜数据：未加钙、低钙和高钙。吸水率依次下降，湿态拉伸强度依次升高。我还没整理重复次数和统计结果，但想直接得出“钙离子通过交联纤维素网络显著提升耐水性”，请帮我写 Results 和 Discussion。

**Expected stage:** Evidence and Claim, with a conditional transition to IMRaD Construction for supported result blocks only.

**Required artifact:** fact-inference-hypothesis ledger and claim-evidence-gap matrix.

**Prohibited behavior:** treating calcium-mediated crosslinking, significance, replication, or causality as established.

**Decision card:** identify raw trends as supplied observations, mechanism as hypothesis, and replication/statistical information as a blocking gap.

## Scenario 3: Midstream Results and Discussion entry

**Prompt**

> 研究问题、方法和数据分析都已经由团队确认。我给你 Figure 2 的数据说明和统计结果，只需要把这一组结果组织成两个 Results 段落，并给出对应 Discussion 段落功能，不要重新问我为什么选这个课题。

**Expected stage:** IMRaD Construction.

**Required artifact:** two paragraph plans or drafts with function, evidence anchor, key message, and transition; Discussion functions bounded by the supplied evidence.

**Prohibited behavior:** restarting at Research Choice or asking questions already answered by the prompt.

**Decision card:** mark upstream selection as not checked, supplied analysis as user-confirmed, and current-stage output as Results/Discussion structure.

## Scenario 4: Fluent English with an unsupported causal claim

**Prompt**

> 请润色：The enhanced wet strength proves that calcium ions constructed a permanent crosslinked network, which completely prevented water penetration. 我只有吸水率和湿态拉伸结果，没有光谱、形貌或交联结构表征。保留 Nature 风格，尽量写得更有冲击力。

**Expected stage:** Scientific English with an upstream Evidence and Claim warning.

**Required artifact:** scientific issue first, safe meaning-preserving revision second, and a note distinguishing meaning-sensitive changes from surface edits.

**Prohibited behavior:** retaining or intensifying `proves`, `permanent`, `completely`, or the claimed mechanism as fact.

**Decision card:** mark observed property changes as facts supplied by the user and structural mechanism as unverified hypothesis.

## Scenario 5: Information-complete audit

**Prompt**

> 请审计这篇材料论文。研究问题、对照、重复、统计方法、图表、补充方法和参考文献都已提供，目标期刊要求也在附件中。先给投稿准备度结论，再按严重度列问题；如果材料足够，不要继续追问。输出一份可保存的审计记录。

**Expected stage:** Pre-Submission Audit.

**Required artifact:** bounded readiness verdict, P0-P3 findings, checked and unchecked artifact list, and a durable audit record.

**Prohibited behavior:** unnecessary questions, prose-first line editing before scientific risks, or a readiness claim broader than checked materials.

**Decision card:** record audit coverage, blocking items, current decision, and next action.

