---
draft: false
title: Unity - Package Manager
date: 2025-03-19T12:46:15+08:00
tags:
  - Unity
  - Package_Manager
---

## Quick Chat

> Unity Package Manager (UPM) 的設計理念，是向現代軟體開發的 「套件管理系統」
  看齊，最主要的借鏡對象就是網頁開發領域的 NPM (Node Package Manager)。

- **模組化**：不同功能（像是 2D 工具、Timeline、Addressables）都能獨立存在，更新或安裝時不會牽動整個專案。
- **可控版本**：可以指定版本，就像你在 npm 裡選擇某個 library 的版本，確保團隊成員與 CI 環境一致。
- **遠端來源**：除了 Unity 官方 registry，也可以掛上私有 registry，甚至用 Git URL 或本地資料夾引入。

幾個重要觀念：
1. 所有透過 UPM 安裝的套件都會被存放在 `Packages` 資料夾。
2. `Packages` 是唯讀的，不過仍有方式能夠修改。
3.  UPM 的主要使用情境是管理可重用的「功能模組」，這些通常以程式碼為核心。而遊戲專案中獨特的、需頻繁修改的藝術素材 （如模型、貼圖、音效），其歸宿依然是傳統的 `Assets` 資料夾。
  
## Guide

- [开发Unity PackageManager 插件包](https://www.jianshu.com/p/153841d65846)
- [Creating Custom Packages for Unity 2018.3](https://neogeek.dev/creating-custom-packages-for-unity-2018.3/)
- [How to remodel your project for asmdef and UPM](https://gametorrahod.com/how-to-asmdef-upm/?fbclid=IwAR31P12StjzcTi9IO1vDvwWJIwaKHxIEmUQLic6K1LGElmwv6OFRqe8sVig)
- [【Unity】Package Manager活用術](https://annulusgames-lab.blogspot.com/2023/01/unity-package-manager.html)
- [使用OpenUPM发布自己的Unity项目](https://zhuanlan.zhihu.com/p/146565975)

## Installing Packages using UPM

1. Package manager ->  Advanced project settings
2. Add Scoped Registries

```
Name: package.openupm.com
URL: https://package.openupm.com
Scope(s): 
         com.cysharp.unitask
```
3. Package manager -> Packages: My Registries -> Install

## Package Template

- [GitHub - IvanMurzak/Unity-Package-Template: Template Unity Package for OpenUPM and NPMJS. Supports UPM (Unity Package Manager) with versioning.](https://github.com/IvanMurzak/Unity-Package-Template)