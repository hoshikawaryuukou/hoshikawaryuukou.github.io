---
title: "Game Development - Web Game - Device Evaluation"
date: 2025-02-09 13:11:00
draft: false

tags: ["Game Development"]
---

## Quick Chat
Web 遊戲的測試免不了要在實機上觀測 FPS 數據。

## Device
1. 開啟開發者選項
2. USB 為資料傳輸模式

## Browser - Firefox
1. 手機 Firefox 瀏覽器開啟 USB 偵錯
2. 網址列輸入 `about:debugging#/setup`
3. 連接 USB 裝置
4. 選擇分頁

## Console
```js
(function () {
    let lastTime = performance.now();
    let frame = 0;

    function loop() {
        let now = performance.now();
        frame++;
        if (now > lastTime + 1000) {
            console.log(`FPS: ${frame}`);
            lastTime = now;
            frame = 0;
        }
        requestAnimationFrame(loop);
    }
    loop();
})();
```