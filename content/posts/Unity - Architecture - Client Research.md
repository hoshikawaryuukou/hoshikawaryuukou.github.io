---
draft: false
title: Unity - Architecture - Client Research
date: 2025-10-05T22:16:53+08:00
tags:
  - Unity
  - Architecture
---

## Quick Chat

在設計一個**真正符合自身需求**的架構過程中，我查閱了許多開發者與企業的設計分享。
不同規模、不同組織背景下，策略與取捨自然各不相同。

這些實作未必人人適用，但往往能從中擷取值得借鑑的部分。
許多案例都是針對 Unity 實務場景所 **特化（Customized）** 過的 Clean Architecture，例如省略部分介面或簡化層級結構。

這樣的做法完全合理——**能貼近實際生產需求的架構，才是真正的好設計。**

以下整理幾篇值得參考的文章，並附上簡要導讀。

## Guide

-  [Unityを利用した大規模なゲーム開発にクリーンアーキテクチャを採用した話](https://developers.wonderpla.net/entry/2021/02/18/121932)
	- 手遊系專案
	- 較為標準的 Clean Architecture 實作

- [Unityを利用したスマホゲーム開発のアプリ内課金システムに単体テストを導入した話｜G2 Studios株式会社](https://note.g2-studios.net/n/nada00da3dcd1)
	- 手遊系專案
	- 精簡化版本的 Clean Architecture 實作

- [バーチャルキャストの舞台裏 : メタバースの長期運用を実現する技術と戦略 | ドクセル](https://www.docswell.com/s/torisoup/5YWX2E-xrkaigi2023#p79)
	- 特化過的 Clean Architecture 實作

- [Unityと協調するためのアーキテクチャ『MVP4U』 - yotiky Tech Blog](https://yotiky.hatenablog.com/entry/2018/11/16/Unity%E3%81%A8%E5%8D%94%E8%AA%BF%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AE%E3%82%A2%E3%83%BC%E3%82%AD%E3%83%86%E3%82%AF%E3%83%81%E3%83%A3%E3%80%8EMVP4U%E3%80%8F)
	- 採用 MVP + Orchestrator 的子模組串接架構

- [clusterのUnity UI周りの開発紹介 #Cluster - Qiita](https://qiita.com/sansuke05/items/c353f287dfc9b19d3a14)
	- 採用 MVP + 單向依賴的輕量化設計

- [「本日クラスターに入社したUnity Engineerが読む記事」の紹介 - Cluster Tech Blog](https://tech-blog.cluster.mu/entry/2022/09/22/215019)
	- Clean Architecture 實作
	- 表現層最初使用 MVP，後續因內製 UI Framework 的開發逐步轉向 MVVM
	- 延伸閱讀：[内製のUnity UI Frameworkの開発から導入・運用 - Cluster Tech Blog](https://tech-blog.cluster.mu/entry/2024/10/18)

- [ENDROLL の Unity アーキテクチャとかの話 | 株式会社ENDROLL](https://sg.wantedly.com/companies/endroll/post_articles/883646)
	- 特化過的 Clean Architecture 實作

- [弊社Unityアーキテクチャの凄いところを語る](https://zenn.dev/ambr_inc/articles/3af2acbb2b7536)
	- 採用垂直與水平分層、單向依賴的設計

- [GitHub - jinhosung96/Unity-VContainer-UniRx-MVP-Example](https://github.com/jinhosung96/Unity-VContainer-UniRx-MVP-Example/tree/main?tab=readme-ov-file#%EC%A0%A4%EB%A6%AC-%EA%B5%AC%EB%A7%A4-%EB%B0%8F-%ED%95%B4%EA%B8%88-ui)
	- 使用主流 Packages 構建小型遊戲
	- 對 MVP 與 DI（多 Scope）的應用理解相當深入

- [Learning Architecture, MessagePipe, and VContainer by Creating a Game Requested by My Own Daughter | Kadinche Engineering](https://medium.com/kadinche-engineering/learning-architecture-messagepipe-and-vcontainer-by-creating-a-game-requested-by-my-own-daughter-8ee8303a718)
	- 使用主流 Packages 構建小型遊戲
	- 對 MVP 與 DI（單 Scope）的應用理解到位
	- 較為標準的 Clean Architecture 實作

- [Unity でのゲーム開発: アーキテクチャを組織するアプローチの検討 | HackerNoon](https://hackernoon.com/lang/ja/Unity-%E3%81%A7%E3%82%B2%E3%83%BC%E3%83%A0%E3%82%92%E9%96%8B%E7%99%BA%E3%81%97%E3%80%81%E3%82%A2%E3%83%BC%E3%82%AD%E3%83%86%E3%82%AF%E3%83%81%E3%83%A3%E3%82%92%E7%B5%84%E7%B9%94%E3%81%99%E3%82%8B%E3%82%A2%E3%83%97%E3%83%AD%E3%83%BC%E3%83%81%E3%82%92%E6%A4%9C%E8%A8%8E%E3%81%99%E3%82%8B)
	- 經典的 Unity 架構演進案例
	- 從單例模式逐步過渡到 DI，再到複合式 MVP

- [Unity製アプリを作る時のアーキテクチャをどこまで区切るか、あるいはレイヤードアーキテクチャの一指針](https://zenn.dev/izm/articles/2478583453b235)
	- 討論 Unity 架構設計的分層考量與實務界線


















