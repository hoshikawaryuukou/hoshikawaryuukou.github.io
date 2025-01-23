---
title: "Software Design - Principle - Inversion of Control Implementation"
date: 2023-05-05 20:05:00
draft: true

tags: ["Software Design", "Principle"]
---

## 組合根（Composition Root）

## 依賴注入（Dependency Injection, DI）

## 依賴尋找（Dependency Lookup）


為此需要有一個 IoC Container 來處理，通常容器包含以下操作：
- Register：註冊類型和依賴關係
- Resolve：創建並註入依賴關係
- Dispose：管理生命週期

## 實踐方式
最常見的方式分別是 依賴注入（Dependency Injection，DI）與 依賴尋找（Dependency Lookup）。

### 依賴尋找
可以簡單理解為 **依賴需求方 << 主動 >> 使用容器來取得依賴**。依賴需求方直接使用 Locator.Resolve 取得依賴，但這種作法有些爭議(反模式)，依賴需求方是不是有註冊的項目都能任意取得阿 ?

Service Locator 服務定位器是依賴尋找的典型實作。

### 依賴注入
透過注入依賴項讓 **依賴需求方 << 被動 >> 使用容器來取得依賴**，常透過三種方式注入。
-  建構子(推薦)
-  屬性
-  方法

權限相對清晰(建構子注入)，能用依賴項的都在建構子給你了，不過你要額外new 其他東西也是沒人攔得住。

這個方式通常透過框架來處理，此外依賴需求方是不知道容器的存在(理想狀態，但有時會需要一些注入標記)。


