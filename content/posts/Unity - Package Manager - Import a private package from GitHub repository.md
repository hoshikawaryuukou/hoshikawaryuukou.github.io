---
title: "Unity - Package Manager - Import a private package from GitHub repository"
date: 2025-02-01 21:11:00
draft: false

tags: ["Unity", "Package Manager", "GitHub"]
---

## Quick Chat
Unity Package Manager (UPM) 支援從 Git repository 直接安裝與管理 package，這對於團隊開發和共享自定義 package 非常有用。

- ⚠️ 如果是 organization 協同，需開啟相關的成員權限。
- ⚠️ [Using private repositories with HTTPS Git URLs](https://docs.unity3d.com/Manual/upm-config-https-git.html)，提到的 Git Credential Manager 似乎不起作用。

## Solution 1 - SSH (建議)
- ⚠️ 需確保 SSH Key 已添加到 GitHub。

## Solution 2 - Personal Access Token 
- ⚠️ 建議使用較客製化的 Fine-Grained Token 
- ⚠️ Resource owner 要注意(如果有多個身分)

### Guide
- [Install Unity Package from a private GitHub repository](https://medium.com/@dasannikov/install-unity-package-from-a-private-github-repository-9a40066b335f)

### Steps
1. 至 GitHub  <<**帳戶設定**>>（非儲存庫設定）
2. Developer Settings  ->  Personal Access Tokens -> Fine-Grained Tokens
3. 生成 Token (**Read-Only Permission** for the repo **Content**).

```
"com.yourusername.yourpackage": "git+https://x-oauth-basic:<token>@<repo>?path=<folder>"
```
