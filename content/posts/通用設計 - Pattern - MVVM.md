---
title: "通用設計 - Pattern - MVVM"
date: 2022-12-10 20:05:00
draft: true

tags: ["Common Design"]
---

## 前述

此篇不會詳細介紹 MVVM，如果對 MVX 系列不熟，可以先去讀筆者之前的這篇文裡面的 Reference
> 通用設計 - Pattern - MVP

簡略說一下 MVVM 的特點
- Data-Driven : 前端畫面的數據源頭
- ViewModel 不知道 View 的存在 : ViewModel 更好被測試
- 職責更明確: ViewModel 儲存狀態管理流程 / View 不用用管理狀態 專心畫面呈現

接下來討論會著重在筆者對 MVP 在部分情境下的調整與混用 MVVM 的經驗

## ViewModel

在 MVP 開發中 Persenter 除了要調用 View/IView 方法
還要管理狀態，當然有時會直接將狀態塞至 View 中
但在處理向 循環物件時 View 是會被重複刷的 必須由presenter管理 可以明顯感受到需要 vm 的存在




## Ref
- [Android Developers 文件/指南/UI 層](https://developer.android.com/topic/architecture/ui-layer?hl=zh-tw)








## 觀點

- 有沒有辦法在服務端都還沒有的情況下，讓客戶能操作到完整的體驗流(假資料)
- 有沒有一個地方放著 明確的狀態資料
- 循環物件時可以明顯感受到 vm 的存在
- 客戶端的 presentation 就是個撥放器



## 情境
- 井字遊戲
- Menu / Setting / GamePlay
- AppViewModel / GamePlayViewModel

AppViewModel
- Menu/Setting/GamPlay 開啟狀態

GamePlayViewModel
- Turn/SelectResult/Selected/SelectFailed















## 前述

關注點分離（Separation of Concerns，SoC）: 在軟體開發中，一個模組或組件應該專注於解決特定的問題，而不是同時處理多個功能。每個組件都有自己的職責範圍，並且與其他組件盡可能解耦合。

而 MVC / MVP / MVVM 是關注點分離於前端的經典應用，網上已經有很多不錯的文章，再寫一份類似的整理文章意義也不大，對此感到陌生，不妨閱讀以下連結，會幫助你理解 MV系列的發展。

- [界面之下：还原真实的MV*模式](https://github.com/livoras/blog/issues/11)
- [正确认识 MVC/MVP/MVVM](https://juejin.cn/post/6901200799242649607)
- [站在思想层面看MVX架构](https://juejin.cn/post/6998093259893407757#comment)
- [MVP Pattern: Part 2 Supervising Controller](https://deltatimer.com/260/mvp-pattern-part-2-supervising-controller)
- [Part 2 — Converting Presenters into ViewModels](https://proandroiddev.com/converting-presenters-into-viewmodels-c9279c7516e7)

以下則對筆者實作中比較常用的 MVP 多做一些討論

## 關注點(責任)
在 MVP 的構成下分成三個部分
- Model: 應用程式的核心邏輯。
- View: 應用程式的使用者介面，負責呈現數據和接收使用者的輸入。
- Presenter:  View 和 Model 之間的中介。

### Passive View
這是 MVP 的一種實作風格，也是筆者主要使用的風格。
- Presenter 對 View 有完全控制權
- View 提供方法與事件給 Presenter 使用
- View 對 Presenter 一無所知

以猜拳遊戲的 View 為例
```csharp
public class View : MonoBehaviour
{
    [SerializeField] private Text messageText;
    [SerializeField] private Button[] playerChoices;
    [SerializeField] private Button nextButton;

    private readonly Subject<Choice> playerChoiceSelected = new Subject<Choice>();
    private readonly CompositeDisposable disposables = new CompositeDisposable();

    public IObservable<Choice> PlayerChoiceSelected => playerChoiceSelected;
    public IObservable<Unit> PlayerNextRequested => nextButton.onClick.AsObservable();

    void Awake()
    {
        disposables.Clear();
        playerChoices[0].onClick.AsObservable().Subscribe(_ => SelecteChoice(Choice.Rock)).AddTo(disposables);
        playerChoices[1].onClick.AsObservable().Subscribe(_ => SelecteChoice(Choice.Paper)).AddTo(disposables);
        playerChoices[2].onClick.AsObservable().Subscribe(_ => SelecteChoice(Choice.Scissors)).AddTo(disposables);
    }

    void OnDestroy()
    {
        disposables.Clear();
    }

    public void SetReady(string message)
    {
        messageText.text = message;
        nextButton.gameObject.SetActive(false);
    }

    public void SetResult(string message)
    {
        messageText.text = message;
        nextButton.gameObject.SetActive(true);
    }

    private void SelecteChoice(Choice choice)
    {
        playerChoiceSelected.OnNext(choice);
    }
}
```

## 依賴關係

依據不同的情境有兩種依賴關係

![MVP](/images/MVP.png)

(左) 定義 IView 介面
1. 著重在保持 Presenter 的控制邏輯
2. Presenter 依賴於 IView 介面
3. 主要應用於有換皮需求的 View


(右) 直接使用 View
1. 著重在保持 View 的獨立性(可能有跨專案需求)
2. Presenter 直接依賴 View
3. Presenter 基本與 View 綁定
