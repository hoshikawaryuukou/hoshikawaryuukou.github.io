---
title: "Javascript_TypeScript - Package - Turborepo"
date: 2024-07-12 08:11:00
draft: true

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat
讓 monorepo 專案管理更高效穩定。透過智慧快取和並行執行，減少重複工作、提升增量構建速度，讓 CI/CD 流程更順暢。

## Guide
- [vercel/turborepo](https://github.com/vercel/turborepo)
- [Turborepo](https://turbo.build/)
- [為什麼使用 Turborepo 同時需要使用 pnpm workspace？](https://medium.com/%E6%89%8B%E5%AF%AB%E7%AD%86%E8%A8%98/%E7%82%BA%E4%BB%80%E9%BA%BC%E4%BD%BF%E7%94%A8-turborepo-%E5%90%8C%E6%99%82%E9%9C%80%E8%A6%81%E4%BD%BF%E7%94%A8-pnpm-workspace-9f0899c90d44)

## Notice
- ⚠️ 目前尚未支援 eslint flat config
- ⚠️ [jnlsn/turborepo - turborepo/examples/with-eslint-flat-config](https://github.com/jnlsn/turborepo/tree/example-with-eslint-flat-config/examples/with-eslint-flat-config)

## Install - Existing Repository
```bash
pnpm add -wD turbo
```

## Install - Starter Example
- [examples](https://turbo.build/repo/docs/reference/create-turbo#start-with-an-example)
```bash
pnpm dlx create-turbo@latest
pnpm dlx create-turbo@latest --example [example-name]
```
