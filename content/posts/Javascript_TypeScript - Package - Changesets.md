---
title: "Javascript_TypeScript - Package - Changesets"
date: 2024-07-12 08:11:00
draft: true

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat

> A tool to manage versioning and changelogs with a focus on multi-package repositories

適合 monorepo 的版本管理工具，能追蹤每個子套件的改動，生成變更日誌並支援語意化版本控制。它簡化了多套件的版本管理，並能與 CI/CD 集成，實現自動化版本發佈。

## Guide
- [changesets/changesets](https://github.com/changesets/changesets)
- [changesets | 开发笔记](https://peiyanlu.github.io/vite-press/frontend/npm/changesets)

## Install
```bash
pnpm add -wD @changesets/cli 
```

## Config
```bash
pnpm changeset init
```

