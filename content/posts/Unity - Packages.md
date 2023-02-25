---
title: "Unity - Packages"
date: 2022-11-12 21:11:00
draft: false

tags: ["Unity"]
---

## Package Manager
### Installing Packages using UPM
1. Package manager ->  Advanced project settings
2. Add Scoped Registries

```
Name: package.openupm.com
URL: https://package.openupm.com
Scope(s): 
         com.cysharp.unitask
```
3. Package manager -> Packages: My Registries -> Install

## Async
- [UniTask](https://github.com/Cysharp/UniTask)    
  - openupm - com.cysharp.unitask
  - [Patterns & Practices for efficiently handling C# async/await cancel processing and timeouts](https://neuecc.medium.com/patterns-practices-for-efficiently-handling-c-async-await-cancel-processing-and-timeouts-b419ce5f69a4)
  - [精选Unity-Github开源库分享 最完美的异步操作解决方案 UniTask](https://www.bilibili.com/video/BV1NG411s7hN/?spm_id_from=333.788)
  - [C# Task 指南](http://www.liuocean.com/2022/10/11/c-task-zhi-nan/)
  - [async/await,disposableを使って素直で読みやすいコードを書く](https://learning.unity3d.jp/7224/)
  - [UniTaskCompletionSource Should Support CancellationToken](https://github.com/Cysharp/UniTask/issues/81)

## Debug
- [UnityIngameDebugConsole](https://github.com/yasirkula/UnityIngameDebugConsole)

## Dependency Injection
- [VContainer](https://github.com/hadashiA/VContainer)  
  - openupm - jp.hadashikick.vcontainer  
  - [How to avoid Dependency Injection constructor madness?](https://stackoverflow.com/questions/2420193/how-to-avoid-dependency-injection-constructor-madness)

## Messaging 
- [MessagePipe](https://github.com/HoshikawaRyuukou/UnityDev/main/Note/Package/Messaging/MessagePipe.md)    
  - openupm - com.cysharp.messagepipe

## Network
- [MagicOnion](https://github.com/Cysharp/MagicOnion)

## Persistence
- [PlayerPrefs Editor & Utilities](https://github.com/sabresaurus/PlayerPrefsEditor)
  - openupm - com.sabresaurus.playerprefseditor

## Rx (Reactive Extensions)
- [UniRx](https://github.com/neuecc/UniRx)    
  - openupm - com.neuecc.unirx

## State Machine
- [UnityHFSM](https://github.com/Inspiaaa/UnityHFSM)
