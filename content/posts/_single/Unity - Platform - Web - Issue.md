---
draft: false
title: Unity - Platform - Web - Issue
date: 2025-01-19T16:56:18+08:00
tags:
  - Unity
  - Web
---

## Error

### Error : Failed to parse binary data file Build/xxx.data.br...
> Failed to parse binary data file Build/web.data.br (with "Content-Type: null"), because it is still brotli-compressed. It should have been uncompressed by the browser, but it was unable to do so since the web server provided the compressed content without specifying the HTTP Response Header "Content-Encoding: br" that would have informed the browser that decompression is needed. Please verify your web server hosting configuration to add the missing "Content-Encoding: br" HTTP Response Header.

📝 需要配置 Content-Encoding 參考 [terreng/sws-unity-plugin](https://github.com/terreng/sws-unity-plugin)

### Error : Unable to load file Build/xxx.framework.js.br...
> Unable to load file Build/xxx.framework.js.br! Check that the file exists on the remote server. (also check browser Console and Devtools Network tab to debug)

📝 這是因為 `Brotli` 壓縮算法僅在 `HTTPS` 連接中被啟用


## Optional

### Optional : autoSyncPersistentDataPath
> 修復了 Application.persistentDataPath 持久化的問題

📝 通過於 index.html 添加新的 JS 配置選項 `autoSyncPersistentDataPath： true` 來啟用 Application.persistentDataPath 到 IndexedDB 的自動同步。

<!-- ## Others
- [My WebGL assets](https://forum.unity.com/threads/my-webgl-assets.994741/)
- [kou-yeung/WebGLInput](https://github.com/kou-yeung/WebGLInput)
- -->

