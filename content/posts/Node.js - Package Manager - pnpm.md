---
title: "Node.js - Package Manager - pnpm"
date: 2025-07-26 21:16:00
draft: false

tags: ["Node.js", "Package Manager", "pnpm"]
---

## Guide
- [pnpm](https://pnpm.nodejs.cn/) 
- [为什么现在我更推荐 pnpm 而不是 npm/yarn? ](https://www.cnblogs.com/cangqinglang/p/14448329.html)
- [pnpm、npm、yarn 包管理工具『优劣对比』及『环境迁移』](https://juejin.cn/post/7286362110211489855?searchId=20240731105621AD124E03A93B1AB5027A)
- [从pnpm工具了解整个npm包核心管理原理](https://qborfy.com/today/20230219.html)
- [為什麼 pnpm 比 npm 更快且更省空間？](https://www.explainthis.io/zh-hant/swe/why-is-pnpm-faster)
- [pnpm实战教程](https://blog.csdn.net/bobo789456123/article/details/132882778)
- [為什麼使用 Turborepo 同時需要使用 pnpm workspace？](https://medium.com/%E6%89%8B%E5%AF%AB%E7%AD%86%E8%A8%98/%E7%82%BA%E4%BB%80%E9%BA%BC%E4%BD%BF%E7%94%A8-turborepo-%E5%90%8C%E6%99%82%E9%9C%80%E8%A6%81%E4%BD%BF%E7%94%A8-pnpm-workspace-9f0899c90d44)

## Install

### 全域安裝
```bash
npm install -g pnpm
```

### 環境配置 - Windows
- ⚠️ 使用 PowerShell 系統管理員
```bash
Get-ExecutionPolicy
# 如果為 Restricted 則繼續進行 

Set-ExecutionPolicy RemoteSigned
```

## Commands

### pnpm 本體
- pnpm self-update : 將 pnpm 更新到最新版本。(建議重啟)

### packages
- pnpm add `<pkg>` : 添加依賴
- pnpm remove `<pkg>` : 移除依賴
- pnpm install : 安裝所有依賴
- pnpm update : 在 package.json 限制的版本範圍內更新所有依賴
- pnpm update --latest : 強更新所有依賴至最新
- pnpm outdated : 檢查套件是否有更新
- pnpm store prune : 會清理掉不再被專案引用的包
- pnpm run `<commnad>` : 執行命令 (run 基本)

### workspace 
- -w : 為工作區參數
- -wD : 組合使用 - 工作區依賴
- --filter `<package_selector>`: 對指定 package 操作
