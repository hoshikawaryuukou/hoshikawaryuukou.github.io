---
title: "FlowControl"
date: 2022-11-16 21:11:00
draft: false

tags: ["Common", "Flow"]
categories: ["Design"]
---

以下 Feature 指的是一個功能獨立的模塊 (畫面 ⇄ 業務)，Feature A 將簡稱 A。

## 問題
> 應用程式中有一個由 A 到 B 的**導航**，那這個**導航**是誰的責任? 以下討論三種狀況。

### A 直接依賴 B
由 A 將 B 實例化並操作他，簡單粗暴。但出現強耦合，強耦合不是問題但他破壞了 A 的獨立性。當流程發生變化時，可能需要到各個 Feature 去修改。
```
Feature A -> new Feature B
Feature A -> Open Feature B
```

### A 引入導航器使其能導航到 B
這作法將導航操作收斂到導航器中，但 A 仍然隱含的知道 B，這同樣破壞了 A 的獨立性。
```
Feature A -> INavigator.Route(View.FeatureB) // Enum
or
Feature A -> INavigator.Route("FeatureB") // 魔術字串
or
Feature A -> INavigator.RouteFeatureB()
```

### 導航是獨立操作
說到底 Feature 應該知道自己是能夠**被導航**或是**能導航到哪**嗎? 有必要重新審視一下實際情境

> A 有一個 "前往B" 的按鈕，按下去時代表什麼?
> 1. 將 A 關閉並導航至 B 
> 2. 還是 儘傳達**想(從A)前往B的意圖**

從上述 **直接依賴**與**引入導航器** 來看，選項 1 是不太樂見的。選項 2 則不會破壞獨立性，但很明顯需要一個額外的單位來負責這個 **想(從A)前往B的意圖** 。

## FlowControl

Coordinator/ FlowController/ Navigator 名字有很多，以下稱 **FlowControl**。有些人將這種模式稱作 Coordinator Pattern，但我仍覺得它屬於 Mediator Pattern 的一種變化。

 - FlowControl 作為**中介者**知道 Feature(s)
 - FlowControl 觀察 Feature(s) 的狀態來進行導航
 - Feature 對導航一無所知 (因此也不知道其他 Feature 的存在)
 - Feature 只是向外**告知自己的狀態**(觀察者模式)

Feature 發出的狀態可能是
- 完成操作
- 操作被中斷
- 想去的目標 

```
Feature A -> "Feature A Done"
FlowControl -> Close Feature A
FlowControl -> Open Feature B
```
```
Feature A -> "ContactUsByEmail"
FlowControl -> Unfocus Feature A 
FlowControl -> Open Feature ContactUs
```

## 總結
- 找一個人為導航負責
- 流程發生變化時易於修改(集中/可組合)
- 建議配合 DI 操作，以使實例化複雜度排除在流程控制外

## Resource
使用相同概念的庫，星數都破千可以安心嘗試/觀摩。
- [RxFlow](https://github.com/RxSwiftCommunity/RxFlow)
- [XCoordinator](https://github.com/QuickBirdEng/XCoordinator)

## Reference
連結都值得閱讀，多半都有作者們的想法與反思，也許閱讀後會有新的理解。此外大家的開發環境不同，需要自行做些調整(精簡或強化)。建議照順序閱讀以下連結。
- [The Coordinator](https://khanlou.com/2015/01/the-coordinator/)
- [In-App Navigation with Coordinators](https://hannesdorfmann.com/android/coordinators-android/)
- [Architecting iOS apps: Coordinators](https://blog.kulman.sk/architecting-ios-apps-coordinators/)
- [Coordinator and FlowController](https://github.com/onmyway133/blog/issues/106)
- [Coordinators Essential tutorial. Part I](https://medium.com/blacklane-engineering/coordinators-essential-tutorial-part-i-376c836e9ba7)
- [Coordinators on Android: how to build flows quickly with reusable screens](https://monzo.com/blog/coordinators-on-android-building-flows-quickly-with-reusable-screens)
- [MVVM + Coordinators + RxSwift and sample iOS application with authentication](https://wojciechkulik.pl/ios/mvvm-coordinators-rxswift-and-sample-ios-application-with-authentication)
- [How to pass data between views using Coordinator pattern in Swift](https://benoitpasquier.com/data-between-views-using-coordinator-pattern-swift/)
- [Navigators Part 1: a Flow-Based Architecture for Android](https://medium.com/@greg_63957/navigators-part-1-a-flow-based-architecture-for-android-b66df2fa6e79)
