# Research to Paper Workflow 宣传图设计

## 目标

为 GitHub 仓库制作三张统一视觉体系的宣传图，使读者在进入 README 后依次理解：这个 Skill 是什么、它怎样工作、它如何约束科研论证。

## 采用方案

采用“三图叙事组”，而不是单张超长信息图或纯氛围概念图。

1. `hero-research-to-paper.png`：仓库首屏横幅，传达“从研究选择到可投稿论文”的整体定位。
2. `workflow-five-stages.png`：解释 A–E 五阶段工作流及任意阶段进入机制。
3. `evidence-before-language.png`：突出 Verified Fact、Inference、Hypothesis、Unknown 四级证据边界，以及“证据 → 论证 → 结构 → 语言”的修订顺序。

## 视觉语言

- 主色：深海军蓝、靛蓝、青绿和少量冷白高光。
- 意象：论文页面、数据点、网络连线、流动轨迹、审计节点、结构化卡片。
- 风格：高端学术科技感，清晰、克制、可信；避免赛博朋克霓虹过载。
- 版式：GitHub README 友好的横向构图，重要信息集中在中央安全区，移动端缩放后仍能识别主体。
- 文字：中英双语但保持极少。生成图只承载短标题和阶段标签，详细解释留在 README 正文。
- 边界：不复制三本书封面，不使用作者肖像，不呈现为三本书的官方改编。

## 三张图片

### 1. Hero

- 标题：`RESEARCH TO PAPER`
- 副标题：`Evidence-driven workflow · 证据驱动科研写作`
- 画面：左侧抽象研究问题与数据节点，中央论文结构逐步成形，右侧形成经过审计的成稿；青绿色数据流贯穿全图。
- 用途：README 标题下方，承担首屏识别。

### 2. Five-Stage Workflow

- 标题：`FIVE-STAGE WORKFLOW · 五阶段工作流`
- 标签：`A CHOICE`、`B EVIDENCE`、`C IMRaD`、`D ENGLISH`、`E AUDIT`
- 画面：五个独立但相连的模块，由左至右推进；额外的数据入口线连接各阶段，表达“可从当前材料所在阶段进入”。
- 用途：README 的“五阶段工作流”章节。

### 3. Evidence Before Language

- 标题：`EVIDENCE BEFORE LANGUAGE`
- 副标题：`事实 · 推断 · 假设 · 未知`
- 标签：`VERIFIED FACT`、`INFERENCE`、`HYPOTHESIS`、`UNKNOWN`
- 画面：四层透明证据卡片进入一条审计管线，依次通过 Evidence、Argument、Structure、Language，最后形成干净的论文页。
- 用途：README 的“核心护栏”章节。

## 文件与 README 集成

- 图片统一保存至 `docs/images/`。
- README 使用相对路径嵌入，确保 GitHub 与本地预览均可解析。
- Hero 放在主标题和简介之间；工作流图放在 Mermaid 图之前；证据图放在“核心护栏”列表之前。
- 为每张图提供有意义的中文替代文本。

## 验收标准

- 三张图片均围绕 Skill 的真实结构，不是通用科研壁纸。
- 标题和关键标签可辨认，无明显乱码、水印或无关品牌。
- 三图色彩、光线、图形语言一致。
- 图片已保存到仓库并被 README 引用。
- 本地图片文件可读取，README 相对链接存在，结构校验继续通过。
- 提交推送后，在 GitHub 页面回读确认三张图片均已渲染。
