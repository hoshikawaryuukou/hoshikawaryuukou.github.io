---
title: "Workflow - Publishing a private npm package to Github Packages"
date: 2024-10-06 20:11:00
draft: false

tags: ["Workflow", "Github", "Node.js"]
---

## Requirement
- ⚠️ 請先確保 package 本身已是合規的配置(exports/typesVersions/files/...)。
- ⚠️ 本範例使用 npm，之後會轉使用 pnpm。

## package.json 的必要配置
- name : 需配置 @scope 
- version : 版本號

```json
{
  "name": "@xxx/oooo",
  "version": "0.1.0",
}

```

## 新增 ./.npmrc
```
@xxx:registry=https://npm.pkg.github.com
```

## 編寫 ./.github/workflows/publish-package.yml
```yml
name: Publish Package

on:
  workflow_dispatch:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          registry-url: 'https://npm.pkg.github.com/'

      - run: npm ci
      - run: npm run build
      - run: npm publish
        env:
          NODE_AUTH_TOKEN: ${{ secrets.GITHUB_TOKEN }}

```
