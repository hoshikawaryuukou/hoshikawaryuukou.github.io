---
title: "Development Standards - Conventional Commits"
date: 2024-11-05 20:11:00
draft: false

tags: ["Development Standards"]
---

## Quick Chat

以下是 Conventional Commit 的一些主要好處 : 
- **一致性**：統一提交訊息格式，便於理解和閱讀。
- **自動化支持**：助力自動生成變更日誌，並與 CI/CD 等工具無縫整合。
- **版本控制友好**：與 Semantic Versioning 搭配良好，根據提交類型自動升級版本。
- **提高溝通效率**：簡明的訊息格式促進團隊內溝通與代碼審查。
- **歷史追蹤**：規範化提交便於回溯和維護，增強項目可讀性和可維護性。

## Guide
- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [conventional-changelog/commitlint](https://github.com/conventional-changelog/commitlint)
- [commitizen/cz-cli](https://github.com/commitizen/cz-cli)

## Usage

### samples
- chore(deps): add dependencies
- chore(deps): update pnpm to v9.12.3
- chore(release): 9.12.3
- ci: rename audit job
- feat!: the link command should add overrides