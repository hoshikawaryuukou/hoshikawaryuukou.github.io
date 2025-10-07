---
draft: false
title: Unity - Architecture - Fundamental Client
date: 2025-10-02T11:39:32+08:00
tags:
  - Unity
  - Architecture
---

## Quick Chat

因應 AI 輔助開發的浪潮，我將個人最熟悉的輕量級應用開發模式進行了系統化的整理與規範。

這個架構的核心理念是讓 AI 扮演「填空者」的角色。開發者預先定義好應用的骨架與規範，而 AI 則專注於填充細部的實作邏輯。如此一來，開發者便能在自己熟悉的框架下，快速理解並整合 AI 的產出，有效降低驗證與重構的認知成本。

關於這個架構的詳細構成請參考以下文檔

- [GitHub - hoshikawaryuukou/MGSU\_DesignGuide\_Fundamental\_Client](https://github.com/hoshikawaryuukou/MGSU_DesignGuide_Fundamental_Client)

## Develop Flow (Inside-Out)

⚠️請確保閱讀過上述連結。

我的開發順序，是從最純粹的業務邏輯開始，一層層往外擴展到具體的框架與畫面。這個流程確保我能先專注在真正重要的核心功能上。

### 第一步：先專注打造可獨立運作的邏輯核心 (Core)

在動手寫任何 Unity 相關程式碼之前，我會先完成這一層。

1.  **框出功能邊界 (UseCase)**
    我會先問自己：「這個 App 到底能做什麼？」然後把這些功能點，例如「建立遊戲」、「移動棋子」，直接定義成一個個的 `UseCase` 類別。這能讓我快速建立起整個應用的功能藍圖。

2.  **定義依賴與產出 (Port, Store, Event)**
    接著，我會思考每個 `UseCase` 的「輸入與輸出」是什麼：
    -   **輸入 (依賴)**：這個功能需要哪些「外部能力」？例如存檔。我會定義一個 `ISaveGamePort` 介面，但**先不管誰來實作它**。
    -   **產出 (結果)**：功能執行完後，會改變哪些「狀態」或觸發什麼「事件」？我會定義出對應的 `Store` 和 `Event`。

3.  **完成核心邏輯**
    最後，把上面定義好的零件組裝起來，完成 `UseCase` 的內部流程。如果邏輯很複雜（如棋盤規則），我會再把這部分抽成更純粹的 `Domain` 物件。到這裡，核心功能就完成了，而且**完全不依賴 Unity**，可以獨立測試。

### 第二步：實作與外部世界溝通的適配器 (Adapter)

核心邏輯建好後，我才開始處理與 Unity 框架的互動。

1.  **實作外部能力 (Infrastructure)**
    我會開始實作之前在 Core 層定義的 `Port` 介面。例如，用 `PlayerPrefs` 來實作 `ISaveGamePort`。因為 Core 只依賴介面，未來要換成雲端存檔也很容易。

2.  **建立溝通橋樑 (Presenter)**
    然後，我會建立 `Presenter` 作為橋樑，處理兩件事：
    -   **從 View 到 Core**：讓 `Presenter` 監聽 Unity UI 的點擊事件，並呼叫對應的 `UseCase`。
    -   **從 Core 到 View**：讓 `Presenter` 訂閱 `Store` 的狀態變化或 `Event`。當核心邏輯改變時，由 `Presenter` 把新資料格式化後，更新到 Unity 的畫面上。

### 第三步：在最外層組裝一切 (Context)

最後一步是把所有東西串起來。

我會建立一個 `Context` (或稱 Composition Root) 的角色。它的工作很單純：把前面建立的所有物件實例化，並把它們正確地「插」在一起。
