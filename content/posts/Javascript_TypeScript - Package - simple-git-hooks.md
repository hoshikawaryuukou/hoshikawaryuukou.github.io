---
title: "Javascript_TypeScript - Package - simple-git-hooks"
date: 2024-10-15 21:11:00
draft: false

tags: ["JavaScript", "TypeScript"]
---

## Guide
- [simple-git-hooks](https://github.com/toplenboren/simple-git-hooks)

## Install
```bash
pnpm add -D simple-git-hooks
```

## Notice
- ⚠️ 更改命令後記得更新 git hook
- ⚠️ 不要添加 `"postinstall": "pnpx simple-git-hooks"` 於 package.json，會影響 publish 行為
- ⚠️ 個人不建議簡化 `跳過 hook` 行為，必須保持操作不適度

## Usage

### 添加命令至 package.json

- [githooks](https://git-scm.com/docs/githooks)
```json
{
  "simple-git-hooks": {
    "pre-commit": "echo 'before commit'"
  }
}
```

### 更新 git hook
```bash
pnpx simple-git-hooks
```

### 跳過 git hook - CI 
- 這部分代補，目前沒有操作情境
- [doc](https://github.com/toplenboren/simple-git-hooks?tab=readme-ov-file#i-want-to-skip-git-hooks)

### 跳過 git hook - 三方 git client
- 開啟 git bash 
```bash
- git commit -m "你的 commit 訊息" --no-verify
```

## Sample
```json
{
  "simple-git-hooks": {
    "pre-commit": "pnpm lint-staged && pnpm check",
    "commit-msg": "node scripts/verify-commit.js"
  }
}
```