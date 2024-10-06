---
title: "Electron - Note"
date: 2024-09-22 21:11:00
draft: false

tags: ["Electron"]
---

## Guide
- [electron-builder](https://www.electron.build/)
- [Electron学习指引](https://muyacode.github.io/FrontEndLearnNotes/Document/%E8%B7%A8%E5%B9%B3%E5%8F%B0%E6%A1%8C%E9%9D%A2%E7%AB%AF%E5%BC%80%E5%8F%91/Electron/Guide)
- [awesome-electron](https://github.com/sindresorhus/awesome-electron)
- [awesome-electron-alternatives](https://github.com/sudhakar3697/awesome-electron-alternatives)

## Core - Process

Electron 的進程機制主要由兩個部分組成：**主進程(Main Process)** 和 **渲染進程(Renderer Process)**。

### 主進程 (Main Process) 
- 每個 Electron 應用僅有一個主進程。
- 主進程負責創建應用的主窗口，並管理應用的生命周期。
- 主進程的權限非常高，它可以調用 Node.js 提供的所有 API，也可以與操作系統進行交互(例如：檔案系統操作、創建子進程、打開原生對話框) 。
- 主進程負責創建和管理應用中的所有窗口(BrowserWindow) ，並能夠與渲染進程進行通信。

###  渲染進程 (Renderer Process) 
- 每個應用窗口都是一個獨立的渲染進程，負責渲染網頁內容(HTML、CSS、JavaScript) 。
- 渲染進程本質上是運行在 Chromium 引擎中的網頁環境，它擁有與一般瀏覽器類似的行為和限制。
- 渲染進程的權限較低，為了安全起見，它無法直接訪問 Node.js 的全部 API，但可以通過 Electron 的 contextBridge 和 ipcRenderer 與主進程通信。
- 渲染進程可以使用 Electron 提供的 preload 腳本，將一些 Node.js 模組或功能暴露給網頁。

### 進程間通信 (Inter-Process Communication, IPC)
- 主進程和渲染進程之間使用 IPC 進行數據傳遞。
- 渲染進程使用 ipcRenderer 發送消息給主進程，而主進程使用 ipcMain 接收和回應這些消息。反之，主進程也可以向渲染進程發送消息。
- Electron 提供的 contextBridge 和 preload 腳本讓渲染進程能安全地與主進程進行通信，避免直接暴露過多的 Node.js API，從而提高應用的安全性。

## Core - Module

### app
- 主進程模組，用來控制整個應用的生命周期。它包含了一系列的事件和方法，用於管理應用的初始化、運行、退出等流程。

### BrowserWindow
- 主進程模組，用來創建和管理應用窗口的模組。
- 每個 BrowserWindow 實例代表一個獨立的瀏覽器窗口，並且運行在自己的渲染進程中。

### ipcMain
- 主進程模組，用來處理進程間通信的模組。

### ipcRenderer 
- 渲染進程模組，用來處理進程間通信的模組，
- 不要直接在網頁中使用 ipcRenderer，而是通過 preload 腳本中的 contextBridge 暴露安全的 API 給渲染進程。

<!-- ### Others
- [利用 electron.js 建立桌面 APP ( Windows )](https://hackmd.io/@c36ICNyhQE6-iTXKxoIocg/BJXGRjI4I) 
- [Electron和Vite结合的一些思考](https://blog.csdn.net/2301_79959413/article/details/134029388)
- [lx-music-desktop](https://github.com/lyswhut/lx-music-desktop)
- -->