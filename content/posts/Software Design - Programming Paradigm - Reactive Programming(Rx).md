---
title: "Software Design - Programming Paradigm - Reactive Programming(Rx)"
date: 2025-02-22 21:05:00
draft: true

tags: ["Software Design", "Programming Paradigm"]
---

## Quick Chat
- 核心思想是「**一切皆流（Everything is a Stream）**」+「**響應式（Reactive）**」。
- 不直接改變狀態，而是**透過 Observable 來監聽數據變化**，並且**用操作符（Operators）處理流**。
- Example: 
    ```cs
    var hpStream = new ReactiveProperty<int>(100);

    hpStream
        .Where(hp => hp <= 0)
        .Subscribe(_ => Debug.Log("Player Died"))
        .AddTo(disposables);

    hpStream.Value -= 20;  // 這會觸發 hpStream 的變更
    hpStream.Value -= 80;  // 這次 hp <= 0，會觸發 "Player Died"
    ```