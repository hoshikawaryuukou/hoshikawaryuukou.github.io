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

## Config
```bash
pnpm changeset init
```

## Usage
- [commands](https://changesets-docs.vercel.app/zh-CN/command-line-options)
- [團隊開發流程 & 發布流程](https://notes.boshkuo.com/docs/NodeJS/npm-packages/changesets#%E5%9C%98%E9%9A%8A%E9%96%8B%E7%99%BC%E6%B5%81%E7%A8%8B--%E7%99%BC%E5%B8%83%E6%B5%81%E7%A8%8B%E6%89%8B%E5%8B%95)
