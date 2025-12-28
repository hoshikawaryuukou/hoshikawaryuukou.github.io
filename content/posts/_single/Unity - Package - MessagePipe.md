---
draft: false
title: Unity - Package - MessagePipe
date: 2025-09-25T16:56:18+08:00
tags:
  - Unity
---

## Quick Chat

MessagePipe 是一個實現了「發布/訂閱」模式（Pub/Sub）的訊息中介函式庫。

Pub/Sub 的核心價值在於**實現最大化的鬆散耦合 (Loose Coupling)**。 

想像一個場景： 
- **發布者 (Publisher)**，例如遊戲邏輯模組，需要發送一個「玩家死亡」事件。它無需知道誰會對這個事件感興趣，只需將事件發布出去。 
- **訂閱者 (Subscriber)**，例如 UI 模組和音效模組，各自訂閱「玩家死亡」事件。

當事件發生時，它們會自動收到通知並執行相應的處理。在這個模型中，發布者與訂閱者之間沒有直接引用關係。MessagePipe 扮演了中介的角色，讓各模組可以獨立演進與測試，從而大幅提升專案的架構彈性。

⚠️ 在 Unity 中，MessagePipe 需要與 **UniTask**（用於非同步處理）和**依賴注入（DI）** 函式庫（如 **VContainer** 或 **Zenject**）搭配使用。

## Guide

官方 GitHub 文件提供了非常詳盡的說明與範例，是學習 MessagePipe 的最佳起點：
- [Cysharp/MessagePipe](https://github.com/Cysharp/MessagePipe)

### Extras

- 搭配 VContainer v1.14.0 之後可以簡化配置
  
```c#
using MessagePipe;
using UnityEngine;
using VContainer;
using VContainer.Unity;

public sealed class GameLifetimeScope : LifetimeScope
{
	protected override void Configure(IContainerBuilder builder)
	{
		// 只需這行即可
		builder.RegisterMessagePipe(); 
	}
}
```

## Notice

利用 MessagePipe 實現低耦合是個優秀的架構實踐，它能讓專案更具彈性，易於維護與擴展。然而，**任何工具都應避免濫用**。

過度的解耦，例如將所有事件都透過 Pub/Sub 傳遞，會導致**程式碼的流程變得隱晦、難以追蹤**。當你無法輕易地從一個事件的發布點找到所有訂閱者時，專案的整體邏輯就會變得支離破碎，這反而會增加除錯與維護的難度。

建議當模組之間確實沒有直接關聯，且需要「一對多」的廣播通知時，才是 MessagePipe 的最佳使用時機。