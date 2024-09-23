---
title: "Hugo - Note"
date: 2023-02-25 13:11:00
draft: false

tags: ["Hugo"]
---

## Install
- [Hugo 從零開始 環境安裝(Windows)](https://devbricker.github.io/post/hugo/deploy/hugo_environment/)

## Themes
- [Hugo Themes](https://themes.gohugo.io/)

## Image
- [Rendering Images in Markdown Preview of Hugo Site](https://mikefrobbins.com/2023/02/08/rendering-images-in-markdown-preview-of-hugo-site/)
  - 以管理員權限開啟 cmd 
  - mklink /D images .\static\images


<!-- ## draft
- https://dwye.dev/tags/ 
- 
- -->


## Quick Start
- 至 Hugo github release 下載執行檔
- 設置環境變數
- hugo version
- hugo new site MyFreshWebsite --format yaml
- cd MyFreshWebsite
- git init
- git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
- theme: ["PaperMod"]
- hugo server