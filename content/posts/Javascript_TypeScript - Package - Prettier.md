---
title: "Javascript_TypeScript - Package - Prettier"
date: 2024-09-05 08:11:00
draft: false

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat
Prettier 是一個代碼格式化工具，用於保持代碼風格一致。

## Guide
- [Prettier · Opinionated Code Formatter](https://prettier.io/)
- [playground](https://prettier.io/playground/)
- [如何配置 prettier](https://juejin.cn/post/7406891999376261146#heading-1)
- [vscode 擴充功能 : Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

## Install
```bash
pnpm add -D prettier
```

## Configure
- **.prettierrc** : [Configuration File · Prettier](https://prettier.io/docs/en/configuration.html)
- **.prettierignore** : [Ignoring Code · Prettier](https://prettier.io/docs/en/ignore.html)

## Plugins
- **prettier-plugin-organize-imports** : 排序/合併/移除未使用的 import 聲明

## Issue

- 跨平台協同的結尾符問題
  - [[eslint] Delete CR eslint(prettier/prettier) issue](https://bobbyhadz.com/blog/eslint-delete-cr-prettier#set-endofline-to-auto-in-your-prettierrcjs-file)
  - [令人困擾的git autocrlf – Opass Life](https://blog.opasschang.com/confusing-git-autocrlf/)

## Sample

### .vscode/extension.json
```json
{
  "recommendations": ["esbenp.prettier-vscode"]
}
```

### .vscode/setting.json
```json
{
  "editor.formatOnSave": true,
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
```

### package.json
```json
{
  "scripts": {
    "format": "prettier --write --cache .",
    "format-check": "prettier --check --cache ."
  }
}
```

### .prettierrc
```json
{
  "semi": true,
  "trailingComma": "all",
  "singleQuote": true,
  "printWidth": 150,
  "endOfLine": "auto",
  "singleAttributePerLine": true,
  "vueIndentScriptAndStyle": true,
  "htmlWhitespaceSensitivity": "ignore",
  "plugins": ["prettier-plugin-organize-imports"],
  "overrides": [
    {
      "files": ".prettierrc",
      "options": {
        "parser": "json"
      }
    }
  ]
}
```

### .prettierignore
```
dist
pnpm-lock.yaml
CHANGELOG*.md
```
