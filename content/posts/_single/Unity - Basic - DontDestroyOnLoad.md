---
draft: false
title: Unity - Basic - DontDestroyOnLoad
date: 2023-03-20T10:00:00+08:00
tags:
  - Unity
---

## Quick Chat

- **「在尚未深入依賴注入框架前，我常使用它來管理跨場景的資源。」**
- **「當然，在小專案中，它仍是一個相當方便實用的工具。」**

## Guide

- [Unity - Scripting API: Object.DontDestroyOnLoad](https://docs.unity3d.com/ScriptReference/Object.DontDestroyOnLoad.html)

**`DontDestroyOnLoad`** 標籤能確保物件在場景切換時不會被銷毀，主要應用於以下三種情境：

1.  **全域管理器**：此類物件需要貫穿遊戲始終，例如**音效管理器**、**遊戲設定**或**玩家數據**。標記為 `DontDestroyOnLoad` 後，這些管理器便能持續發揮功能並保留數據，確保遊戲體驗不間斷。
2.  **持久性資料**：當有多個場景需要共享同一份資料時，例如**玩家的遊戲進度**或**全域配置設定**，可以將儲存這些資料的物件設為 `DontDestroyOnLoad`，確保不同場景都能存取並更新。
3.  **常駐物件**：某些物件（如**遊戲狀態面板**、**計時器**或**得分顯示**）需要持續顯示。透過 `DontDestroyOnLoad`，這些物件在場景切換時不會消失，能保持持續更新。

## Notice

雖然 `DontDestroyOnLoad` 很實用，但使用不當會引發以下問題：

1.  **記憶體洩漏**：如果一個 `DontDestroyOnLoad` 物件在後續場景中不再需要，但沒有手動銷毀，它會一直存在於記憶體中。這會造成**記憶體佔用增加**，導致遊戲效能下降，甚至出現記憶體洩漏。
2.  **場景耦合**：`DontDestroyOnLoad` 會打破 Unity 場景應有的**獨立性**。當場景之間存在大量共享物件時，會增加它們之間的依賴性（**高耦合**），使得程式碼難以管理、維護和測試。
