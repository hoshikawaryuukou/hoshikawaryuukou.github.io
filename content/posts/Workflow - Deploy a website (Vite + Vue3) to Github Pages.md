---
title: "Workflow - Deploy a website (Vite + Vue3) to Github Pages"
date: 2024-09-20 20:11:00
draft: false

tags: ["Workflow", "Vite", "Vue", "Github"]
---

## Guide
- [vite - 部署静态站点](https://cn.vitejs.dev/guide/static-deploy)
- [[vite] 將 Vite 專案部署至 Github Pages](https://weiyun0912.github.io/Wei-Docusaurus/docs/Vite/Vite-Github-Pages/)
- [vue3项目部署到Github](https://www.cnblogs.com/weizwz/p/18411342)

## 配置 - 基本

### vite.config.js 
```js
export default defineConfig({
  base: '/{repo name}}/',
});
```

## 配置 - SPA 
如果是單頁應用（SPA）路由需做以下配置。

### vite.config.ts
```ts
import { defineConfig } from 'vite';

export default defineConfig({
  base: '/你的倉庫名稱/', // 替換為你的 GitHub 倉庫名稱
});
```

### index.html
```html
<!DOCTYPE html>
<html lang="">
  <head>
    <base href="/mgproject-track-logic-game/">
  </head>
</html>
```

### Vue Router 
```ts
import { createRouter, createWebHistory } from 'vue-router';

const router = createRouter({
  history: createWebHistory('/你的倉庫名稱/'),
});
```







## 本地測試
```bash
pnpm build
pnpm preview
```
















## 部屬

### 方式 1 - 使用 `gh-pages` 套件

#### 安裝套件
```bash
pnpm add -D gh-pages 
```
#### 於 package.json 編寫命令
```json
{
  "scripts": {
    "deploy2ghpages": "gh-pages -d dist"
  },
}
```

#### 執行命令
```bash
pnpm deploy2ghpages
```

### 方式 2 - 使用 `github actions`

#### 編寫 .github\workflows\gh-pages.yml
```yml
# 將靜態內容部署到 GitHub Pages 的簡易工作流程
name: Deploy static content to Pages

on:
  # 僅在推送到默認分支時運行。
  push:
    branches: ['main']

  # 這個選項可以使你手動在 Action tab 頁面觸發工作流
  workflow_dispatch:

# 設置 GITHUB_TOKEN 的權限，以允許部署到 GitHub Pages。
permissions:
  contents: read
  pages: write
  id-token: write

# 允許一個併發的部署
concurrency:
  group: 'pages'
  cancel-in-progress: true

jobs:
  # 單次部署的工作描述
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Set up pnpm
        uses: pnpm/action-setup@v4
        with:
          version: 9
      - name: Set up Node
        uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'pnpm'
      - name: Install dependencies
        run: pnpm install
      - name: Build
        run: pnpm run build
      - name: Setup Pages
        uses: actions/configure-pages@v4
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          # Upload dist folder
          path: './dist'
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

