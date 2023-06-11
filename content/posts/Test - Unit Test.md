---
title: "Test - Unit Test"
date: 2023-06-04 21:11:00
draft: false

tags: ["Test"]
---

以下觀點不一定適用於各專案，請因地制宜。

## 以反面例子來看單元測試
- 慢
- 不穩定
- 脆弱
- 不方便

問題出在不可控
- 希望是可控的
- 可重現一樣結果

## 以整體專案的角度來看單元測試

專案內分為 不可控 與 可控 兩部分
- 不可控: 檔案/資料庫/第三方套件
- 可控: 除不可控以外自己所寫的部分

可控內分為 不可測 與 可測 兩部分
- 不可測: 與不可控接觸的部分，因此會希望這部分越單純越好。
- 可測: 為專案內價值較高，須小心維護的部分。

目標: 可測範圍盡量大，不可測盡量小。

![ChatGPT00](/images/UnitTest_Project_Controllability_Grading.png)

## FAQ

### 單元測試相較於手動測試的優勢 ?
- 可以輕鬆的跑完多個 Test Cases

### Static 要不要測 ?
- 直接使用真實行為
- 透過測試框架強測
- 重構/隔離/依賴注入

## Ref
- [一起設計出可被單元測試的程式碼吧！](https://www.youtube.com/watch?v=8lxTP2e5Uvk)
- [[Day 2]Unit Testing 簡介](https://ithelp.ithome.com.tw/articles/10102264)
- [.NET Core 和 .NET Standard 的單元測試最佳做法](https://learn.microsoft.com/zh-tw/dotnet/core/testing/unit-testing-best-practices)
