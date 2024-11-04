---
title: "Javascript_TypeScript - Package - tsup"
date: 2024-10-13 21:11:00
draft: false

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat
> The simplest and fastest way to bundle your TypeScript libraries.

設計的初衷是讓開發者能夠以最少的設定完成打包工作，內建許多合理的預設值。

## Guide
- [egoist/tsup](https://github.com/egoist/tsup)
- [tsup](https://tsup.egoist.dev/#what-can-it-bundle)
- [为什么是 tsup](https://www.modyqyw.top/blogs/2022/12/why-tsup)
- [Dual Publishing ESM and CJS Modules with tsup and Are the Types Wrong?](https://johnnyreilly.com/dual-publishing-esm-cjs-modules-with-tsup-and-are-the-types-wrong)

## Install
```bash
pnpm add -D tsup
```

## Config

### package.json
```json
{
  "scripts": {
    "build": "tsup"
  },
}
```

### tsup.config.ts - only esm module
```ts
import { defineConfig } from 'tsup';

export default defineConfig({
  // 指定入口文件
  entry: ['src/index.ts', 'src/subpath/index.ts', 'src/internal/index.ts'], 
  // ESM 格式
  format: ['esm'], 
  // 生成類型定義
  dts: true, 
  // 每次構建時清理輸出目錄
  clean: true, 
});

```