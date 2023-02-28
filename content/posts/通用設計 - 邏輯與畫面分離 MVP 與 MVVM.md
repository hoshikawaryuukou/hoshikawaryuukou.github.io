---
title: "通用設計 - 邏輯與畫面分離 MVP 與 MVVM"
date: 2022-12-10 20:05:00
draft: false

tags: ["Common Design"]
---

## 導覽
網上已經有很多不錯的文章，再寫一份類似的整理文章意義也不大，對 MVP / MVVM 感到陌生，不妨閱讀以下連結，會幫助你理解 MV系列 的發展。因此這裡只是提出一些重點觀念與實作考量。

- [界面之下：还原真实的MV*模式](https://github.com/livoras/blog/issues/11)
- [正确认识 MVC/MVP/MVVM](https://juejin.cn/post/6901200799242649607)
- [站在思想层面看MVX架构](https://juejin.cn/post/6998093259893407757#comment)
- [MVP Pattern: Part 2 Supervising Controller](https://deltatimer.com/260/mvp-pattern-part-2-supervising-controller)
- [Part 2 — Converting Presenters into ViewModels](https://proandroiddev.com/converting-presenters-into-viewmodels-c9279c7516e7)

## 前述
眾所周知畫面(View)的變更需求是很高的，因此會希望業務與畫面分離，以實現關注點分離（Separation of Concerns，SoC）。但分開的事務之間仍需溝通，因此需要有單位出來做協調，MVP 與 MVVM 兩者以不同方式來實作。
- MVP: Model-View-**Presenter** 
- MVVM: Model-View-**ViewModel**

***Model 指的是業務邏輯可能是 DomainModel/ Usecase/ Service 等，依系統的規模架構而定。**

以下是筆者常使用 3 種類型的依賴關係
![Example image](/images/MVX.png)

## MVP (DIP)
- Presenter 基於 **依賴倒置原則** 定義 IView 介面來讓 View 實作。
- Presenter 可適用於不同的 View(IView)。
- View 被綁訂於定義出 IView 的 Presenter。
- View 一般設計成 Passive View。

## MVP
- Presenter 基於 **轉接器模式(Adapter Pattern)** 作為膠水代碼以協調 Model 與 View。
- Presenter 是配合 View 的那一方，畢竟在前端 View 組件是有一定的重用考量(也就是 View 不能改)。
- 基於實作上的經驗，View 更換的次數沒有想像中的高。所以這個方案是筆者比較常用的(實作最快)，當真的有變化時在往 MVP (DIP) 或 MVVM 調整即可。

## MVVM
- 與上述 MVPs 最大的不同是 ViewModel 對 View 一無所知，僅是公開狀態/數據流供外部觀察，完全隔離了畫面，**純粹管理狀態**。
- ViewModel 基於 **觀察者模式(Observer Pattern)**，所以一個 ViewModel 可被多個 View 觀察。
- View 只需要訂閱該狀態並反映它。Data Binding 可簡化綁定動作。
- 筆者覺得 ViewModel 的難點在於其大小，太大很能管控，太小又會導致狀態很分散。十分依賴規劃者的經驗。