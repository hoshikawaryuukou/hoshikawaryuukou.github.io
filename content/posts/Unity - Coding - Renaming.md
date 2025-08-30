---
draft: false
title: Unity - Coding - Renaming
date: 2024-03-27T10:00:00+08:00
tags:
  - Unity
  - Visual_Studio 
---

## Quick Chat

- Rider 能更好處理 Unity 開發環境的大小事，但你知道的費用... 👀
- 處理 Renaming 事務一律切到 Visual Studio，因為 VS Code 的支援很不到位。

## Field
- [Unity - Scripting API: FormerlySerializedAsAttribute](https://docs.unity3d.com/ScriptReference/Serialization.FormerlySerializedAsAttribute.html)

## MonoBehaviour Class

1. 現在 Unity 裡對 Class 重新命名（這時 .cs 檔會與 class name 不一致）
2. 到 Visual Studio 裡重新命名

⚠️ 順序錯誤可能會導致引用噴掉
⚠️ 步驟 2 先執行會導致 Unity 的 class 檔名會一起變動（有概率會出錯）

## Namespace

有兩個情境
1. 真的想重新命名 namespace （對著 namespace 直接右鍵重新命名即可）
2. 想把某 Type 歸屬到指定 namespace

情境 2 要使用 Visual Studio 的重構工具
1. 對著 Type 右鍵 - **快速動作與重構**
2. 選擇 **移到命名空間**（這樣所有的參考都會連動修改）



