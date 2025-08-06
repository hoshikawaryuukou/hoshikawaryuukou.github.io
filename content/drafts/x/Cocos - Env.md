---
title: "Cocos - Env"
date: 2024-12-10 22:11:00
draft: true

tags: ["Cocos"]
---

## cocos creator ide
- 配置 vscode path
  > C:\Users\User\AppData\Local\Programs\Microsoft VS Code\Code.exe
- ⚠️ 較新版的 cocos creator 已經不需要， `开发者 -> VS Code 工作流 -> 安装 VS Code 扩展插件`

## package manager
- 使用 pnpm

## packages 
```bash
pnpm create @eslint/config@latest
pnpm add -D prettier
pnpm add -D prettier-plugin-organize-imports
pnpm add -D eslint-config-prettier
```

## vscode - extensions
- [vscode-eslint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [esbenp.prettier-vscode](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

## .vscode/extension.json
```json
{
  "recommendations": ["esbenp.prettier-vscode", "dbaeumer.vscode-eslint"]
}
```

## .vscode/setting.json
```json
{
  "files.exclude": {
    "library/": true,
    "local/": true,
    "temp/": true,
    "**/*.meta": true
  },
  "search.exclude": {
    "build/": true,
    "temp/": true,
    "library/": true,
    "**/*.anim": true,
    "**/*.meta": true
  },
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

## package.json
```json
{
  "scripts": {
    "format": "prettier --write --cache .",
    "format-check": "prettier --check --cache ."
  },
}
```

## eslint.config.mjs
```js
import pluginJs from '@eslint/js';
import eslintConfigPrettier from 'eslint-config-prettier';
import globals from 'globals';
import tseslint from 'typescript-eslint';

/** @type {import('eslint').Linter.Config[]} */
export default [
  { files: ['**/*.{js,mjs,cjs,ts}'] },
  { languageOptions: { globals: globals.browser } },
  pluginJs.configs.recommended,
  ...tseslint.configs.recommended,
  eslintConfigPrettier,
];
```

### .prettierrc
```js
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
