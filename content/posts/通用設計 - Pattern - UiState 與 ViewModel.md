---
title: "通用設計 - Pattern - UiState 與 ViewModel"
date: 2023-08-27 20:05:00
draft: true

tags: ["Common Design"]
---

## 前述

此篇的實作方式參考到以下文件
- [Android Developers 文件/指南/UI 層](https://developer.android.com/topic/architecture/ui-layer?hl=zh-tw)

裡面提到一些 Presentation layer 設計方案
- 定義 UI 狀態
- 單向資料流
- 不變性

該文件更新頻率算高且有與時俱進，筆者印象中其架構設計從 MVVM -> 以 Domain/Application 為中心的設計，也可以看出主流架構有在產生變化。此篇不會詳細介紹 MVVM 的細節，如果對 MVX 系列不熟，可以先去讀筆者之前的這篇文章 **<<通用設計 - Pattern - MVP>>** 裡面的 References。

以下將針對一些開發情境進行探討
- 有沒有辦法在 **沒有服務端** 的情況下，讓客戶能操作到完整的體驗流 ?
- 有沒有一個地方放著明確的 **狀態** ?
- 有沒有辦法 UI 只做為一個純粹的撥放器 (使用者輸入源 & 狀態輸出畫布) ?

## Mediator

![ViewModel](/images/ViewModel.png)

(左邊)
基於僅 Presenter (MVP) 作為 **業務邏輯** 與 **UI** 的中介，
Persenter 除了要調用 View/IView 方法
還要管理狀態，當然有時會直接將狀態塞至 View 中
但在處理向 循環物件時 View 是會被重複刷的 必須由presenter管理 可以明顯感受到需要 vm 的存在

(右邊)
MVP 混用 ViewModel

基於 ViewModel 作為 **業務邏輯** 與 **UI** 的中介
ViewModel 只專注於畫面狀態，去跟業務溝通轉換成UI狀態
ViewModel 設計之初的目的便是
UI 很難測那直接將 ViewModel 作為 Presentation 的終端
正因為 ViewModel 統合了 Presentation 的所有業務轉換狀態
Presentation 只測到 viewModel

落實 Data-Driven : 前端畫面的數據源頭

ViewModel 不知道 View 的存在 : ViewModel 更好被測試

將ViewModel作為Presentation的終端：在MVVM中，ViewModel扮演了Presentation Logic（展示邏輯）的角色。這意味著ViewModel負責分區模型獲取的數據進行處理、整理，供View展示。因此，ViewModel成為連接Model和View的中間層，View不再包含複雜的業務邏輯，只負責展示和與ViewModel進行交互。


## Example

以一個井字遊戲為例，情境如下

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

使用 AppFlowController 根據 IAppViewModel 去開關對應的 Presenter

```csharp
public class AppFlowController : IDisposable
{
    private readonly IAppViewModel appVM;
    private readonly GamePlayPresenter gamePlayPresenter;
    ...

    private readonly CompositeDisposable disposables = new();

    public AppFlowController(IAppViewModel appVM, GamePlayPresenter gamePlayPresenter, ...)
    {
        this.appVM = appVM;
        this.gamePlayPresenter = gamePlayPresenter;
        ...
    }

    public void Start()
    {
        disposables.Clear();
        appVM.GameActiveRP.Subscribe(OnGameActiveRP).AddTo(disposables);
        ...
    }

    public void Dispose()
    {
        disposables.Clear();
    }
}
```

使用 GamePlayPresenter 根據 IGamePlayViewModel 去更新遊戲畫面

```csharp
public class GamePlayPresenter
{
    private readonly IGamePlayViewModel vm;
    private readonly GamePlayView view;

    private readonly CompositeDisposable disposables = new();

    public GamePlayPresenter(IGamePlayViewModel vm, GamePlayView view)
    {
        this.vm = vm;
        this.view = view;
    }

    public void Enable()
    {
        disposables.Clear();
        vm.TurnRP.Subscribe(OnTurnNumberChanged).AddTo(disposables);
        vm.Selected.Subscribe(OnSelected).AddTo(disposables);
        vm.SelectFailed.Subscribe(OnSelectFailed).AddTo(disposables);
        view.Show();
    }

    public void Disable() 
    {
        view.Close();
        disposables.Clear();
    }
}
```

