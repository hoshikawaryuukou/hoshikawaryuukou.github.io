---
draft: false
title: Software Design - Architecture - Clean Architecture
date: 2023-02-04T20:00:00+08:00
tags:
  - Software_Design
  - Architecture
---

## Quick Chat

談到 Clean Architecture (CA)，我們總會先看到 Uncle Bob 的這張經典分層圖：

[![CA Layers](https://blog.cleancoder.com/uncle-bob/images/2012-08-13-the-clean-architecture/CleanArchitecture.jpg)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

本文不會逐一詳解 CA 的所有規則與細節，而是更側重於分享它如何改變了我的設計思維，以及在實際開發中的一些經驗與權衡。畢竟，對於追求可擴展性的專案來說，系統架構是確保應用程式能夠持續健康演化的關鍵。

如果想深入了解 CA 的完整概念，文末的參考資料整理了相當豐富的連結。

Clean Architecture 並非銀彈，導入它需要付出額外的設計與分層成本。但它所倡導的**關注點分離**、**單向依賴**和**以業務為核心**的理念，即使不完全照搬，也能為我們在設計任何規模的系統時，提供一個清晰且強大的思考框架。

## Guide

「這份清單是我從數百篇文章中精選而來，每一篇都相當有價值，建議深入閱讀。」

### Basic
- [Software Architecture - Clean Architecture](https://atomiv.org/knowledgebase/software-architecture/clean-architecture)
- [Clean Architecture](https://learning-notes.mistermicheels.com/architecture-design/reference-architectures/clean-architecture/)
- [Clean architecture for the rest of us](https://pusher.com/tutorials/clean-architecture-introduction/#adapters)
- [GitHub - serodriguez68/clean-architecture: A detailed summary of Clean Architecture by Robert C Martin (Uncle Bob)](https://github.com/serodriguez68/clean-architecture)
- [Clean Architecture の勘所は『鎖国』だ。](https://qiita.com/t2-kob/items/02a76572693130c9a66e)
- [搞笑談軟工: 領域邏輯與應用邏輯](https://teddy-chen-tw.blogspot.com/2019/12/blog-post_10.html)

### Practice
- [Unityを利用した大規模なゲーム開発にクリーンアーキテクチャを採用した話](https://developers.wonderpla.net/entry/2021/02/18/121932)
- [Getting Started With Clean Architecture for Android [Part 1]](https://www.cobeisfresh.com/blog/getting-started-with-clean-architecture-for-android-part-1)
- [Clean Architecture on Frontend](https://dev.to/bespoyasov/clean-architecture-on-frontend-4311)

### Discussion
*以下參考資料著重於觀念釐清（可能會帶有較重的教條色彩），以及初期探索時容易踩坑的地方與相關討論串。*

- [Clean Architecture Guide (with tested examples): Data Flow != Dependency Rule](https://proandroiddev.com/clean-architecture-data-flow-dependency-rule-615ffdd79e29)
- [Why data layer has a dependency on the domain layer?](https://github.com/android10/Android-CleanArchitecture/issues/136)
- [Do Interactors in "clean architecture" violate the Single Responsibility Principle?](https://softwareengineering.stackexchange.com/a/364727)
- [Layer for Managers and Services that require Android Context](https://github.com/android10/Android-CleanArchitecture/issues/151)
- [Why you need Use Cases/Interactors](https://proandroiddev.com/why-you-need-use-cases-interactors-142e8a6fe576)
- [What is the use of DTO instead of Entity?](https://softwareengineering.stackexchange.com/questions/373284/what-is-the-use-of-dto-instead-of-entity)
- [Clean Architecture: Use case containing the presenter or returning data?](https://softwareengineering.stackexchange.com/questions/357052/clean-architecture-use-case-containing-the-presenter-or-returning-data)
- [How to make the controller framework independent in Clean Architecture?](https://softwareengineering.stackexchange.com/questions/420323/how-to-make-the-controller-framework-independent-in-clean-architecture)
- [Clean architecture - where to put input validation logic?](https://stackoverflow.com/questions/57603422/clean-architecture-where-to-put-input-validation-logic)
- [How to pass the android dependent data from data-layer to presentation-layer](https://github.com/android10/Android-CleanArchitecture/issues/182)


## Thinking

坦白說，我導入 CA 的專案經驗僅限於一個 casino 平台，而該專案最終因資金問題未能持續。因此，我並沒有機會在一個長期運維的產品中，見證最高規格 CA 的完整生命週期。

即便如此，其中的幾個核心觀念對我的影響依然十分深遠。

### 1. 分層與單向依賴：穩定核心的基石

CA 最核心的價值在於**依賴原則 (The Dependency Rule)**，也就是所有依賴關係都必須指向內部。這帶來了幾個顯著的好處：

* **穩定的單向依賴流**
    紊亂的依賴關係是專案腐化的開端，容易導致「牽一髮而動全身」的窘境。CA 強制依賴方向由外向內，確保了核心的業務邏輯 (Domain) 不會受到外部「易變動」部分（如 UI、資料庫、第三方服務）的影響，從根本上阻斷了不穩定的依賴。

* **依賴反轉原則 (DIP) 的實踐**
    「內層定義介面，外層實作」是 DIP 的精髓。這個設計在需要切換不同實作（例如更換資料庫、Mock 測試物件）時，搭配依賴注入 (Dependency Injection) 就會變得非常靈活、輕而易舉。

* **跨層依賴的權衡**
    在實踐中，DataAccess 的介面通常會直接引用到 Domain 層的 Entity。在參考許多討論後，我認為這是一個可以接受的權衡。因為它的 **「上下文單純」** —— Data Access 的實作層只專注於持久化物件與 Entity 之間的轉換，不應包含任何其他的業務邏輯，風險相對可控。

### 2. Use Case：讓架構尖叫

Use Case (或稱 Interactor) 是應用程式所有功能的說明書，只要看過所有 Use Case，就能清楚地了解這個系統到底能做什麼。這種風格也被稱為**尖叫的架構 (Screaming Architecture)** —— 你的架構本身就在吶喊著系統的意圖，而不是它所使用的框架。

將一個完整的「業務操作」封裝到一個類別中，我直接感受到的好處是：當需求變更時，能夠非常迅速地定位到要修改的程式碼。

* **定義「做什麼」，而非「如何做」**：Use Case 透過介面隱藏了所有實作細節，讓業務流程的意圖更加清晰。
* **業務邏輯集中化**：所有相關的業務流程、輸入與輸出都集中在一個地方，易於理解與維護。

在這之前，我從未想過將單一業務操作封裝成一個類別。雖然接觸過類似的設計模式（如 Command、Strategy），但它們更偏向功能性或演算法的封裝，不像 Use Case 這樣直接反映了應用程式的需求。

**關於 Use Case 的一些常見討論：**

* **Use Case 可以依賴其他 Use Case 嗎？**
    可以，但應盡量避免。我會將共用的邏輯抽離，並讓被依賴的 Use Case 保持 `internal` 可見度，限制其使用範圍。

* **Input Port (介面) 有必要嗎？依賴方向本來就向內了。**
    當 Use Case 本身需要被抽象化或替換時（例如在特定情境下使用不同的實作），Input Port 就是必要的。如果沒有這種需求，可以省略以簡化設計。

* **Use Case 有哪些常見的寫法風格？**
    常見的有兩種：一種是將相關操作組織在一個 Service Class 中，形成**方法集**；另一種則是遵循 **CQRS (Command Query Responsibility Segregation)** 風格，將讀取與寫入操作嚴格分離。

### 3. Adapter 的威力：隔離所有不穩定

過去我總覺得更換套件（例如 ORM、快取工具）是一件非常棘手的事，每次更換都像一場痛苦的移植手術。

在理解 CA 後，透過 DIP 搭配 **Adapter 模式**，可以將所有不穩定的外部依賴（如 Presentation、Database、第三方 Service）安置在應用程式的最外層。當需要更換實作時，只需新增一個對應的 Adapter，而不需要更動任何核心業務邏輯。這讓「更換實作」從一場災難變成了一件輕鬆平常的事。
