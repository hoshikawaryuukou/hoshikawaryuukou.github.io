---
title: "Javascript_TypeScript - Package - Commitizen"
date: 2024-07-12 08:11:00
draft: true

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat
專門用來規範 Git 提交訊息格式，使得開發團隊的提交訊息風格一致，便於後續自動生成更新紀錄、版本管理等工作。它會引導開發者撰寫提交訊息，避免不規範的提交格式。

## Guide
- [commitizen/cz-cli](https://github.com/commitizen/cz-cli)

## Notice
- ⚠️ 目前無法在 pnpm 中使用 commitizen init，需手動配置。
- ⚠️ 目前無法直接與 fork 整合(不支援互動式 cli)，仍需單獨使用 git bash。
- 💡 已經熟悉**約定式提交**也可以不使用(搭配 commitlint 攔截不合規的 commit)。

## Install
```bash
pnpm add -g commitizen
pnpm add -wD cz-conventional-changelog
```

## Config

### package.json 
```json
{
  "scripts": {
    "commit": "cz"
  },
  "config": {
    "commitizen": {
      "path": "./node_modules/cz-conventional-changelog"
    }
  }  
}
```

## Usage

### 於 專案終端機
```
pnpm commit
```

### 於 fork - git bash
```
cz
```
