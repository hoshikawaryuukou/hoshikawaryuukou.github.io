---
draft: false
title: Workflow – Build and Deploy Hugo Site
date: 2025-01-30T14:12:00+08:00
tags:
  - Workflow
  - Hugo
  - Github
---

## Quick Chat

當 `main` 分支有 push，或有 pull request 時，會自動用 Hugo 生成靜態網站，並將 `public` 目錄的內容部署到 GitHub Pages。

## Operation

1. **檢出程式碼**（含 submodules，全歷史）   
2. **安裝 Hugo**（最新版、Extended 版）
3. **建置網站**（`hugo --minify` 壓縮輸出）
4. **部署到 GitHub Pages**（僅 `main` 分支才執行部署）

### gh-pages.yml

```yml
name: github pages

on:
  push:
    branches:
      - main
  pull_request:

jobs:
  deploy:
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: true
          fetch-depth: 0 # Fetch all history for .GitInfo and .Lastmod

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v3
        with:
          hugo-version: "latest"
          extended: true

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v4
        if: github.ref == 'refs/heads/main'
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```