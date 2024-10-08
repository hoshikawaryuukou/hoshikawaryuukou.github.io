---
title: "Workflow - Installing a private npm package from Github Packages"
date: 2024-10-06 20:12:00
draft: false

tags: ["Workflow", "Github", "Node.js"]
---

## Requirement
- ⚠️ 向 github 組織索取訪問用的 token
- ⚠️ 本範例使用 npm，之後會轉使用 pnpm

## Window 環境變數設置 token
```bash
setx GITHUB_TOKEN ghp_xxxxxxxxxxxxxxxxxxxxxxxx
```
- ⚠️ 設置後必要時重啟終端機以確保環境變數被應用

## 初始化 project
```bash
cd project-directory
npm init -y
```

## 新增 ./.npmrc
- ⚠️ 這裡的第二行註解是正規寫法，有特殊用途

```
@xxx:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken="${GITHUB_TOKEN}"
```

## 安裝 package
```bash
npm install @ooxx/xxx
```
