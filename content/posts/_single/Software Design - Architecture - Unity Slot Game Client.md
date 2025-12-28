---
draft: false
title: Software Design - Architecture - Unity Slot Game Client
date: 2025-06-30T10:00:00+08:00
tags:
  - Software_Design
  - Architecture
  - Unity
---

## Quick Chat

> 前端開發時，「狀態管理」一直是個大哉問。

本次的應用是 **Slot Game**，這類應用強調「表現層細節」，所以對於狀態的控制不像一般資料應用一樣單純，需要處理許多細部和即時的變化。

### 狀態管理挑戰

1. 響應式 data-binding 限制 : 
   - 若完全依賴響應式 data-binding，容易產生太多「中間態」(例如動畫進行中、結果待顯示、部分組件已經觸發...等)。
   - 這樣會造成 state 爆炸、難以追蹤維護。

2. 命令式流程控制的必要性 : 
   - 部分場景下，直接用命令式（imperative）流程更有效率。
   - 多組件聯動時的「動畫序列控制」。
   - 一連串的 user action/遊戲事件，需明確依序觸發。

### ⚙️ 技術棧一覽
- UniTask (異步)
- R3 (Rx，UniRx 後繼者)
- VContainer (依賴注入)
- LitMotion (Tween)
- YooAsset (資源管理)
- Newtonsoft Json (Json 解析)
- Alchemy (編輯器擴充)

## 專案結構

### Modules 主架構

```bash
project-root/
├── _Debug/         # 測試或實驗用模組
├── App/            # 啟動點與業務邏輯總控
├── GameAPI/        # 遊戲 API 定義
├── GameRunner/     # 遊戲平台通用組件 (純 UIComponent)
├── GameStage/      # 遊戲表演組件 (純 UIComponent)
└── Shared/         # 共用模組
```
- App：負責組合、調度各個模組，等於是專案的大腦。
- GameAPI：只放介面定義，跨模組通訊與擴充。
- GameRunner / GameStage：都是純 UIComponent (基本都是 Mono)。
- Shared：共用邏輯、工具類、資料結構都放這裡。
- _Debug：僅用於測試、debug，正式版本不打包。

### Module 模組（以單一模組為例）

```bash
module-root/
├── Res/              # 模組獨立資源
└── Scripts/          # 腳本程式碼
    ├── Editor/       # 編輯器相關
    └── Runtime/      # 執行時相關
```
- Res：模組內專屬資源包。
- Scripts/Editor：編輯器工具。
- Scripts/Runtime：模組實際邏輯，遊戲執行時會用到的部分。

### App-Runtime（運行時架構）

```bash
App-Runtime-root/
├── Configs/           # 配置與定義
├── Services/          # 封裝各種業務操作
├── Presenters/        # 控制流程、狀態綁定
└── Stores/            # 狀態管理
```
- Configs：所有定義類、配置文件，便於集中管理。
- Services：將業務操作進行封裝，利於重用及維護。
- Presenters：類似 MVP Pattern 的 Presenter，專注於流程控制和資料流。
- Stores：專責狀態儲存，確保資料一致性。


## 實作體悟 1：實務上的狀態變化

- 一個操作觸發多處改變（One-to-Many Updates）  
例如：用戶點擊「開始」後，同時啟動動畫、鎖定按鈕、重置分數、播放音效。

- 一個改變能被多處觸發（Many-to-One Triggers）  
例如：分數變化可能來自多種事件（贏分、補分、特殊獎勵），這些事件又同時影響相同的分數狀態。

### 響應式的場合：狀態需要被多處觀測時

有些狀態會被多個元件同時觀察，並且常常需要被組合運用來驅動畫面邏輯。針對這類情境，我會選擇將相關的狀態邏輯獨立封裝到 Store 內，並採取「單向資料流」設計，結合 RX（Reactive Extensions）等觀察者模式來統一管理狀態變化。

這種做法有幾個優點：
- 狀態變動能集中管理，避免多個來源同時修改導致混亂。
- Presenter（或 UI 層）只需要訂閱自己關心的狀態，無需額外管理彼此之間的監聽。
- 透過 RX 的 stream、pipe、merge、combine 等操作，可以很直覺地將複雜流程串接起來。

```cs
// 當 (GameState 變為 Idle) or (舞台表演結束)
// SpinButton 變成可互動的

Observable
    .Merge(
        appStore.GameStateRP.Select(state => state == GameState.Idle),
        gameStageDisplayer.EndStageTrigged.Select(_ => true))
    .Subscribe(gameRunnerSheet.SpinButton.SetInteractable)
    .AddTo(disposables);
```

```cs
// 監聽每個 Update
// 當玩家有互動或舞台正在表演，則重置 inactivity 時間
// 超過時間則觸發 inactivity 事件

Observable.EveryUpdate()
    .Where(_ => IsUserActive() || IsDisplaying())
    .Debounce(TimeSpan.FromSeconds(appConfig.InactivityThresholdSeconds))
    .Subscribe(_ =>
    {
        confirmDialogScreen.SetActive(true);
        confirmDialogScreen.SetMessage(APIGameMessagesConstants.MSG_DEMO_TIMEOUT);

        Observable.Merge(confirmDialogScreen.ConfirmRequested, confirmDialogScreen.CloseRequested)
            .Take(1)
            .Subscribe(_ =>
            {
                Debug.Log("User confirmed inactivity timeout, closing application.");
                appCloser.CloseApp();
            });
    })
    .AddTo(disposables);
```

### 命令式的場合：狀態封閉於單一流程時

有些狀態其實不會到處被訂閱或修改，像是遊戲中的「表演流程」這種緊密耦合、步驟明確的處理，我會直接用命令式的寫法，流程步驟一目了然，也比較方便 Debug 跟維護。

```cs
public async UniTask RunStep(StateStore stateStore, CancellationToken ct)
{
    // 依據類型分流
    if (StateType.IsSpecial(stateStore.Type))
        await specialEffectDirector.Run(stateStore.Prev, stateStore.Current, ct);
    else if (stateStore.Bonus == null)
        await normalEffectDirector.Run(stateStore.Current, ct);
    else
        await bonusEffectDirector.Run(stateStore.Current, stateStore.Bonus.Count, ct);

    // 執行額外演出
    if (stateStore.Prev.Count > 0)
        await extraEffectDirector.Run(stateStore.Prev, stateStore.Current, ct);

    // 處理連擊狀態
    if (stateStore.Chain != null)
    {
        totalScore += stateStore.Chain.Score;
        scoreSync.OnNext(totalScore);
        await chainEffectDirector.Run(stateStore.Prev, stateStore.Current, stateStore.Chain, ct);
    }

    // 其他事件
    if (stateStore.IsBonusTriggered)
        await bonusTriggerDirector.Run(ct);

    if (stateStore.Bonus?.ExtraCount > 0)
        await bonusExtraDirector.Run(stateStore.Bonus.ExtraCount, ct);

    // 判斷流程結束
    if (StateType.IsFinished(stateStore.NextType))
    {
        endEvent.OnNext(Unit.Default);

        if (stateStore.TotalScore > 0)
        {
            await finishDirector.Run(stateStore.TotalScore, ct);
            resetScore.OnNext(Unit.Default);
            totalScore = 0;
        }
    }
}
```

## 實作體悟 2：封裝操作

有時候會遇到一種情境：某個 API response 回來的資料，可能同時需要更新多個 store。這時候我會寫一個 service 來專門處理這類「跨多個 store」的初始化或同步邏輯。

像下面這個例子，就是把 app 初始化時需要設定的東西包成一個 service，讓每個 store 的狀態更新都集中在一起處理，維護起來比較有條理，也比較不容易出錯：

```cs
public sealed class InitializeApp 
{
    //...

    public void Execute()
    {
        //...

        authStore.SetJwt(jwt, jwtExpiration);
        gameInfoStore.SetBaseUrl(baseUrl);
        gameInfoStore.SetGameCode(gameCode);
    }
}
```

這樣一來，初始化流程不會散落在各個地方，邏輯也比較集中。如果之後有需要擴充或調整，也只要改這個 service 就好，維護起來比較方便。

## 實作體悟 3：GameStage 設計成純的 Displayer

> Displayer 本身完全不負責狀態邏輯、資料處理、流程判斷，它唯一的責任就是「接收訊號，把該演的動畫、音效、特效確實表現出來」。

這次的設計有幾個核心前提：
- 可獨立運作：Displayer 必須能單獨執行，且可以輕鬆指定測試資料進行驗證。
- 低耦合、高復用性：配置門檻要夠低，能夠在不同場景（正式/測試）下快速被複用，不需額外負擔。
- 資料格式彈性：資料來源會先轉換成內部專用的表演模型，再交由流程控制模組解讀。這樣一來，就算資料來源或格式有變動，只要維護轉換邏輯即可，大幅減少對後續表現層的影響。
