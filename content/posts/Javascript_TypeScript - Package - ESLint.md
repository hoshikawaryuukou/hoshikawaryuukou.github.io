---
title: "Javascript_TypeScript - Package - ESLint"
date: 2024-09-06 22:11:00
draft: false

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat
ESLint 是一個用來檢查和修復 JavaScript/TypeScript 程式碼風格和潛在錯誤的工具，幫助維持一致性和提高程式碼品質。它可以根據自訂規則或預設的最佳實踐規則來進行靜態分析。

從 ESLint v8.53.0 開始，官方將逐步廢除**格式化規則**，並預計在 v10 完全廢除。官方在這篇文章中解釋了放棄格式化規則的原因：
> [Deprecation of formatting rules](https://eslint.org/blog/2023/10/deprecating-formatting-rules/)

⚠️ 官方建議使用 Prettier 作為格式化方案。

## Guide
- [ESLint - Pluggable JavaScript Linter](https://eslint.org/)
- [[note] ESLint](https://pjchender.dev/webdev/note-eslint/)
- [Nuxt + ESLint 9 + TypeScript + Prettier - Configuration Guide 2024](https://dev.to/jeanjavi/nuxt-eslint-9-typescript-prettier-configuration-guide-2024-4h2c)
- [仕組みと嬉しさから理解するeslint FlatConfig対応](https://zenn.dev/cybozu_frontend/articles/about-eslint-flat-config)
- [Vue3+Ts+Pnpm+eslint9.0+Prettier+Stylelint+vant（移動/h5）專案搭建記錄](https://juejin.cn/post/7379818614361325578)

## Install
```bash
pnpm create @eslint/config@latest
```

## VSCode
- 擴充功能 : [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

## Extra - ESLint Config Inspector
```bash
pnpm dlx @eslint/config-inspector
```

## Extra - Prettier
### [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier)
- ESLint 配置，用於關閉與 Prettier 產生衝突。
- [eslint-config-prettier - eslint.config.js (flat config)](https://github.com/prettier/eslint-config-prettier?tab=readme-ov-file#installation)
- eslint.config.js
```js
import eslintConfigPrettier from 'eslint-config-prettier';

export default [
  eslintConfigPrettier,
];
  ```

### [eslint-plugin-vue](https://eslint.vuejs.org/)
- 用於檢查 Vue 中的程式碼。


<!-- 
---

## Guide
- [前端工程化工具系列（一）—— ESLint(v9.4.0)：代码质量守护者 基础篇](https://juejin.cn/post/7378046072952619042)
- [前端工程化工具系列（二）—— ESLint(v9.4.0)：代码质量守护者 进阶篇](https://juejin.cn/post/7378789972811169807)
- [Eslint 迁移 V9 全过程](https://juejin.cn/post/7403244457263628300?searchId=202409031053004151BBC6326E6B755F82)
- [2024年｜ESlint9+Prettier从0开始配置教程](https://juejin.cn/post/7402696141495779363?searchId=202409031053004151BBC6326E6B755F82)
- [eslint 9.x 升级或使用指南，eslint.config.js 配置，包含 react、typescript、prettier 等常用配置升级迁移](https://ksh7.com/posts/eslint-update-9/index.html#%E4%B8%8D%E5%86%8D%E6%94%AF%E6%8C%81-Node-v19-x-%E5%92%8C-LTS18-18-0-%E7%89%88%E6%9C%AC)
- [ESlint+Prettier+husky实现规范化](https://c4in1.github.io/2024/08/08/%E9%A1%B9%E7%9B%AE%E6%9E%84%E5%BB%BA/ESlint-Prettier-husky%E5%AE%9E%E7%8E%B0%E8%A7%84%E8%8C%83%E5%8C%96/)
- [前端开发规范-Husky+Lint-Staged+Commitlint+ESLint+Prettier](https://juejin.cn/post/7408441793791410228?searchId=20240903105344A5CD2918A151596FA2C7)
- [💥💥💥Eslint 迁移 V9 全过程 + yyds 的 Eslint 工具汇总](https://juejin.cn/post/7403244457263628300?searchId=202409031053004151BBC6326E6B755F82)
- [Vue3 黑神话:悟空版 eslint: eslint-plugin-wukong](https://juejin.cn/post/7409238250042982412#heading-2)
- [200+收藏的Vue3规范，如何配置eslint、prettier、editorconfig](https://juejin.cn/post/7406891999376261146#heading-6) 
- 
- -->
