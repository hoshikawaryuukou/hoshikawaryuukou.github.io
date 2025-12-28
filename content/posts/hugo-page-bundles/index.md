---
draft: false
title: 減少寫作的摩擦力：試試 Hugo Page Bundles
date: 2025-12-27T15:33:30+08:00
tags:
  - Hugo
---

## Quick Chat

最近回顧舊文，我發現一個顯著的趨勢：**我的配圖變少了**。

過去我採用 `file-based post` 搭配統一 `static assets` 資料夾的架構。雖然結構單純，但這種分離式的管理方式，導致我在寫作時，下意識地避開了需要配圖的場景。

深入探究，瓶頸在於「附件管理」流程帶來的心理阻力：
1.  **圖文分離**：多媒體素材與文章分開存放，若要單獨遷移或備份某篇文章，過程相當繁瑣。
2.  **檔案混亂**：隨著文章增加，統一的 assets 資料夾變得雜亂龐大，難以維護。
3.  **殘留垃圾**：刪除文章時，往往容易遺漏未清理的圖片，導致專案中充斥無用檔案。

至於為何不使用圖床？核心考量還是「**資料自主權**」。我希望將內容與素材完全掌握在自己手中，不依賴外部服務的存續。

為了解決這個痛點，我決定將架構遷移至 Hugo 的 **Page Bundles (Folder-based)**。

改用這種架構後，多媒體與 Markdown 檔位於同一目錄。雖然專案結構目錄變多了，但其優勢在於：
1.  **管理直覺**：素材與文章強綁定。移動或刪除文章資料夾時，圖片隨之變動，徹底告別殘留檔案。
2.  **效能紅利**：這是額外的驚喜。改用 Page Bundles 後，Hugo 能將圖片視為 Page Resources，進一步實現圖片處理與載入優化。

## Guide

- [Page bundles](https://gohugo.io/content-management/page-bundles/)

改版後的目錄結構如下，採用 Leaf Bundle 形式：

```text
content/
└─ posts/
   └─ my-article/     <-- 文章獨立成資料夾
       ├─ index.md    <-- 文章本體
       ├─ cover.jpg   <-- 素材就近管理
       └─ diagram.png
```