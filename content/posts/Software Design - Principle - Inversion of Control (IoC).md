---
title: "Software Design - Principle - Inversion of Control (IoC)"
date: 2025-01-16 20:05:00
draft: false

tags: ["Software Design", "Principle"]
---

## Quick Chat

### 1. 如果你的程式中，有一個物件需要另一個物件，應該怎麼做？
- 直接由需求方 new 一個實例嗎？

### 2. 如果那個物件的建構方式很複雜呢？
- 例如，它可能需要多個參數，還需要一些初始化邏輯。
- 如果每次都在需求方進行這些操作，會不會重複又繁瑣？

### 3. 如果有多個需求方重複依賴這個物件呢？
- 這些需求方能共享同一個物件嗎？
- 如果共享，如何管理這個共用的實例？誰來負責它的生命週期？

### 4. 依賴管理是誰的責任？
- 需求方是否應該負責處理自己所有的依賴？
- 還是應該有一個「專門負責管理依賴」的角色？
- 如果有一個「外部機制」來幫你管理這些依賴，需求方只需要專注於自己的邏輯，不需要擔心如何建構物件，這樣會不會更簡單？

## 控制反轉 - 什麼反轉了？
控制反轉（Inversion of Control, IoC）就是為了解決這些問題而生的。它帶來了一個核心理念：

> 需求方不再自己去「控制」依賴的構建和配置，而是把這部分的「控制權」交給「外部機制」（通常是 IoC 容器）。

> 需求方只需專注於「接收」或「查詢」依賴，並專心「使用」它們。簡化需求方的職責，使其僅專注於處理業務邏輯，從而提升模組化與可維護性。

## 好處

### **依賴管理**
- 通過外部機制統一管理依賴，開發者不需要在各處手動管理物件實例的生命週期與建構邏輯。
- 容器能管理共享的物件實例，有效避免重複建構，提高資源利用率。
- 將依賴配置集中於容器，能輕鬆應對需求變更。例如，替換某個服務的具體實現時，只需要調整配置，而非修改多處程式碼。

### **提升模組化與可維護性**
- 需求方與具體實現之間的耦合度降低，使得每個模組能更容易地獨立開發、測試與替換。

### **提升測試便利性**
- 透過依賴注入，需求方可以接收模擬物件（mock）或測試替身（stub），從而更輕鬆地撰寫單元測試。
- sample - c#
    ```cs
    var mockStorageService = new Mock<IStorageService>();
    mockStorageService.Setup(service => service.SaveOrder(It.IsAny<Order>())).Verifiable();

    var orderService = new OrderService(mockStorageService.Object);
    ```
- sample - js
    ```js
    const mockStorageService = {
        saveOrder: (order) => {
        console.log(`Mock saving order ${order.id}`);
        },
    };

    const orderService = new OrderService(mockStorageService);
    ```

## 技術實現
### **組合根（Composition Root）**
- 集中管理所有依賴的構建與組合，通常位於應用程式的進入點。

### **依賴尋找（Dependency Lookup）**
- 需求方主動向容器請求所需的依賴。

### **依賴注入（Dependency Injection, DI）**
- 容器將依賴主動注入至需求方的機制，例如透過建構子注入、屬性注入或方法注入。
