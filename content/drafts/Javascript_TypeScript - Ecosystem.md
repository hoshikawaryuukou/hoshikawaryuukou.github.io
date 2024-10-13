---
title: "Javascript_TypeScript - Ecosystem"
date: 2024-10-10 21:11:00
draft: true

tags: ["JavaScript", "TypeScript"]
---

## ECMAScript ?
ECMAScript 是一個標準，定義了像 JavaScript 和 TypeScript 這些語言的語法和功能。所有的 JavaScript 和 TypeScript 實現（包括瀏覽器、Node.js、Deno 等）都是基於 ECMAScript 標準來運行的。

## ECMAScript Modules (ESM) vs CommonJS (CJS)
雖然 Node.js 一開始是基於 CommonJS 的，但現在它同時支持 ESM 和 CommonJS。

### ESM
- ESM 是現代的模塊系統，作為 ECMAScript 標準的一部分
- 原生支持異步加載
- 支持靜態分析，便於 tree-shaking（減少未使用代碼的打包）
- 在現代 JavaScript 開發中，尤其是前端框架（如 React、Vue）和新的後端環境（如 Deno）中，這是推薦的模塊系統

### CJS 
- CJS 是 Node.js 的模塊系統
- 同步加載模塊

## 開發 vue/react 其實是在 node 環境?
雖然開發過程依賴 Node.js，但最終打包好的 Vue 或 React 應用是運行在瀏覽器中的，這意味著應用的真正執行環境是瀏覽器的 JavaScript 引擎。

⚠️ 特例 - SSR（服務端渲染）: 這時候 Vue 或 React 的一部分邏輯會在 Node.js 環境中執行，而非單純在瀏覽器中運行。

### 開發過程中的 Node.js 角色：
- 開發工具與構建環境
- 本地開發伺服器
- 依賴管理（npm/yarn/pnpm）


