---
title: "Workflow - Vite + Vue3 + Github Pages"
date: 2024-09-20 20:11:00
draft: false

tags: ["Workflow", "Vite", "Vue", "Github"]
---

## Guide
- [vite - 部署静态站点](https://cn.vitejs.dev/guide/static-deploy)
- [[vite] 將 Vite 專案部署至 Github Pages](https://weiyun0912.github.io/Wei-Docusaurus/docs/Vite/Vite-Github-Pages/)
- [vue3项目部署到Github](https://www.cnblogs.com/weizwz/p/18411342)

## 前置動作

### 設置 vite.config.js 中設定 Base URL
```js
export default defineConfig({
  base: '/{repo name}}/',
  plugins: [vue()],
});
```

### 確保靜態網頁內容無誤
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

### 編寫 .github\workflows\gh-pages.yml
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

## Issue
### 路由 404 
- 目前是單頁應用沒使用到路由暫時不會遇到 - 之後會補

<!-- ## Guide
- [Vue + Vite Github Pages 部屬](https://virgil246.com/posts/vue-vite-githubpages-deploy/)
- [Vite构建的Vue3项目部署到GitHub Pages](https://juejin.cn/post/7228851979463032890)
- [vite 构建的vue3 项目部署到github](https://blog.csdn.net/weixin_44717047/article/details/120113869)
- [vue3-music](https://github.com/LeoJ340/vue3-music) 
- 
- -->