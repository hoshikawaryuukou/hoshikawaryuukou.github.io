---
title: "通用設計 - Pattern - UiState 與 ViewModel"
date: 2023-08-27 20:05:00
draft: true

tags: ["Common Design"]
---

## 前述

目前的開發情境有以下需求


此篇的實作方式參考到以下文件
- [Android Developers 文件/指南/UI 層](https://developer.android.com/topic/architecture/ui-layer?hl=zh-tw)

該文件更新頻率算高且有與時俱進，筆者印象中其架構設計從 MVVM -> 以 Domain/Application 為中心的設計，也可以看出主流架構有在產生變化。此篇不會詳細介紹 MVVM 的細節，如果對 MVX 系列不熟，可以先去讀筆者之前的這篇文章 **<<通用設計 - Pattern - MVP>>** 裡面的 References。

以下將針對一些開發情境進行探討
- 有沒有辦法在 **沒有服務端** 的情況下，讓客戶能操作到完整的體驗流 ?
- 有沒有一個地方放著明確的 **狀態** ?
- 有沒有辦法 UI 只做為一個純粹的撥放器 (使用者輸入源 & 狀態輸出畫布) ?













裡面提到一些 Presentation layer 設計方案
- 定義 UI 狀態
- 單向資料流
- 不變性

簡略說一下 MVVM 的特點
- Data-Driven : 前端畫面的數據源頭
- ViewModel 不知道 View 的存在 : ViewModel 更好被測試
- 職責更明確: ViewModel 儲存狀態管理流程 / View 不用用管理狀態 專心畫面呈現
- 單向數據流

接下來的討論會著重在筆者以下幾點上
- 某些情境下 MVP 的窘境 
- MVP 混用 ViewModel

## ViewModel

在 MVP 開發中 Persenter 除了要調用 View/IView 方法
還要管理狀態，當然有時會直接將狀態塞至 View 中
但在處理向 循環物件時 View 是會被重複刷的 必須由presenter管理 可以明顯感受到需要 vm 的存在

MVP 在 presenter 共用資料流



## Example

以一個井字遊戲為例，情境如下
1. 開始顯示選單視窗
2. 選擇設定開啟設定視窗
3. 選擇遊玩開啟遊戲視窗






定義 IAppViewModel

```csharp
public interface IAppViewModel
{
    // 選單/設定/遊戲 的啟動狀態
    IReactiveProperty<bool> MenuActiveRP { get; }     
    IReactiveProperty<bool> SettingActiveRP { get; }  
    IReactiveProperty<bool> GameActiveRP { get; } 
}
```

定義 IGamePlayViewModel

```csharp
public interface IGamePlayViewModel
{
    // 回合數狀態
    IReactiveProperty<int> TurnRP { get; }

    // 點選成功事件
    IObservable<SelectResult> Selected { get; }

    // 點選失敗事件
    IObservable<string> SelectFailed { get; }
}
```











