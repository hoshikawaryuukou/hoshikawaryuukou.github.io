---
draft: false
title: Software Design - Pattern - Model View Presenter (MVP)
date: 2022-12-10T10:00:00+08:00
tags:
  - Software_Design
  - Pattern
---

## Quick Chat

在 Unity 開發中，MVP（Model-View-Presenter）是我最常用的架構模式。相比之下，MVC（Model-View-Controller）在實作上常有模糊地帶，Controller 容易與 View 過度耦合；而 MVVM（Model-View-ViewModel）則仰賴 Data Binding 機制的支援，會限制 View 的寫法與彈性。

MVP 的概念相對純粹，能清楚劃分各層的責任。在「關注點分離」（Separation of Concerns）的原則下，MVP 的構成如下：

- **Model**：負責資料處理與業務邏輯，不涉及畫面呈現，專注於商業規則。
- **View**：負責 UI 與使用者互動。在理想情況下，View 是「被動的」，只根據 Presenter 指令更新畫面，並將使用者操作回報給 Presenter。
- **Presenter**：作為 View 與 Model 的中介者，從 Model 取得資料並整理後交給 View 顯示；同時處理來自 View 的事件並驅動 Model。

## Guide

- [界面之下：还原真实的MV*模式](https://github.com/livoras/blog/issues/11)  
- [正确认识 MVC/MVP/MVVM](https://juejin.cn/post/6901200799242649607)  
- [站在思想层面看MVX架构](https://juejin.cn/post/6998093259893407757#comment)  
- [Unravelling MVC, MVP and MVVM](https://www.pragmaticcoding.ca/javafx/Frameworks/)  
- [【Unity】MV(R)Pパターンのすすめ](https://annulusgames-lab.blogspot.com/2022/12/unity-ui-mvrp.html)  

## Dependency 

在 MVP 模式中，Presenter 與 View 的互動方式主要有兩種，其核心差異在於「依賴方向」。

### 1. View 依賴 Presenter (Supervising Controller)

在這種做法中，View 會持有 Presenter 的引用。當發生使用者操作（如按鈕點擊），View 直接呼叫 Presenter 的方法處理。

- **流程**：`使用者操作 → View → Presenter → Model → Presenter → View 更新`
- **優點**：實作直觀，邏輯流暢。  
- **缺點**：View 直接依賴具體 Presenter，降低可重用性，也讓 View 測試變得困難。

### 2. Presenter 依賴 View (Passive View)

此風格中，Presenter 持有 View 的引用。常見做法是透過介面（Interface）與 View 溝通，但是否需要抽象化，取決於專案需求。

View 的責任僅在於：  
- 定義自身能提供的操作（方法）。  
- 對外發出事件（例如 `Observable`、`UnityEvent`、`delegate`）。  

- **流程**：  
  `使用者操作 → View 發出事件 → Presenter 監聽並處理 → Model → Presenter 呼叫 View 更新`

- **優點**：  
  - **解耦性**：若使用介面，View 可完全獨立於 Presenter，具備替換或重用的彈性。  
  - **可測試性**：可用 Mock View 單獨測試 Presenter。  

- **缺點 / 實務考量**：  
  - 直接依賴具體 View 雖增加耦合，但能減少程式複雜度。  
  - 如果僅是 UI「換皮」，通常不會更換整個 View 類別，介面抽象的價值有限。  
  - Presenter 的測試必要性值得思考：若 **Model 已測試、View 也有測試**，Presenter 多數僅扮演資料轉換與搬運的角色，單獨測 Presenter 的收益未必高。  

    

### Example - Passive View

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

