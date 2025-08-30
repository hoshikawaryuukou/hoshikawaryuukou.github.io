---
draft: false
title: Unity - Basic - Preprocessor Directives
date: 2023-07-07T16:56:18+08:00
tags:
  - Unity
  - CSharp
---

## Quick Chat 

在口語交流中，我們常用 **`Define`** 來稱呼，但正式名稱其實是 **前置處理器指示詞（Preprocessor Directives）**。

我最近接手一個舊專案時，發現裡面大量使用了 **條件式編譯**。例如：

```csharp
#if DEBUG
    Console.WriteLine("Debug version");
#endif
```

在 Unity 中，這類寫法也經常出現在處理不同平台或環境時：

```csharp
public class PlatformDefines : MonoBehaviour 
{
  void Start () 
  {
    #if UNITY_EDITOR
      Debug.Log("Unity Editor");
    #endif

    #if UNITY_IOS
      Debug.Log("iOS");
    #endif

    #if UNITY_STANDALONE_OSX
        Debug.Log("Standalone OSX");
    #endif

    #if UNITY_STANDALONE_WIN
      Debug.Log("Standalone Windows");
    #endif
  }          
}
```

前置處理器指示詞並非沒有代價，過度使用會帶來以下困擾：

- 編譯版本數量容易爆炸（至少是 `2^(指示詞分類數)` 種），使得除錯與測試難度上升。
- 在 Unit Test 中幾乎無法有效使用。
- 無法透過一般的編譯檢查來捕捉錯誤。
- 巢狀結構一旦出現，可讀性大幅降低。

最直接的影響就是：**問題會被延後發現！**

## Quide

- [C# 前置處理器指示詞](https://learn.microsoft.com/zh-tw/dotnet/csharp/language-reference/preprocessor-directives)
- [macroのカジュアル多用は危険](https://zenn.dev/mattak/articles/3ef65fd8c9db63)
- [Conditional Compilation](https://docs.unity3d.com/Manual/PlatformDependentCompilation.html)

## Practice

原則上能避免就避免使用，通常可以透過 **條件分支**、**策略模式** 或 **依賴注入** 來更清楚地表達邏輯，並提升程式的可維護性。

### ✅ 允許 — 少量使用 `UNITY_EDITOR` 在 MonoBehaviour

某些情境下需要針對編輯器做額外處理(客製編輯器)，這算是合理的使用方式：

```csharp
#if UNITY_EDITOR
...
#endif
```

### ✅ 建議 — 降低指示詞的影響範圍

若條件允許，可以透過 **介面定義** 將影響控制在實例化階段，避免在業務邏輯中直接出現。

```csharp
#if UNITY_EDITOR
var runner = new EditorRunner();
#elif UNITY_IOS
var runner = new IOSRunner();
#elif UNITY_ANDROID
var runner = new AndroidRunner();
#endif
```

### ✅ 建議 — 善用 `ConditionalAttribute`

官方文件也建議使用 `ConditionalAttribute`，可在不污染邏輯的情況下控制程式是否執行。

```csharp
[Conditional("DEBUG")]
private void DebugLog(string message)
{
    Debug.Log(message);
}
```