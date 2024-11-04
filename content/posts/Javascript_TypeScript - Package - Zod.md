---
title: "Javascript_TypeScript - Package - Zod"
date: 2024-07-12 08:11:00
draft: true

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat
> TypeScript-first schema validation with static type inference

Zod 是一個 TypeScript 驗證庫，用於定義和驗證數據結構。它的設計理念在於將靜態類型檢查與運行時驗證相結合，提供一個強大且易用的工具來保證數據的正確性和安全性。

其優勢在於 : 
- 可讀性與維護性：簡潔的 API，集中驗證規則，易於理解與維護。
- 減少重複代碼：可重用 schema，降低維護成本。
- TypeScript 支援：自動生成類型，減少類型與驗證不一致風險。
- 錯誤處理：提供詳盡的錯誤訊息，便於調試。
- 擴展性與一致性：靈活組合複雜驗證，確保一致性。

## Guide
- [colinhacks/zod](https://github.com/colinhacks/zod)
- [Zod | TypeScript-first schema validation with static type inference](https://zodjs.netlify.app/)

## Install
```bash
pnpm add zod
```

## Usage

```ts
import { z } from 'zod';

// 定義可重用的 schema
const numericParameterSchema = z.number()
  .refine(value => Number.isInteger(value * 100), {  message: "數值參數不能超過兩位小數",});

const nameSchema = z.string()
  .min(1, { message: "name 不能為空" });

const levelSchema = z.number()
  .min(1, { message: "level 必須大於等於 1" })
  .max(10, { message: "level 必須小於等於 10" });

// 組合 schema 來構建更複雜的配置
const gameConfigSchema = z.object({
  numericParameter: numericParameterSchema,
  name: nameSchema,
  level: levelSchema,
  // 其他配置項...
});

// 示例驗證
const result = gameConfigSchema.safeParse({
  numericParameter: 10.125,
  name: "Game A",
  level: 15,
});

if (!result.success) {
  console.log(result.error.errors); // 打印所有錯誤信息
}

/* --- output -------------------
[
  {
    code: 'custom',
    message: '數值參數不能超過兩位小數',
    path: [ 'numericParameter' ]
  },
  {
    code: 'too_big',
    maximum: 10,
    type: 'number',
    inclusive: true,
    exact: false,
    message: 'level 必須小於等於 10',
    path: [ 'level' ]
  }
]
*/
