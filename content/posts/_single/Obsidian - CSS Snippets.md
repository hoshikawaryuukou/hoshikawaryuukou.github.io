---
draft: false
title: Obsidian - CSS Snippets
date: 2025-08-15T20:00:18+08:00
tags:
  - Obsidian
  - CSS
---

## Quick Chat

試過幾款主題，但沒有特別喜歡的，感覺還是用預設主題就好。  

不過，Markdown 的顯示樣式還是想稍微調整一下。

## Guide

- [CSS snippets - Obsidian Help](https://help.obsidian.md/snippets)

## Configuration

1. 開啟 **設定**。
2. 在 **外觀 → CSS 片段** 中，點選 **開啟片段資料夾**。
3. 在該資料夾中建立一個 `.css` 檔，並寫入自訂的程式碼片段。
4. 回到 Obsidian，於 **外觀 → CSS 片段** 中，點選 **重新載入片段**，即可在清單中看到新片段。
5. 開啟對應的切換按鈕以啟用程式碼片段。

## Modification

1. **H2 與 H3** 字體大小太接近
2. **H2** 標題下方加一條淡色分隔線
3. **清單項目**之間的間距稍微拉開

### custom.css

```css
.markdown-preview-view h2 {
  font-size: 1.6em;
  font-weight: bold;
  border-bottom: 2px solid var(--background-modifier-border); 
  padding-bottom: 0.2em;
  margin-bottom: 0.5em;
}

.markdown-preview-view h3 {
  font-size: 1.3em;
  font-weight: bold;
}

.markdown-preview-view li {
  margin-bottom: 0.25em;
}

.markdown-preview-view ul,
.markdown-preview-view ol {
  margin-bottom: 0.5em;
}

```