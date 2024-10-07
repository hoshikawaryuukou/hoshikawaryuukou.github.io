---
title: "Software Design - Architecture - Web & Desktop app"
date: 2024-10-05 21:05:00
draft: false

tags: ["Software Design", "Architecture"]
---

## Quick Chat
(⚠️ 實驗中) 當一個要開發一個同時支援 **網頁端** 與 **桌面端** 的應用時，該如何設計。以下範例說明使用
- UIFramework : Vue3 
- Desktop Framework : Electron

## Architecture

```bash
project-root/
│
├── core/                  # 核心業務邏輯
│   ├── services/          # 服務層，包含業務邏輯 (e.g., FileManager)
│   ├── models/            # 共享的資料模型和接口
│   └── interfaces/        # 定義服務的接口 (e.g., IFileService)
│
├── presentation/          # UI 表現層 (Vue3 應用)
│   ├── components/        # Vue 組件
│   ├── views/             # Vue 頁面
│   ├── stores/            # Pinia 狀態管理
│   └── App.vue            # Vue 入口文件
│
├── web/                   # 瀏覽器端特定實現
│   ├── services/          # 瀏覽器環境下的文件操作等服務實現 (e.g., BrowserFileService)
│   ├── index.html         # 網頁版的入口
│   └── main.js            # 網頁版的啟動點，將核心業務注入 Vue
│
├── desktop/               # Electron 桌面端特定實現
│   ├── main/              # 主進程相關文件
│   │   ├── main.js        # Electron 主進程入口
│   │   └── preload.js     # 預加載腳本，用於將 Node API 注入到渲染進程
│   └── renderer.js        # 渲染進程啟動點，將核心業務注入 Vue
│
└── package.json           # 項目配置文件

```

## Thought
主體思想是基於 Clean Architecture，Clean Architecture 主張將業務邏輯與框架、UI 和其他技術細節分離，使得核心業務邏輯不依賴於特定的運行環境或框架。

- 分層設計：核心業務邏輯（core）與表現層（presentation）分離，並由不同運行環境（web 和 desktop）提供具體的服務實現，這樣可以保持應用的可擴展性和靈活性。

- presentation 層無需關心環境：presentation 層（Vue 3）只負責展示和用戶交互，不關心具體業務邏輯的實現細節。通過 inject 使用注入的依賴，確保組件的可重用性。

- 環境隔離：這種設計方式讓 web 和 desktop 各自維護自己的啟動邏輯和業務實現，從而保持清晰的架構分離。

## Extra - 映射

- Vue 3 開發網頁：你可以繼續使用 Vue 3 和其他前端技術來開發你的應用，就像開發一個標準的網頁一樣。

- Electron vs 瀏覽器：把 Electron 視為桌面上的瀏覽器。它加載你的 Vue 3 應用，並提供 Node.js API，這就像瀏覽器提供的 Web API（例如 fetch、localStorage）一樣，只不過 Electron 提供的是桌面端相關的 API（例如文件系統操作、系統通知等）。

- Node API vs Web API：Node.js API 在 Electron 中充當桌面端的「操作系統層 API」，可以做很多網頁端無法做到的事情，例如文件讀取、進程控制等。而在網頁端，使用的是 Web API，例如 fetch、localStorage 等進行網頁內的操作。
