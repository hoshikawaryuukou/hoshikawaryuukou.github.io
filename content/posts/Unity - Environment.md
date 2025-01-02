---
title: "Unity - Environment"
date: 2024-01-16 21:11:00
draft: false

tags: ["Unity", "Mac", "VScode"]
---

## VSCode
1. 移除 Visual Studio Code Editor 已經停止維護
2. 安裝 Visual Studio Editor  
3. Edit > Preferences > External Tools > External Script Editor
4. 安裝 [.NET Core](https://dotnet.microsoft.com/en-us/download)
5. Extension - C# Dev Kit





## Mac (M2)

1. 安裝 dotnet sdk，須注意是否適用 ARM | [ref](https://dotnet.microsoft.com/en-us/download) 
2. 安裝 Mono | [ref](https://www.mono-project.com/download/stable/)
3. 安装 xcode
4. 更新 Homebrew
5. 更新 Ruby 至 3.x 並配置環境變數 (系統預設是 2.x) | [ref 僅參考 ruby 更新部分](https://blog.csdn.net/mydo/article/details/126918391)
6. 更新 gem
7. 移除 CocoaPods | [ref](https://blog.csdn.net/feelinghappy/article/details/111478615)
8. 安裝 CocoaPods

- ⚠️ 目前會有 VSCode 未完全關閉又重啟而導致 dotnet sdk 配置失效的狀況