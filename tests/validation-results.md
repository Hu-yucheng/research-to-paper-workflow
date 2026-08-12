# Validation Results

## Official validator

- command: bundled Python plus `skill-creator/scripts/quick_validate.py .`
- status: not run to completion
- exact blocker: `ModuleNotFoundError: No module named 'yaml'`
- claim boundary: official validation is not reported as passed.

## Dependency-free structural validation

The release check verifies:

- required runtime files and directories;
- valid UTF-8 for every tracked text file;
- frontmatter has exactly `name` and `description`;
- package name and `Use when...` description trigger;
- five routes and eight decision-card fields;
- local Markdown links resolve;
- balanced fenced code blocks;
- no unresolved `TODO` or `TBD` markers;
- P0-P3 audit levels;
- UI metadata and `$research-to-paper-workflow` default prompt;
- no empty tracked files or unexpected binary files;
- clean Git whitespace check.

Record the fresh command output in the release report before publishing.

## Behavioral validation

- baseline fresh-context run: not evaluated; local Codex CLI unavailable
- with-Skill fresh-context run: not evaluated; local Codex CLI unavailable
- behavior-pass claim: prohibited until scenarios are actually run and inspected

## Browser publication validation

- Chrome control status: blocked during development
- diagnostic result: Google Chrome is installed, but the ChatGPT/Codex browser extension is not installed in the selected profile and the native-host registry key is absent.
- publication claim: prohibited until the repository is created and read back in the user-authorized Chrome session.
