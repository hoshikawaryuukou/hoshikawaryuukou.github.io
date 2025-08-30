---
draft: false
title: Unity - Basic - Assembly Definition (Asmdef)
date: 2023-06-19T12:46:15+08:00
tags:
  - Unity
---

## Quick Chat

**Assembly Definition (asmdef)** 檔案是 Unity 用來組織和管理專案程式碼的工具。它能將你的腳本分組，形成多個獨立的「**程式集 (Assembly)**」。

在沒有使用 `asmdef` 的情況下，Unity 會將所有腳本編譯成一個單一、龐大的 **Assembly-CSharp.dll** 程式集。這會導致兩個主要問題：

* **編譯時間長**：每次修改任何一個腳本，都必須重新編譯整個巨大的程式集，拖慢開發進度。
* **程式碼依賴混亂**：所有腳本彼此間都可以任意存取，使得依賴關係變得複雜且難以管理。

`asmdef` 的核心價值就是為了解決這些問題。

## Guide
- [Doc - Assembly definitions](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html)
- [Unity中 .asmdef文件的作用](https://zhuanlan.zhihu.com/p/139090680)

透過 `asmdef`，你可以將專案切分成邏輯上獨立的程式碼區塊，每個區塊都有自己的 `asmdef` 檔案，這帶來三大優勢：

1.  **大幅縮短編譯時間**
    這是 `asmdef` 最重要的優點。當你只修改了某個程式集的腳本時，Unity 只會重新編譯那個程式集，以及任何依賴它的程式集。沒有被影響的部分則不會被重新編譯，能顯著加快開發迭代的速度。

2.  **改善程式碼結構**
    `asmdef` 強制你明確定義程式集之間的依賴關係。一個程式集只能存取它所引用的程式碼，這能避免不必要的依賴，讓專案結構更清晰、更易於維護和重用。

3.  **增強程式碼封裝性**
    你可以更好地控制程式碼的存取權限，防止內部函式被外部不相關的程式集隨意使用。

## Package 與 Asmdef 的關係

Unity 的 **Package Manager** 系統正是建立在 `asmdef` 的基礎上。每個 Unity 套件都必須使用 `asmdef` 來定義其程式集結構，確保套件內的程式碼與專案其他部分相互獨立，只透過明確的引用進行互動。

這也是為什麼你在使用或開發 Unity 套件時，會看到每個功能模組都有其對應的 `asmdef` 檔案。

## 常見的結構：Runtime 與 Editor

在許多 Unity 專案和套件中，最常見的 `asmdef` 結構是將程式碼區分為 **Runtime** 和 **Editor** 兩部分：

* **Runtime 程式集**
    * **用途**：包含遊戲執行時所需的程式碼，會被編譯進最終的遊戲建置中。
    * **限制**：**不能**引用任何 `UnityEditor` 相關的程式碼或 API。

* **Editor 程式集**
    * **用途**：包含只在 Unity 編輯器環境中運行的工具程式碼，例如自訂檢視器（Custom Inspector）。
    * **限制**：**不會**被編譯到最終的遊戲建置中。通常會引用對應的 Runtime 程式集，但 **Runtime 程式集絕對不能反過來引用 Editor 程式集**。

這種結構能確保最終的遊戲建置只包含必要的程式碼，避免錯誤並有效縮小檔案大小。