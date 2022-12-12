---
title: "邏輯與畫面分離 - MVP 與 MVVM"
date: 2022-12-10 20:05:00
draft: false

tags: ["關注點分離"]
categories: ["Design"]
---

## 導覽
網上已經有很多不錯的文章，再寫一份類似的整理文章意義也不大，對 MVP / MVVM 感到陌生，不妨閱讀以下連結，會幫助你理解 MV系列 的發展。因此這裡提出一些使用場合與風險考量。

- [界面之下：还原真实的MV*模式](https://github.com/livoras/blog/issues/11)
- [正确认识 MVC/MVP/MVVM](https://juejin.cn/post/6901200799242649607)
- [站在思想层面看MVX架构](https://juejin.cn/post/6998093259893407757#comment)
- [MVP Pattern: Part 2 Supervising Controller](https://deltatimer.com/260/mvp-pattern-part-2-supervising-controller)
- [Part 2 — Converting Presenters into ViewModels](https://proandroiddev.com/converting-presenters-into-viewmodels-c9279c7516e7)

## 前述
眾所周知畫面(View)的變更需求是很高的，因此會希望邏輯與畫面分離，以實現關注點分離（separation of concerns）。
- 邏輯專注於業務處理。
- 畫面專注於使用者互動。

但分開的事務之間仍需溝通，因此需要有單位出來做協調，MVP 與 MVVM 兩者以不同方式來實作。
- MVP - Presenter 
- MVVM - ViewModel

![Example image](/images/MVP_MVVM_p0.PNG)

#### 題外話 
- 筆者不使用"優點/缺點"而用"場合/風險"，因為優點/缺點是要看上下文的。

## MVP ( Model-View-Presnter)
- 中介者模式( Mediator Pattern )，Presenter 協調 Model 與 View，使邏輯與畫面解耦。
- Presnter 依照**依賴倒置原則**開出 IView 介面讓 View 來實作，以達到無痛切換 View。而 View 設計成 Passive View 完全被 Presnter 操控。

### 場合
- 筆者開發預設使用 MVP，因為其設計風格是**命令式**的，編寫上較為直覺，且不需額外的擴充功能便可實踐(只需依賴倒置)，實作成本低。
- 當上下文是純粹輸出時，比較沒有**狀態**的概念時(數據不會被二次參考)。
- Ex: 戰鬥傷害數值呈現，僅在畫面中閃過即結束。

### 風險
狀態很容易最終分散在 Presenter 和 View 之中，畢竟很直覺地把數據倒給了 View 。如果上下文中"**狀態**"很重要的話，可以評估採用 MVVM 。


## MVVM ( Model-View-ViewModel )
- 觀察者模式( Observer Pattern )，與 MVP Presenter 不同 ViewModel 對 View 一無所知，僅是公開狀態/據流供外部觀察， View 藉著觀察 ViewModel(s) 的狀態來更新畫面。
- 一個 ViewModel 可被多個 View 觀察，以解決狀態一致性問題。
- (可選) Data Binding 可簡化綁定動作。

### 場合 
- 聲明式 UI 與 Data Binding 在主流前端框架的支援很高，幾乎能無痛使用。
- 當狀態會被多個 View 呈現時。
- 使用者必須與狀態互動時。
- Ex: 表格互動。

### 風險
ViewModel 怎麼切的合適是筆者覺得最難的，太大很能管控，太小又會導致狀態分散。十分依賴規劃者的經驗。

## 總結
視上下文決定使用哪個，兩個混用也不是不行。