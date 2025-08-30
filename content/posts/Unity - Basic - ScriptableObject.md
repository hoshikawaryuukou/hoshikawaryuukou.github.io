---
draft: false
title: Unity - Basic - ScriptableObject
date: 2025-03-28T16:56:18+08:00
tags:
  - Unity
---

## Quick Chat

ScriptableObjects 的主要用例是：
- 在編輯器會話期間儲存和儲存資料。
- 將資料保存為專案中的資產以便在運行時使用。

## Guide

- [Unity - Manual: ScriptableObject](https://docs.unity3d.com/6000.2/Documentation/Manual/class-ScriptableObject.html)


## Notice

### Editor Play Mode Persistence

- 在編輯器中進入「播放模式」(Play Mode) 時對 ScriptableObject 實例（.asset 文件對應的記憶體物件）所做的修改，在**退出播放模式後會被保留下來**。
- 如果需要在 Play Mode 中臨時修改數據進行測試，考慮使用 `Instantiate()` 創建 ScriptableObject 的副本來操作，這樣修改就不會影響原始的 .asset 文件。

### Runtime Changes in Builds

- 在建構出的遊戲版本 (Build) 中，於執行期間對 ScriptableObject 實例所做的修改**不會被保存**回原始的資產文件。當遊戲關閉並重新啟動後，ScriptableObject 會恢復到建構時的初始狀態。
- 對於需要持久化的數據，應使用其他儲存機制，例如 PlayerPrefs、儲存為 JSON/XML/二進位檔案，或使用資料庫。
- ScriptableObject 可以在執行期被修改，用作**單次遊戲會話（Session）**內的共享狀態容器，但要知道這些變更不會自動存檔。

### Asset vs. Instance Confusion

- 多個地方直接引用同一個 ScriptableObject `.asset`，它們實際上都指向記憶體中的同一個共享實例。
- 對於實現全局配置或共享狀態非常有用。
- 如果每個使用者擁有獨立的數據副本，則需要在執行期 Instantiate() 這個 ScriptableObject 來創建副本。