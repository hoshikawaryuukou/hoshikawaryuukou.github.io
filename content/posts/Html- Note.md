---
title: "Html - Note"
date: 2024-10-29 13:11:00
draft: false

tags: ["Front-End"]
---

## DOM (Document Object Model)
是一種瀏覽器用來表示和操作 HTML 或 XML 文件的結構化方式。當一個網頁加載時，瀏覽器會將 HTML 文檔解析成 DOM 樹，然後讓開發者使用 JavaScript 等語言動態修改網頁的內容、結構和樣式。


### view size
- `window.devicePixelRatio`: 代設備的屏幕通常具有比標準顯示器更高的像素密度（1 個 CSS 像素 = 2 個物理像素）。
- `window.outerWidth`: 瀏覽器窗口的整體寬度（包括邊框、工具欄等）。
- `window.innerWidth`: 可見區域的寬度（包含滾動條）。
- `document.documentElement.clientWidth`: 可見區域的寬度（不包含滾動條）。
- `screen.width`: 屏幕(硬體)解析度的寬度（整個設備屏幕的寬度，與瀏覽器窗口大小無關）。

### url 
- `window.location.search`: 用於獲取 URL 中的查詢字串（query string）。查詢字串是指 ? 後面的部分，通常用來傳遞參數，例如：`https://example.com/page?name=John&age=30` 中的 `?name=John&age=30`