---
title: "Javascript_TypeScript - Package - Changesets"
date: 2024-07-12 08:11:00
draft: true

tags: ["JavaScript", "TypeScript", "Version control"]
---

## Quick Chat

> A tool to manage versioning and changelogs with a focus on multi-package repositories

適合 monorepo 的版本管理工具，能夠追蹤每個子套件的變更，生成變更日誌，並支援語意化版本控制。它簡化了多套件的版本管理，且能與 CI/CD 系統集成，自動化版本發佈流程。

### 🧠 核心思想
Changesets 的核心由 **變更日誌** 和 **版本控制** 兩部分組成：
- 添加 changeset 可以由貢獻者在 PR 中完成，確保在更改意圖仍清晰時記錄下來。
- 版本控制會結合多個 changeset，並作為整體進行審查。

### ♻️ 工作流循環
- **add**: 添加變更至變更集合。
- **version**: 消耗所有變更集合，更新語意化版本，並寫入變更日誌。
- **publish**: 發佈新版本。

## Guide
- [changesets/changesets](https://github.com/changesets/changesets)
- [Using Changesets – changesets documentation](https://changesets-docs.vercel.app/)
- [Changesets - 為 monorepo 而生的版本管理工具](https://notes.boshkuo.com/docs/NodeJS/npm-packages/changesets)
- [Simplify Package Versioning with Changesets for GitLab Private Registries](https://medium.com/@haleywardo/simplify-package-versioning-with-changesets-for-gitlab-private-registries-4306762c9e29)
- [Automate NPM releases on GitHub using changesets 🦋](https://dev.to/ignace/automate-npm-releases-on-github-using-changesets-25b8)
- [使用 pnpm、turborepo 构建 monorepo 项目，changesets 管理日志和版本详解，从零至 github actions（CI）云端缓存 发布 npm 流程](https://ksh7.com/posts/workspace-pnpm-turborepo-changesets/index.html#%E5%91%BD%E4%BB%A4%E5%88%9D%E5%A7%8B%E5%8C%96)

## Notice
- ⚠️ 由於 changesets 專注於發佈和變更日誌，並非每次變更都需要 changeset。
- 💡可以向 pull request 添加多個 changeset。
- 💡一個好的 changeset 中應該包括的是：
  - 變更是什麼。
  - 為什麼要做變更。
  - 消費者應該如何更新他們的代碼。

## Install
```bash
pnpm add -wD @changesets/cli 
```

## Usage

### 初始化
```bash
pnpm changeset init
```

### 追加變更
```bash
pnpm changeset
```
- key - enter : 跳過/確認
- key - space : 選擇(多選)
  
### 生成版本
```bash
pnpm changeset version
```

### 發布版本(手動)
```bash
pnpm changeset publish
```
- ⚠️ 此動作會消耗所有的 changeset
