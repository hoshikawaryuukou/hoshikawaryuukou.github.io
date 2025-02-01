---
title: "Hugo - Note"
date: 2025-01-30 13:11:00
draft: false

tags: ["Hugo"]
---

## Quick Chat
Blog/筆記軟體 平台玲瑯滿目，但依賴於平台的風險難以忽視(倒站/政策改變)，網站搬家也讓人很頭疼。此 Blog 採方案是 `Github Pages + Hugo`。

## Guide
- [The world’s fastest framework for building websites | Hugo](https://gohugo.io/)
- [gohugoio/hugo](https://github.com/gohugoio/hugo)
- [Hugo 從零開始 環境安裝(Windows)](https://devbricker.github.io/post/hugo/deploy/hugo_environment/)

## Environment
- 至 [Hugo github release](https://github.com/gohugoio/hugo/releases) 下載執行檔 (hugo_extended)
- 設置環境變數
- `hugo version` : 檢視 hugo 版本 

## Quick Chat
- [adityatelange/hugo-PaperMod](https://github.com/adityatelange/hugo-PaperMod)
  - 建議新手使用該主題練習
  - 社群較活躍
  - 教學較完善

## Themes
- [Hugo Themes](https://themes.gohugo.io/)
- [hoshikawaryuukou/hugo-theme-cactus](https://github.com/hoshikawaryuukou/hugo-theme-cactus)
  - 本 Blog Theme 基於以下 repository 修改
  - [monkeyWzr/hugo-theme-cactus](https://github.com/monkeyWzr/hugo-theme-cactus)
  - [OmeletWithoutEgg/hugo-theme-cactus](https://github.com/OmeletWithoutEgg/hugo-theme-cactus)

## Custom
- 使用 git submodule 導入主題。
- 不要直接修改主題範本文件。
- 要修改的文件從主題範本 **複製(文件夾結構要相同)** 出來到根目錄，[Hugo 會照優先度來處理](https://gohugo.io/templates/lookup-order/)。
- 多數主題都有配置 Google Analytics，只需填入 id 到 config 即可。
