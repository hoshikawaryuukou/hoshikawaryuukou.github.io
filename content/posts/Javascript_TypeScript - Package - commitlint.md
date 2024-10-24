---
title: "Javascript_TypeScript - Package - commitlint"
date: 2024-07-12 08:11:00
draft: false

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat
commitlint 是一個用來檢查 git commit 信息格式的工具，它可以配合多種規範使用。

## Guide
- [commitlint](https://github.com/conventional-changelog/commitlint)
- [commitlint doc](https://commitlint.js.org/)
- [Commit-lint学习：新手入门指南](https://www.imooc.com/article/359532)
- [Commitlint vs Commitizen: Comparison for Better Git Commit Practices](https://2sistersgarlic.com/commitlint-vs-commitizen-comparison-for-better-git-commit-practices/)

## Install
```bash
pnpm add -D @commitlint/{cli,config-conventional}
```

## Sample

### commitlint.config.js
```js
export default {
  extends: ['@commitlint/config-conventional'],
};
```

### package.json
```json
{
  "simple-git-hooks": {
    "pre-commit": "pnpm lint-staged && pnpm check",
    "commit-msg": "pnpx commitlint --edit $1"
  },
}
```