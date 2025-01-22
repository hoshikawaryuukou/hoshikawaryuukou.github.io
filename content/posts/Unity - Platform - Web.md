---
title: "Unity - Platform - Web"
date: 2025-01-19 21:11:00
draft: false

tags: ["Unity", "Web"]
---

## Quick Chat
- ⚠️ 使用 **Unity 6** 開發

## Guide 
- [Unity - Manual: Web](https://docs.unity3d.com/6000.0/Documentation/Manual/webgl.html)
- [Getting started with Unity Web](https://learn.unity.com/tutorial/getting-started-with-unity-web)
- [【Unity】WebGL開発時の注意事項](https://qiita.com/kazuki_kuriyama/items/3155606bb6cb5861ce68)
- [Unity发布webgl获取浏览器的URL](https://blog.csdn.net/GoodCooking/article/details/136307133)
- [Unity WebGLビルドメモ - フレームシンセシス](https://tech.framesynthesis.co.jp/unity/webgl/)
- [Unity 製 WebGL ゲームを AWS でお手軽公開](https://zenn.dev/happy_elements/articles/hekk_ac_20231215)

## Template
- [(Unity) Better Minimal WebGL Template](https://seansleblanc.itch.io/better-minimal-webgl-template)

## Performance
- [Using the Unity Profiler](https://learn.unity.com/tutorial/getting-started-with-unity-web#670ea950edbc2a2240868db0)
- [Using the web platform Diagnostics Overlay tool](https://learn.unity.com/tutorial/getting-started-with-unity-web#670ea9d0edbc2a2240868dc1)
- [Unity WebGL Loading Test](https://github.com/JohannesDeml/UnityWebGL-LoadingTest?tab=readme-ov-file)

## Host
- [terreng/simple-web-server](https://github.com/terreng/simple-web-server)
- [terreng/sws-unity-plugin](https://github.com/terreng/sws-unity-plugin)

## Host - Issue
> Unable to load file Build/xxx.framework.js.br! Check that the file exists on the remote server. (also check browser Console and Devtools Network tab to debug)

這是因為 `Brotli` 壓縮算法僅在 `HTTPS` 連接中被啟用

## Build - Structure
### 1. index.html
- 這是遊戲的主要 HTML 頁面，通常包含 HTML 代碼來載入其他資源並初始化遊戲的運行。

### 2. Build
- **`xxx.data.gz`**: 儲存遊戲資源、場景和其他數據。
- **`xxx.framework.js.gz`**: JavaScript Runtime。
- **`xxx.loader.js`**: 負責載入遊戲的 JavaScript 代碼。
- **`xxx.wasm.gz`**: 包含 WebAssembly 二進位檔，這是 Unity 遊戲引擎及其相關包和腳本的編譯結果。

### 3. TemplateData
- 這些是 HTML 模板和樣式表中使用的資源，包含圖標和樣式文件。

## Practices
- 資源使用 Assetbundle / Addressables 分包
- 資源限制下載數 ( 10個以內 )
- 資源緩存
- 啟動封面範本修改
- 閒置時段下載資源
- wasm 分包 (方案尋找中)

## Extra
- [Unity WebGL 微信小游戏适配方案(公测)](https://github.com/wechat-miniprogram/minigame-unity-webgl-transform)

<!-- ## Others
- [My WebGL assets](https://forum.unity.com/threads/my-webgl-assets.994741/)
- [Unity WebGL で WebSocket を使う](https://zenn.dev/yoshd/articles/00aa57079e4063) 
- 
- -->