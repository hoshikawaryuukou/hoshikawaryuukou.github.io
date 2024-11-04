---
title: "Javascript_TypeScript - Package - ESLint"
date: 2024-10-17 22:11:00
draft: false

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat
ESLint 是一個用來檢查和修復 JavaScript/TypeScript 程式碼風格和潛在錯誤的工具，幫助維持一致性和提高程式碼品質。它可以根據自訂規則或預設的最佳實踐規則來進行靜態分析。

## Guide
- [eslint/eslint](https://github.com/eslint/eslint)
- [ESLint - Pluggable JavaScript Linter](https://eslint.org/)
- [Using the New ESLint Flat Config](https://jmugliston.dev/blog/using-the-new-eslint-flat-config)
- [仕組みと嬉しさから理解するeslint FlatConfig対応](https://zenn.dev/cybozu_frontend/articles/about-eslint-flat-config)

## Notice
- ⚠️ ESLint 正逐步廢除**格式化規則** - [Deprecation of formatting rules](https://eslint.org/blog/2023/10/deprecating-formatting-rules/)。
- ⚠️ 官方建議使用 Prettier 作為格式化方案。

## Install
```bash
pnpm create @eslint/config@latest
```

## Extension
- [vscode extension](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

### .vscode/extension.json
```json
{
  "recommendations": ["dbaeumer.vscode-eslint"]
}
```

## Config

- **eslint.config.js** - 使用純 JavaScript 編寫配置，以便支持更好的導入導出。
- 使用一個純陣列來定義所有的規則和配置，避免了多層嵌套的問題。
- 後面出現的配置會覆蓋前面的配置。

### eslint.config.js
```js
import pluginJs from '@eslint/js';
import tseslint from 'typescript-eslint';

export default [
  {
    name: 'all',
    files: ['**/*.{js,ts,vue}'], 
    ignores: [
      '**/node_modules/**', 
      '**/dist/**',    
      '**/coverage/**',   
      '**/*.min.js', 
    ],
    rules: {
      'no-console': 'warn',
      'no-unused-vars': 'error',
    },
  },
  {
    name: 'frontend',
    files: ['packages/app-frontend/**/*.{js,ts,vue}'],
    rules: {
      'no-debugger': 'error', 
    },
  },
  {
    name: 'backend',
    files: ['packages/app-backend/**/*.{js,ts}'],
    rules: {
      'no-console': 'off', 
    },
  },
  {
    name: 'shared-library',
    files: ['packages/shared-library/**/*.{js,ts}'],
    ignores: ['**/*.test.ts'],
  },
  pluginJs.configs.recommended,
  ...tseslint.configs.recommended,
];
```

## Extra - ESLint Config Inspector
```bash
pnpx @eslint/config-inspector
```
