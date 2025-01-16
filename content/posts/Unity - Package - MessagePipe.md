---
title: "Unity - Package - MessagePipe"
date: 2025-01-09 22:11:00
draft: false

tags: ["Unity"]
---

## Guide
- [Cysharp/MessagePipe](https://github.com/Cysharp/MessagePipe)

## Extras
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
