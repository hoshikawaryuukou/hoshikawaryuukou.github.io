---
title: "Javascript_TypeScript - Package - lint-staged"
date: 2024-10-18 08:11:00
draft: false

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat
lint-staged 可以只對 git staged 的檔案執行 lint 處理，進而提升檢查效率。

## Guide
- [lint-staged](https://github.com/lint-staged/lint-staged#installation-and-setup)

## Notice
- ⚠️ 這裡與 simple-git-hooks 搭配使用
- ⚠️ 跟 Prettier 搭配使用，必須確保 ESLint 在 Prettier 前面先執行

## Install
```bash
pnpm add -D lint-staged
```

## Usage

### 添加命令至 package.json

```json
{
  "lint-staged": {
    "*.{ts,js}": [
      "eslint"
    ]
  }
}
```

### 執行
```
pnpm lint-staged 
```

## Sample
```json
{
  "lint-staged": {
    "*.{js,json}": [
      "prettier --write"
    ],
    "*.ts?(x)": [
      "eslint --fix",
      "prettier --parser=typescript --write"
    ]
  }
}
```