---
title: "通用設計 - Inversion of Control (IoC) 與 Dependency Injection (DI)"
date: 2023-05-05 20:05:00
draft: false

tags: ["Common Design"]
---

控制反轉 Inversion of Control，以下皆簡稱 IoC。     
依賴注入 Dependency Injection，以下皆簡稱 DI。

之前還有提到過 依賴倒置原則 (Dependency Inversion Principle，DIP)，而筆者理解到這三者的關係是
- DI 是 IoC 的一種實踐方式
- DIP 則能為 IoC 提高依賴穩定性

## 為什麼需要

- 資源複用: 
避免創建重複對象，有些對象只需要實例化一個就夠了，不需要使用方都自己 new 一個新的。

- 集中配置依賴項:
依賴需求方操作其依賴項來完成任務才是他主要的責任，如果還要處理依賴項的實例化(更不用說依賴項的依賴項要怎麼處理)，責任就模糊了，因此將依賴項的創建和配置的控制權交給 IoC Container。

## 基本操作

通常而 IoC Container 包含以下操作：
- Register：註冊類型和依賴關係
- Resolve：創建並註入依賴關係
- Dispose：管理生命週期

而實踐方式常見的有兩種

###  Service Locator 服務定位器
可以簡單理解為直接使用容器本身，因此依賴需求方在需要依賴的地方可以使用 Locator.Resolve 來取得依賴，但這樣有幾個問題
- Resolve<?> 可以填什麼 ?
- 是不是有註冊的項目都能任意取得阿 ?
- 這也是有些人認為服務定位器有反模式味道的點

### DI 依賴注入
依賴注入則是間接地使用容器，常透過三種方式注入依賴項，
-  建構子(推薦)
-  屬性
-  方法

權限相對清晰(建構子注入)，能用依賴項的都在建構子給你了，不過你要額外new 其他東西也是沒人攔得住。此外依賴需求方是不知道容器的存在(理想狀態，但有時會需要一些注入標記)
