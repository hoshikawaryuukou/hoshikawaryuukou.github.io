---
draft: false
title: Workflow – Host Unity Web Game on GitHub Pages
date: 2025-08-18T20:38:51+08:00
tags:
  - Workflow
  - Unity
  - Github
---

## Quick Chat

- ⚠️ 在 Unity 中需啟用 **Decompression Fallback**（因 GitHub Pages 不支援壓縮檔案）。
- ⚠️ **僅 Public Repository** 可免費使用 GitHub Pages。

以下提供兩種簡單的部署方式（此處不討論 CI 自動化）：

## 方法一：建立獨立的 Public Repository

1. 建立一個新的 **Public Repository**。
2. 將 Unity WebGL 的建置輸出檔案上傳至該 Repository。
3. 在 GitHub 設定中，指定包含 `index.html` 的資料夾，即可完成部署。

## 方法二：孤兒分支 (Orphan Branch)

我已封裝好一個 PowerShell 工具，能快速完成部署：

👉 [MGST-PowerShell-Toolkit/GH-Pages-Deploy](https://github.com/hoshikawaryuukou/MGST-PowerShell-Toolkit/tree/main/GH-Pages-Deploy)

此工具能將指定 Git 倉庫中的建置成果部署到 GitHub Pages 的 `gh-pages` 分支。  
它透過 **Git worktree** 與 **孤兒分支（orphan branch）** 技術，能在不影響主分支開發的情況下，獨立維護部署內容。

請先確認目標目錄符合以下結構：

```bash
project-root/              
├── .git
└── Builds/
```






