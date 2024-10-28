---
title: "Electron - Note"
date: 2024-10-11 09:11:00
draft: false

tags: ["Electron"]
---

## Core Spirit
Electron 是一個使用 JavaScript、HTML 和 CSS + Native Api 做相容多個系統（Windows、Linux、Mac）的桌面應用程式**構建**框架 —— 不需要本地開發經驗。

## Guide
- [Build cross-platform desktop apps with JavaScript, HTML, and CSS | Electron](https://www.electronjs.org/)
- [electron-builder](https://www.electron.build/)
- [Electron学习指引](https://muyacode.github.io/FrontEndLearnNotes/Document/%E8%B7%A8%E5%B9%B3%E5%8F%B0%E6%A1%8C%E9%9D%A2%E7%AB%AF%E5%BC%80%E5%8F%91/Electron/Guide)
- [awesome-electron](https://github.com/sindresorhus/awesome-electron)
- [awesome-electron-alternatives](https://github.com/sudhakar3697/awesome-electron-alternatives)

## Suggestion

🤓 強烈建議第一次接觸 Electron 的開發者實際走一次官方 quick-start，會對 Electron 的本質有更純粹的認識。
- [electron/electron-quick-start](https://github.com/electron/electron-quick-start)

再逐步的嘗試以下機制 :
- 用 BrowserWindow 再額外創建一個窗口。
- 用 ipcMain/ipcRenderer 來達到進程間交互。

## Notice
- ⚠️ [Electron 中的 ES 模塊 (ESM) 並未 100% 支援](https://www.electronjs.org/zh/docs/latest/tutorial/esm)


<!-- ### Others
- [利用 electron.js 建立桌面 APP ( Windows )](https://hackmd.io/@c36ICNyhQE6-iTXKxoIocg/BJXGRjI4I) 
- [Electron和Vite结合的一些思考](https://blog.csdn.net/2301_79959413/article/details/134029388)
- [lx-music-desktop](https://github.com/lyswhut/lx-music-desktop)
- [Advanced Electron.js architecture](https://blog.logrocket.com/advanced-electron-js-architecture/)
- [Electron](https://juejin.cn/column/7163875758572568612)
- [禹神：一小时快速上手Electron，前端Electron开发教程，笔记。一篇文章入门Electron](https://blog.csdn.net/qq_33650655/article/details/140364298#:~:text=Electron%E6%98%AF%E4%B8%80)
- [一种在 Electron 和 Web 环境下显示原生及自定义菜单的通用方法](https://innei.in/posts/tech/a-universal-method-about-show-electron-native-and-web-custom-menus)
- 
- -->
