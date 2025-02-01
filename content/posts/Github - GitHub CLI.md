---
title: "Github - GitHub CLI"
date: 2025-01-29 13:16:00
draft: false

tags: ["Github"]
---

## Quick Chat
發現 GitHub 網頁面板上好像沒辦法直接刪除 deployment，得用 GitHub CLI 來操作。

## Guide
- [GitHub CLI | Take GitHub to the command line](https://cli.github.com/)

## Memo

### 登入
```bash
gh auth login
```

### 僅保留最近 200 個部屬，其餘的刪除
```ps1
gh api repos/{owner}/{repo}/deployments --paginate --jq '.[].id' | Select-Object -Skip 200| ForEach-Object {
    Write-Host "Deleting deployment $_"
    gh api --method DELETE repos/{owner}/{repo}/deployments/$_
}
```
- `gh api`：用 GitHub CLI 發送 API 請求。
- `repos/{owner}/{repo}/deployments`：指定查詢的 GitHub Repository 和其部署。
- `--paginate`：表示如果結果有很多頁，會自動翻頁取得所有部署資訊。
- `--jq '.[].id'`：這部分是使用 `jq` 來過濾和格式化結果，提取所有部署的 ID。
- `Select-Object -Skip 200`：這行會將返回的部署 ID 進行處理，並跳過前 200 個部署。
- `ForEach-Object { ... }`：對每一個 ID 執行大括號 `{}` 中的命令。
- `--method DELETE`：指定 HTTP 請求方法為 DELETE，用來刪除資源。
- `repos/{owner}/{repo}/deployments/$_`：指定要刪除的部署，`$_` 是當前處理的 deployment ID。
