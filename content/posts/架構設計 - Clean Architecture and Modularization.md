---
title: "架構設計 - Clean Architecture and Modularization"
date: 2022-11-06 20:05:00
draft: true

tags: ["Architecture", "Module"]
---


## 模組化
Missing Part 也很重要

- [Multiple ways of defining Clean Architecture layers](https://proandroiddev.com/multiple-ways-of-defining-clean-architecture-layers-bbb70afa5d4a)




筆者習慣分成以下幾類模塊
  
### 核心模塊 (Core Module)
該模塊隨應用程式啟動時加載，整個應用程序中僅實例化一次，屬於全域共用，以下常見

- 模型：在多個功能模塊中使用的模型
- 組件：身份驗證、配置文件、頁眉、頁腳、佈局、主頁、錯誤、對話框等
- 服務：將由多個功能模塊使用的單例服務，即日誌、存儲、共享、模式、身份驗證、文件、微調器等

### 共享模塊 (Shared Module)
與 核心模塊 相似都為共用，但共享模塊面相較為特定
包含常用的指令、管道和組件，這些指令、管道和組件被功能模塊的組件重複使用和引用
主要為 功能模塊所引用

CommonModule, Material 模塊

### 功能模塊 (Feature Module)
聲明僅在該模塊中使用的模型、組件、服務和其他項目。
並且對於每個功能模塊，您還可以創建一個路由模塊。



Core 被共用
feature 完整體驗流


轉接頭
一條Port 傳輸線



[]()




