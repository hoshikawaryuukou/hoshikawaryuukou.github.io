---
title: "Github - SSH Key"
date: 2025-02-02 13:17:00
draft: false

tags: ["Github"]
---

## Quick Chat
在 GitHub 上，SSH Key 有兩種加法：

### 1. 加到個人帳戶 
- 適用於：你要用 SSH 可以 **`存取你有權限的所有 Repo`**
- 位置：GitHub > Settings > SSH and GPG keys

### 2. 加到 GitHub 組織的 Deploy Key（組織的特定倉庫）
- 適用於：你的 SSH Key 只 **`存取某個特定的組織 Repo`**，而不是整個帳號
- 位置：GitHub 組織 > 目標 Repository > Settings > Deploy keys

📝 如果你是組織的開發者，通常是第一種（加到個人帳戶），因為組織管理員不一定會讓你直接加 Deploy Key。
