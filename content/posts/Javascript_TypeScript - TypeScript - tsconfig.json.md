---
title: "Javascript_TypeScript - TypeScript - tsconfig.json"
date: 2024-10-12 08:11:00
draft: false

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat
當目錄中出現了 tsconfig.json 文件，則表示該目錄是 TypeScript 專案的根目錄。tsconfig.json 檔案指定了編譯專案所需的根目錄下的檔案以及編譯選項。實務上在不同的開發情境中，準備不同的 tsconfig.json 是非常有必要的。
- 開發環境中，可能希望啟用更多的錯誤檢查和調試資訊，以便更快地發現問題。
- 生產環境中，則可能希望關閉這些額外的檢查，以提升編譯速度並減少輸出檔案大小。

呼叫 tsc 時使用 `--project` 或 `-p` 選項來指定相應的配置檔案。

```bash
tsc -p tsconfig.build.json
```

## Guide
- [tsconfig.json 是什麼](https://www.typescriptlang.org/zh/docs/handbook/tsconfig-json.html)
- [TSConfig Reference](https://www.typescriptlang.org/tsconfig/)
- [tsc性能优化 -- Project References](https://juejin.cn/post/7165429078470688781)

## 基底 tsconfig
Node 20 推薦的 tsconfig.json
- [@tsconfig/node20](https://www.npmjs.com/package/@tsconfig/node20)

```bash
npm install -D @tsconfig/node20
``` 

可以繼承基底 tsconfig 並覆寫參數
```json
{
  "extends": "@tsconfig/node20/tsconfig.json",
  "compilerOptions": {
    "preserveConstEnums": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "**/*.spec.ts"]
}
```

## 型別導出
```json
{
  "compilerOptions": {
    "declaration": true,
    "declarationMap": true,
    "emitDeclarationOnly": true,
    "outDir": "./dist",
  },
  "exclude": ["tests/**/*"],
  "include": ["src/**/*"]
}
```
- **declaration**：是否生成對應的 **.d.ts** 檔案，用來描述編譯後的 JavaScript 的型別資訊。
- **declarationMap**：會為 **.d.ts** 檔案生成對應的 **.d.ts.map** 檔案，使得編譯後的型別定義可以追溯到原始 TypeScript 代碼。
- **emitDeclarationOnly**：TypeScript 只會生成 **.d.ts** 型別檔案，不會生成對應的 JavaScript 檔案。
- **outDir**：指定了編譯器應該將生成的 JavaScript 和型別定義檔案輸出到的目錄。
- **exclude/include**：控制哪些檔案會被包含在編譯過程中。這會間接影響型別的導出，因為只有被包含的檔案才會生成 .d.ts 型別定義檔。

## Monorepo 
```json
{
  "compilerOptions": {
    "incremental": true,
    "composite": true
  }
}
```

### incremental
用於加速 TypeScript 的編譯過程，特別是當代碼庫很大或涉及多個子項目時。

- **增量編譯**：啟用後，TypeScript 會在編譯過程中生成 `.tsbuildinfo` 文件，該文件包含了上次編譯的狀態和信息。當進行下一次編譯時，TypeScript 只會編譯那些自上次編譯以來發生變化的文件，從而大幅縮短編譯時間。

### composite
主要用於多個 TypeScript 項目之間的依賴管理，特別是在 monorepo 結構中，這個選項是開啟增量編譯和項目參考的前提

- **強制啟用的檢查**：啟用後，TypeScript 會強制檢查並要求一些配置：
  - `rootDir` 和 `outDir` 必須明確設置。
  - 必須有至少一個 `tsconfig.json` 中的文件包含在項目中（防止空的配置）。
  
- **生成中間構建文件**：啟用 `composite` 後，TypeScript 會生成中間構建文件（如 `.d.ts` 文件和 `.tsbuildinfo` 文件），這些文件可以被其他依賴它的項目直接使用，避免重複編譯整個項目。







<!-- tsconfig.json 是 TypeScript 專案的主要配置檔，它包含了 TypeScript 編譯器的各種選項設置。 一些常見的設定選項包括：

- compilerOptions：用於配置編譯器選項，例如目標版本、模組系統、輸出目錄等。
- include 和 exclude：用於指定哪些文件應該包含在編譯中，哪些文件應該排除在外。
- files：指定要包含在編譯中的檔案清單。
- references：用於配置專案引用，允許在一個 TypeScript 專案中引用另一個 TypeScript 專案。 -->

