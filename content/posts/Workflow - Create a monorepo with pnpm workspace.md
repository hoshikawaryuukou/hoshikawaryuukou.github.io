---
title: "Workflow - Create a monorepo with pnpm workspace"
date: 2024-10-06 20:31:00
draft: false

tags: ["Workflow", "Node.js", "pnpm", "Monorepo"]
---

## Guide
- [Monorepo与pnpm：前端项目管理的完美搭档](https://juejin.cn/post/7357546247848198182)
- [为什么 pnpm+monorepo 是组件库项目的最佳实践](https://juejin.cn/post/7316409548994625574?searchId=20240731105621AD124E03A93B1AB5027A)
- [Monorepo？來聊聊另一種專案管理架構吧！](https://israynotarray.com/other/20240413/3177435894/)
- [从npm版本依赖到Monorepo大仓项目](https://qborfy.com/today/20230107.html)
- [MonoRepo实战：pnpm+nx搭建MonoRepo项目](https://qborfy.com/today/20230225.html)
- [Create a monorepo using PNPM workspace](https://dev.to/vinomanick/create-a-monorepo-using-pnpm-workspace-1ebn)

## 專案基本結構

```bash
project-root/               # 專案根目錄
├── pnpm-workspace.yaml     # pnpm 的工作區配置文件，用來定義哪些資料夾屬於工作區範圍
├── package.json            # 專案的全局配置文件，通常包括依賴、腳本和項目元數據
└── packages/               # 所有子包的資料夾，存放具體的子項目
    ├── pkg01/              # 子包01，包含它自己的 package.json 文件和代碼
    └── pkg02/              # 子包02，與 pkg01 結構相似，也擁有自己的 package.json 和代碼

```

## 新增 專案內全局配置 ./package.json 
```bash
# 產生一個基本的 package.json
pnpm init    
```

- monorepo 的全局 package.json 設置 `"private": true` 
```json
{
  "private": true,
}
```

## 新增 工作區配置文件 ./pnpm-workspace.yaml
- 該檔案聲明這是一個 Monorepo 專案。
- `pnpm install` 自動安裝所有 package 的相依套件。
- `packages` 字段列出了工作區包含的 package 位置。
- 工作區下的 package 會有各自的 package.json。

```yaml
packages:
  - 'packages/*'
```

## Extra - 在專案中限用 pnpm
⚠️ 但目前 npm hook - preinstall 未如預期運作。
```json
{
  "scripts": {
    "preinstall": "npx only-allow pnpm"
  }
}