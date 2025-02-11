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

## Issue

### Error : Failed to parse binary data file Build/xxx.data.br...
> Failed to parse binary data file Build/web.data.br (with "Content-Type: null"), because it is still brotli-compressed. It should have been uncompressed by the browser, but it was unable to do so since the web server provided the compressed content without specifying the HTTP Response Header "Content-Encoding: br" that would have informed the browser that decompression is needed. Please verify your web server hosting configuration to add the missing "Content-Encoding: br" HTTP Response Header.

📝 需要配置 Content-Encoding 參考 [terreng/sws-unity-plugin](https://github.com/terreng/sws-unity-plugin)

### Error : Unable to load file Build/xxx.framework.js.br...
> Unable to load file Build/xxx.framework.js.br! Check that the file exists on the remote server. (also check browser Console and Devtools Network tab to debug)

📝 這是因為 `Brotli` 壓縮算法僅在 `HTTPS` 連接中被啟用



