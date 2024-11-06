---
title: "Workflow - Publish a private package to Github Packages"
date: 2024-10-06 20:11:00
draft: false

tags: ["Workflow", "Github", "pnpm"]
---

## Guide
- [Publishing a Private Package on GitHub Packages](https://dev.to/carloshendvpm/publishing-a-private-package-on-github-packages-23bf)
- [发布 Node.js 包](https://docs.github.com/zh/actions/use-cases-and-examples/publishing-packages/publishing-nodejs-packages)

## Notice
- ⚠️ 請先確保 repository 與 package 以配置為 private。
- ⚠️ 本範例使用 pnpm。

## package.json 的必要配置
```json
{
  "name": "@user-or-organization/package-name",
  "version": "1.0.0",
  "repository": {
    "url": "https://github.com/user-or-organization/package-name.git"
  },
  "publishConfig": {
    "registry": "https://npm.pkg.github.com/"
  }
}
```

## .github/workflows/publish-package.yml
```yml
name: Publish package to GitHub Packages

on:
  workflow_dispatch:
  release:
    types: [published]

jobs:
  build:
    runs-on: ubuntu-latest

    permissions:
      contents: read
      packages: write

    steps:
      - uses: actions/checkout@v4

      - uses: pnpm/action-setup@v4
        with:
          version: 9
          run_install: false

      - uses: actions/setup-node@v4
        with:
          node-version: '20.x'
          registry-url: 'https://npm.pkg.github.com'
          scope: '@user-or-organization'

      - name: Install dependencies
        run: pnpm install

      - name: Build package
        run: pnpm build

      - name: Publish package
        run: pnpm publish --access restricted
        env:
          NODE_AUTH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
