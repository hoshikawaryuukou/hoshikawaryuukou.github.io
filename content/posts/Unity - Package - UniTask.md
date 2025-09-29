---
draft: false
title: Unity - Package - UniTask
date: 2024-09-24T09:45:17
tags:
  - Unity
---

## Quick Chat

UniTask 是一個專為 Unity 設計的高效能非同步程式設計函式庫，它以 C# 的 `async/await` 語法為基礎，旨在提供一個比 Unity 原生 Coroutine (協程) 和內建 Task 更高效能、更低記憶體消耗的非同步解決方案。

雖然 Unity 2023.1 版本已正式引入 `UnityEngine.Awaitable`，為 `async/await` 提供了官方支援，但目前 UniTask 的生態系（例如與其他常用函式庫的整合）依然更加成熟和廣泛，因此在專案中導入 UniTask 仍是主流且可靠的選擇。
- [Unity - Manual: Await support](https://docs.unity3d.com/2023.2/Documentation/Manual/AwaitSupport.html)
- [【Unity 2023.1】 C# async/await 正式サポート？ Awaitable を使ってみよう！](https://www.youtube.com/watch?v=B2jiquau_TQ)

## Guide

UniTask 官方文件對其核心功能有非常清晰的說明，是最好的入門起點：
- [Cysharp/UniTask (Official GitHub)](https://github.com/Cysharp/UniTask)

若想參考更多教學資源，以下文章也提供了詳盡的介紹與範例：
- [UniTask | ScenarioFlow Lab](https://scenarioflow-lab.dotprologue.com/category/unitask/)
- [UniTask機能紹介 (Qiita)](https://qiita.com/toRisouP/items/4445b6b9bf00e49eb147)
- [UniTaskを使おう！ (HackMD)](https://hackmd.io/@-xLrSnFfROOeIeRnENCWcQ/Bke4eFcrd)

## vs. Coroutine 

Coroutine 是 Unity 原生支援的非同步處理方式。雖然堪用，但在複雜度、性能與可讀性上，UniTask 提供了更現代且強大的解決方案。

以下我們從幾個關鍵面向進行比較：

1.  **可讀性：從非線性結構到線性邏輯**
	*   **Coroutine**: 透過 `yield return` 語法來暫停與恢復。當非同步操作需要串接時（如下載完檔案再解析），程式碼的邏輯會被分割在不同的 `yield` 點之間，導致結構上的非線性，可讀性隨複雜度下降。
	*   **UniTask**: `async/await` 語法將複雜的狀態機轉換隱藏在編譯層面，讓開發者能以**從上到下的同步風格**編寫非同步程式碼，邏輯始終保持清晰。

2.  **回傳值：從迂迴的 Callback 到直接 `await`**
	*   **Coroutine**: 無法直接回傳值，需透過 Callback 或外部變數等繁瑣方式取得結果。
	*   **UniTask**: 使用 `async UniTask<T>` 可直接 `await` 非同步函式的回傳結果，語法乾淨俐落。

3. **錯誤處理：從靜默失敗到穩固的 `try-catch`**
	*   **Coroutine**: 內部例外 (Exception) 無法被外部 `try-catch` 捕捉，導致錯誤難以追蹤。
	*   **UniTask**: 與標準 `try-catch` 完美整合，任何非同步錯誤都能被穩定捕捉，程式碼更健壯。

4. **功能性：從基礎等待到強大的組合 API**
	*   **Coroutine**: 僅提供基礎等待功能，應對複雜流程需手動實現。
	*   **UniTask**: 內建 `WhenAll` (等待全部)、`WhenAny` (等待任一)、超時控制等豐富 API，輕鬆應對複雜場景。

5.  **生命週期：從強制綁定到靈活可控**
	*   **Coroutine**: 強制綁定 `MonoBehaviour`，限制了使用場景。
	*   **UniTask**: 預設獨立運行，同時提供 `CancellationToken` 機制，可**選擇性地**與 `GameObject` 生命週期綁定，兼具彈性與便利。

6.  **性能：從 GC 壓力到零記憶體分配**
	*   **Coroutine**: `StartCoroutine` 及部分 `yield` 指令會產生記憶體垃圾 (GC)。
	*   **UniTask**: 核心設計目標之一就是「零 GC」，透過 `struct` 和池化技術大幅降低記憶體開銷，對性能至關重要。

## vs. Task 

雖然 C# 的 `async/await` 語法原生支援 `System.Threading.Tasks.Task`，但在 Unity 開發環境中，直接使用它會帶來幾個關鍵問題。

1.  **不必要的記憶體分配 (GC Allocation)**
    `Task` 在執行過程中會產生 GC，對於需要穩定幀率的遊戲而言，這會增加效能負擔並可能引發卡頓。

2.  **與 Unity 執行緒模型不相容**
    `Task` 被設計在多執行緒環境中執行，它不了解 Unity 只能在「主執行緒」上存取絕大多數 API 的限制。如果 `Task` 的 `await` 後續操作被排程到背景執行緒，任何試圖操作 `GameObject` 或呼叫 Unity API 的行為都會導致例外錯誤。


## 非同步取消 (Cancellation)

在 Task-based 的非同步模型中，「取消」是一個至關重要的概念。一個 UniTask 一旦被取消，`await` 後續的程式碼將不會被執行。因此，最佳實踐是**盡可能將 `CancellationToken` 傳遞給所有非同步方法**。如果目標 API 不支援傳遞 `CancellationToken`，則應在關鍵執行點手動檢查。

若要將取消時機與 `MonoBehaviour` 的生命週期掛鉤，可使用 `this.GetCancellationTokenOnDestroy()` 來取得對應的 `CancellationToken`。

特別注意，在 WebGL 這類對性能敏感的平台，建議使用 `SuppressCancellationThrow` 來避免因取消而拋出 `OperationCanceledException`，進一步減少效能開銷。

更多關於取消機制的深入探討與實作模式，可參考此文：
- [【C#】async/awaitのキャンセル処理まとめ](https://qiita.com/toRisouP/items/60673e4a39319e69fbc0)


## 手動控制任務完成 (CompletionSource)

有時，我們需要手動控制一個 UniTask 何時完成、成功或失敗，這時 `UniTaskCompletionSource` 就派上用場了。它可以用來將基於事件或回呼的舊版 API 包裝成現代的 `async/await` 模式。

- [【UniTask】UniTaskCompletionSourceを使って好きなタイミングで結果を確定させるUniTaskを生成する](https://www.hanachiru-blog.com/entry/2021/07/10/221719)
- [Cancel a CompletionSource with a cancellation](https://github.com/Cysharp/UniTask/issues/81#issuecomment-635752670)

## 超時處理 (Timeout)

為非同步操作設定超時限制是一個常見需求。
- 建議使用 `TimeoutController` 來管理一組或複雜的超時邏輯。
- 盡量避免使用 `AttachExternalCancellation`，除非你非常清楚其底層行為。
















