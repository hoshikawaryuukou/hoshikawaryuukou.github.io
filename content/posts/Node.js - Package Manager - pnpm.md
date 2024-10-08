---
title: "Node.js - Package Manager - pnpm"
date: 2024-09-07 21:11:00
draft: false

tags: ["Node.js", "pnpm"]
---

## Guide
- [pnpm](https://pnpm.nodejs.cn/) 
- [为什么现在我更推荐 pnpm 而不是 npm/yarn? ](https://www.cnblogs.com/cangqinglang/p/14448329.html)
- [pnpm、npm、yarn 包管理工具『优劣对比』及『环境迁移』](https://juejin.cn/post/7286362110211489855?searchId=20240731105621AD124E03A93B1AB5027A)
- [从pnpm工具了解整个npm包核心管理原理](https://qborfy.com/today/20230219.html)
- [為什麼 pnpm 比 npm 更快且更省空間？](https://www.explainthis.io/zh-hant/swe/why-is-pnpm-faster)

## Install
```bash
npm i -g pnpm
npm i -g pnpm@latest
pnpm self-update
```

## 管理 Node.js 的執行環境
- pnpm env use --global lts : 安裝並使用 LTS 版本 
- pnpm env use --global {version} : 安裝並使用指定版本
- pnpm env add --global {version} : 僅安裝指定版本
- pnpm env remove --global {version} : 移除指定版本
- pnpm env list : 列舉本地所有版本
- pnpm env list : 列出線上可用的版本

## 管理 packages
- pnpm outdated : 檢查套件是否有更新
- pnpm update --latest : 更新所有依賴至最新
- pnpm store prune : 會清理掉不再被專案引用的包

### workspace 指令/參數
- pnpm add -wD `<pkg>` : 添加依賴於工作區
- pnpm remove -wD `<pkg>` : 移除依賴從工作區
- pnpm install : 安裝所有依賴
- pnpm `<commnad>` : 執行命令
- pnpm --filter `<package_selector>` `<command>` : 執行 package 命令
