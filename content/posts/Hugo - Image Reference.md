---
title: "Hugo - Image Reference"
date: 2025-01-30 14:05:00
draft: false

tags: ["Hugo", "Blog"]
---

## Quick Chat
使用 Hugo 建立網站時，Markdown 編輯器預覽圖片時可能遇到的問題。

原因是相對路徑
- 文章位於 `/content/posts` 目錄
- 圖片位於 `/static/images` 目錄

Hugo 能夠正確渲染圖片，因為它知道 /images 是相對於 static 目錄的路徑。然而，許多 Markdown 編輯器在預覽時，無法識別這種相對路徑，導致圖片無法顯示。

## Solutions
- [Rendering Images in Markdown Preview of Hugo Site](https://mikefrobbins.com/2023/02/08/rendering-images-in-markdown-preview-of-hugo-site/)
  - 在 Hugo 項目的根目錄創建一個指向 static/images 目錄的符號連結（symlink）。
  - 以管理員權限開啟 cmd 
  - mklink /D images .\static\images
