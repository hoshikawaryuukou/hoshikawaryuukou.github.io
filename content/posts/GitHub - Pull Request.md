---
draft: false
title: GitHub - Pull Request
date: 2023-07-14T10:08:39+08:00
tags:
  - GitHub
---

## Quick Chat

> 有些環境也稱為合併請求（Merge Request）。

產品開發中，通常會指定一個分支作為可發布的正式版本分支（例如 `master` 或 `main`）。在多人協作時，讓每位開發者都能直接提交（Commit）至這個正式分支並非最佳實踐。

為了有效管理，可以採用 **Pull Request (PR)** 的方式來控制權限。當其他開發者完成工作後，他們會發起一個 PR。專案管理者在審核並確認無誤後，即可將其合併，這能確保產品分支始終處於隨時可發布的狀態。

若您參與開源專案，在建立 PR 前，建議先在本地分支上執行 `git rebase` 指令，將您的變更建立在最新的程式碼進度之上，這有助於降低審核者的理解與合併難度。

## Guide

- [與其它開發者的互動 - 使用 Pull Request（PR）](https://gitbook.tw/chapters/github/pull-request)