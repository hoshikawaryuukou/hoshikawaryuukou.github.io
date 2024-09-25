---
title: "Project - Side Project - Game Hub"
date: 2024-09-20 21:11:00
draft: true

tags: ["Project", "Side Project"]
---
我基於 vite + vue3 + typescript + pinia + vuerouter 想實作
像 steam 遊戲庫的感覺
我能透過 遊戲id 下載遊戲(像是dlc)  
並可以執行遊戲

---

你可以構建一個類似 Steam 遊戲庫的系統，透過 gameID 動態下載並執行遊戲。這個設計包括以下幾個部分：

1. 系統架構
前端技術栈: Vite + Vue 3 + TypeScript + Pinia + Vue Router
遊戲資料: 從伺服器請求遊戲資料，包含遊戲 ID、名稱、圖示、描述、下載 URL 等。
遊戲下載與執行: 使用 gameID 來動態加載遊戲，並能啟動執行遊戲。
2. 功能模塊設計
遊戲庫展示頁面：顯示所有可用的遊戲列表，從伺服器獲取遊戲信息。
遊戲詳情頁面：展示選中的遊戲細節，並提供下載或執行的按鈕。
遊戲下載與緩存：使用動態導入（dynamic import）來根據遊戲 ID 加載遊戲模塊，並且可以將遊戲緩存，以便下次快速啟動。
3. Pinia 狀態管理
Pinia 用於管理遊戲數據和狀態，例如已安裝的遊戲、當前選中的遊戲等。