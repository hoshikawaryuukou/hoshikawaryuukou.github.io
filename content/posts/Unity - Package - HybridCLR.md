---
title: "Unity - Package - HybridCLR"
date: 2023-04-11 21:11:00
draft: false

tags: ["Unity"]
---

## 簡述
以下將著重在"程式碼"的熱更。

[focus-creative-games/hybridclr](https://github.com/focus-creative-games/hybridclr)
星數已經超過 ILRuntime 了，且中國那邊的主流框架幾乎都對其加入支援，是備受期待的存在。

HybridCLR 極大簡化過往麻煩且效率不彰的熱更流程。現在主流的方式有兩個：Lua 和 ILRuntime。但主流並不一定是好用的，也有可能只是迫不得已。主流兩者在筆者看來最難受的事是「侵入性」極強，有時為了熱更必須將業務邏輯移到 Lua 和 ILRuntime，搞得綁手綁腳。大家也都抱怨很久了，但也沒有其他可靠方案，直到 HybridCLR 出現。

HybridCLR 最讓人驚豔的地方在於，過往的開發流幾乎不用更動(不用寫 Lua 到處黏來黏去，只要寫好 C# 即可)，僅在打包時調整一下工作流即可。
- 執行 HybridCLR/Generate/All
- 執行 HybridCLR/CompileDll/xxx 
- 將 熱更新的程序集和補充元數據的程序集 dlls 複製到指定目錄並進到資源管理中(Addressable)
- Build

沒錯就這樣即可。

此外 Unity 引擎開發團隊宣布，他們已開始將 Unity 引擎運行時從 Mono 遷移到 .NET CoreCLR。他們還會提供融合 JIT 和 AOT 的解決方案，Unity 團隊計劃在 2024 年發布新編輯器。(雖然常跳票就是了)，因此筆者相信 類HybridCLR 的作法在未來會成為主流做法，姑且先樂觀其成。

## 實測
為此筆者以一個小專案測試
- App Module 主模組，非熱更模組(包含AOT)
- Navigation Module 熱更模組(應用程式是可以接受動態導航的)
- RockPaperScissors Module 熱更模組(一個簡單的猜拳應用)

模組之間的關係
- App 啟動後會去下載 Navigation Module (一開始是沒有在本地)
- Navigation 有一組 UI 與下載 RockPaperScissors Module(也沒有在本地) 的邏輯段

測試結果 PC 與 Android 都可以完成動態加載邏輯與資源，且完全使用 C# 並以極低侵入完成熱更。在實作過程中反覆查了多次文件，確實需要一點成本來理解，但工作流(一次性)成型後便很舒服了。

## Official
- [关于HybridCLR](https://focus-creative-games.github.io/hybridclr/about/)
- [focus-creative-games/hybridclr](https://github.com/focus-creative-games/hybridclr)
- [focus-creative-games/hybridclr_trial](https://github.com/focus-creative-games/hybridclr_trial)
- [focus-creative-games/hybridclr_unity](https://github.com/focus-creative-games/hybridclr_unity)
- [HybridCLR c#热更新](https://www.zhihu.com/column/c_1489549396035870720)

## Guide (基本流程不太大變動，但用法以官方最新為主)
- [一小时极速掌握HybridCLR热更新](https://zhuanlan.zhihu.com/p/555544193)
- [【Unity3D热更新】Unity3D 零成本、高性能的C#的热更新框架：HybridCLR](https://blog.csdn.net/q764424567/article/details/124835067)
- [基于华佗热更新(HybridCLR)的热更新方案设计和接入](https://www.jianshu.com/p/51a9a757d238)
- [划时代的代码热更新方案hybridclr（wolong）源码流程解析](https://www.lfzxb.top/hybridclr-source-analyze/)
- [HybridCLR2.0.6+Yooasset+Unitask](https://www.bilibili.com/video/BV1pj411u7Jq?t=8.7)
- [HybridCLR 热更新配置](https://blog.csdn.net/weixin_43830069/article/details/129855550)
- [HybridCLR 探索](https://blog.csdn.net/NRatel/article/details/127355276)
- [CSDN Search](https://so.csdn.net/so/search?spm=1001.2101.3001.4498&q=HybridCLR&t=blog&u=&s=new&m=&chatId=&tm=90)

## 搭配 Addressable 使用
- [HybridCLR+Addressables资源代码全热更框架 二](https://blog.csdn.net/qq_40080418/article/details/125599135)
- [制作一个承载想法的东西（十三）—— 使用HybridCLR进行代码热更新](http://chicai.group/?p=1561)

## FAQ
在 github issue 上有一些重要的資訊
- [请问，Generate All、补充元数据的DLL更新的执行时机的最佳实践？](https://github.com/focus-creative-games/hybridclr/issues/57)
- [怎么卸载热更dll](https://github.com/focus-creative-games/hybridclr/issues/19)

## 注意
- 打包前運行 HybridCLR/Generate/All (打包前需要做一些防裁剪link.xml生成、橋接函數生成之類的工作)
- 僅僅是編譯熱更新 dll 或者將熱更新 dll 加入熱更新資源管理系統，不需要執行 HybridCLR/generate 下的命令。
- 補充元數據的 dll 的生成需要事先打包一次，每個平台都需要打包一次。不要走正式的打包流程，只需要點擊 Unity 的 Build 即可。
- CLI 規範中只能以 AppDomain 形式卸載所有 dll，不支持卸載單獨的 dll。而 il2cpp 是單例 AppDomain，因此這個要求是不符合規範的。要採用 HybridCLR DHE 的商業方案。不過筆者倒是不太擔心，畢竟 Unity client 通常不是需要常駐的應用，使用者也不太會把應用的每一個功能都點一遍，初估是還可以接受的。