---
title: "Unity - Addressable"
date: 2023-03-01 21:11:00
draft: true

tags: ["Unity"]
---

## 簡述
Addressables是一種在運行時輕鬆處理內容創建和動態加載/卸載資產的方法


Asset Bundle

更快的迭代工作 流程：擁有一個不變的地址意味著您不必在代碼中硬編碼資產的路徑。您還可以根據需要自由構建項目。這會減少因移動或重命名資產而出錯的機會。此外，系統將自動負責打包您的資產包。
簡化的內容打包和依賴管理：系統將根據您將尋址資產組織成組的方式構建目錄和資產包。該目錄了解所有資產包之間的相互依賴關係。這可確保在為您返回請求之前正確加載資產所需的所有內容。
更好的內存管理：系統將智能地協調加載/卸載哪些資源。它還帶有強大的分析器，可幫助識別遊戲中內存分配的潛在問題。


## 基本操作
- [Unity Addressables资源管理方式用起来太爽了，资源打包、加载、热更变得如此轻松（Addressable Asset System | 简称AA）](https://blog.csdn.net/linxinfa/article/details/122390621)
- [Unity - Addressables项目总结（一）：基础工作流](https://zhuanlan.zhihu.com/p/588120058)
- [Unity - Addressables项目总结（二）：业务需求](https://zhuanlan.zhihu.com/p/592124758)
- [Wenrong274/Unity-Addressable](https://github.com/Wenrong274/Unity-Addressable)




- [Unity Addressable Download Assets](https://wenrongdev.com/posts/unity-addressable_download_assets/)
- [Addressable 熱更新補充說明](https://hackmd.io/@kcy0314/HJn5zOT-q)

## HotUpdate 
- [Unity Addressable 幫技能做素材熱更新](https://www.youtube.com/watch?v=bCObS3teFGM)
- [自建 NodeJS 伺服器來做遠端熱更新 Unity Addressable](https://www.youtube.com/watch?v=dfSws1QQmKo)

## Build
- [Addressable之内容构建](https://zhuanlan.zhihu.com/p/500535555)

## Remote
- 可使用 HFS(Http File Server) 做本地端測試

## 跨平台打包

## 預下載
提前檢測更新並下載（預下載）
有時候我們希望啟動後執行更新檢測並下載所有資源後再進入遊戲，可以使用CheckForCatalogUpdates -> UpdateCatalogs -> GetDownloadSizeAsync -> DownloadDependenciesAsync這個工作流。
這個過程中可能有強退、斷網等異常，我們可以判斷AsyncOperationHandle的Status狀態碼然後進行處理，並提示重試。

## Extra
- [为什么抛弃了 Addressable](http://www.liuocean.com/2022/06/24/wei-shen-me-pao-qi-le-addressable/)
