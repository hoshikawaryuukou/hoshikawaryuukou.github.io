---
title: "Unity - Environment"
date: 2024-01-16 21:11:00
draft: false

tags: ["Unity", "Mac", "VScode"]
---

> ⚠️ 以下使用 unity 6

## Guide
- [Day10 / Unity 跟上時代！如何設定 Visual Studio Code 編輯器環境 - iT 邦幫忙::一起幫忙解決難題，拯救 IT 人的一天](https://ithelp.ithome.com.tw/articles/10346751)

## VSCode

### Extensions
- [Extension - Unity]() 

### .NET SDK
- 安裝 [.NET Core](https://dotnet.microsoft.com/en-us/download)
  - Mac M 系列 ( M1 M2 ) ➔ .NET SDK Arm64 版本
  - Mac 其餘型號 ➔ .NET SDK x64 版本
  - Windows ➔ .NET SDK x64 版本
- 重新開機使環境變數被應用

### Unity Package Manager
- 移除 Visual Studio Code Editor 已經停止維護 (比較舊的版本可能要裝)
- 安裝 Visual Studio Editor  

### Preferences
- Edit > Preferences > External Tools 
  - External Script Editor > Visual Studio Code
  - Generate .csproj files for
    - Embedded packages
    - Local packages 

## Common

### Preferences
- Edit > Preferences > General > Script Changes While Playing (Stop Playing and Recompile)
