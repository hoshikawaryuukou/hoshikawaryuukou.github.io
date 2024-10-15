---
title: "Node.js - package.json - Export"
date: 2024-10-13 09:11:01
draft: false

tags: ["Node.js", "npm"]
---

## Guide
- [Package entry points](https://nodejs.org/api/packages.html#package-entry-points)
- [Version selection with typesVersions](https://www.typescriptlang.org/docs/handbook/declaration-files/publishing.html#version-selection-with-typesversions)
- [Multiple exports with types in a Typescript Package](https://www.nullfox.com/multiple-exports-typescript-package-types)
- [巧用 exports 和 typeVersions 提升 npm 包用户使用体验](https://zhuanlan.zhihu.com/p/627434408)

## Suggestion
- 以較新 Node.js 版本為目標的新包，建議使用 `exports` 欄位。
- sample - [vue/core](https://github.com/vuejs/core/blob/main/packages/vue/package.json)

## Notice
當定義了 exports 欄位時
- ⚠️ Node.js 會優先使用 exports 來決定如何載入模組，只有在 exports 中沒有相應定義時，才會使用 main、module 和 types 欄位。
- ⚠️ 所有子路徑都會被封裝起來，除非明確導出，否則這些子路徑將無法供使用者訪問(會拋出一個 `ERR_PACKAGE_PATH_NOT_EXPORTED` 的錯誤)。

## Fields 

### main
當套件被作為 CommonJS 模組引入時，預設的入口點。

### module
當套件被作為 ES 模組引入時，預設的入口點。

### types
TypeScript 的類型定義檔案位置，提供 TypeScript 支援。

### exports
- 用來細化和取代傳統的 main 和 module 欄位。
- 提高包的安全性：限制用戶可以訪問的內部文件，防止直接訪問內部未經授權的代碼。
- 更清晰的 API：只公開需要使用的部分代碼，簡化使用者的導入過程。
- 支持不同的模組格式：通過同時支持 require 和 import，可以在不同的環境中更靈活使用。

## exports - Conditional Exports
目前指導出 esm 模組，未來需要雙入口再回補。

## exports - Subpath

### 多入口導出
```json
{
  "name": "my-package",
  "exports": {
    ".": {
      "types": "./dist/index.d.ts",
      "default": "./dist/index.js"
    },
    "./subpath": {
      "types": "./dist/subpath/index.d.ts",
      "default": "./dist/subpath/index.js"
    }
  }
} 
```

### 限制導出
```json
{
  "name": "my-package",
  "exports": {
    "./subpath/internal/*": null
  }
} 
```

## Extras - 偷懶作法 (較不推薦) 

- ⚠️ 利用 typeVersions 導引型別位置，但這偏離了 typeVersions 的原始用途(依據 TypeScript 版本的差異來區分型別檔案)。

```json
{
  "exports": {
    "./*": "./dist/*.js"
  },
  "typesVersions": {
    "*": {
      "*": [
        "./dist/*"
      ]
    }
  }
} 
```