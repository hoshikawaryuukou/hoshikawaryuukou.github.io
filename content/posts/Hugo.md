---
draft: false
title: Hugo
date: 2025-01-30T10:00:00+08:00
tags:
  - Hugo
---

## Quick Chat

> **Hugo** 是一款以 **Go 語言**編寫的 **靜態網站生成器（Static Site Generator, SSG）**，特色是 **速度極快**、**部署簡單**，且**不依賴後端伺服器程式**。

對於非前端專業的我來說，Hugo 最大的優勢在於：能專注於以 **Markdown** 撰寫內容，不必過度投入在前端細節。當然，若有需要，也能自製或改造主題。

建議新手可以先嘗試以下功能完整且持續維護的主題：
- [adityatelange/hugo-PaperMod](https://github.com/adityatelange/hugo-PaperMod)
- [nunocoracao/blowfish](https://github.com/nunocoracao/blowfish)

## Guide

- [The world’s fastest framework for building websites | Hugo](https://gohugo.io/)
- [Hugo 從零開始：環境安裝（Windows）](https://devbricker.github.io/post/hugo/deploy/hugo_environment/)

## Environment

1. 從 [Hugo GitHub Release](https://github.com/gohugoio/hugo/releases) 下載執行檔（建議選擇 **hugo_extended** 版本）
2. 設置環境變數
3. 常用指令：
   - `hugo version`：檢視 Hugo 版本  
   - `hugo server`：本地預覽網站

## Theme

- ⚠️ 安裝主題前，請先閱讀該主題作者的安裝與配置文件（不同主題的流程可能略有差異）。
- 主題資源：[Hugo Themes](https://themes.gohugo.io/)
- 本 blog 主題：[hoshikawaryuukou/hugo-theme-cactus](https://github.com/hoshikawaryuukou/hugo-theme-cactus)  是基於以下 repository 修改：
	- [monkeyWzr/hugo-theme-cactus](https://github.com/monkeyWzr/hugo-theme-cactus)
	- [OmeletWithoutEgg/hugo-theme-cactus](https://github.com/OmeletWithoutEgg/hugo-theme-cactus)

### 小幅修改主題

⚠️ **不要直接修改主題原始檔案**。  

若需要修改，請將要編輯的文件 **依相同資料夾結構** 複製到專案根目錄，Hugo 會依[模板查找優先順序](https://gohugo.io/templates/lookup-order/)載入你修改的版本。
