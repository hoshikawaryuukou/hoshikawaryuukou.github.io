---
title: "Unity - Official - Addressables"
date: 2023-04-01 21:11:00
draft: true

tags: ["Unity"]
---

## 簡述
Addressables 是在 AssetBundle 的基礎上對操作進行更友善的封裝，AssetBundle有很多要小心的地方像是 :
- [AssetBundle 卸載](https://juejin.cn/post/7066814466167422989)

而 Addressables 主要改善幾點 :
- 透過 name/label，而是不與資源直接連結，減少因移動或重命名資產而出錯的機會。
- 本地或是異地都可以追踪。
- 簡化打包和依賴管理(name/label/group/catalog)。
- 較好的記憶體管理機制(引用計數)與性能分析系統。

## 基本操作
- [Unity Addressables资源管理方式用起来太爽了，资源打包、加载、热更变得如此轻松（Addressable Asset System | 简称AA）](https://blog.csdn.net/linxinfa/article/details/122390621)
- [Unity - Addressables项目总结（一）：基础工作流](https://zhuanlan.zhihu.com/p/588120058)
- [Unity - Addressables项目总结（二）：业务需求](https://zhuanlan.zhihu.com/p/592124758)
- [静态包、动态包有什么区别？何时使用增量更新？Addressables 更新流程大梳理](https://www.bilibili.com/read/cv11642315/)
- [Addressable 熱更新補充說明](https://hackmd.io/@kcy0314/HJn5zOT-q)
- [Addressable之内容构建](https://zhuanlan.zhihu.com/p/500535555)
- [Wenrong274/Unity-Addressable](https://github.com/Wenrong274/Unity-Addressable)
- Remote 可使用 HFS(Http File Server) 做測試

---
## AddressablesEx
補充一些常用功能/工作流，

### Editor
- 開啟 catalog/asset 快取資料夾

### Runtime
- 將一些指令改以 UniTask 封裝
- 清除 asset 快取

---
## Note

### 設置
- AddressableAssetSettings - Disable Catalog Update On Startup : 打勾以自行控制更新時機。
- Group - Build Remote Catalog : 支持網絡更新資源表。
- Group - Use Asset Bundle Cache : 對於 local 資源是無用的。

### 初始化
- Addressables 在執行任一操作之前，如未初始化則會進行初始化。
- 為了不要增加不確定性，一律在開始應用時優先呼叫。

### 啟動
- 

### 預加載
會希望有些資源是在進入應用操作前就先載好的，剩餘部分資源進應用後在實時更新。

目前的做法是，使用 Label(Preload) 標記那些是啟動時須先下載的資源，

- 更新資源目錄  CheckForCatalogUpdates, UpdateCatalogs
- 檢查資源 (有更新 XX MB... 是否要更新) GetDownloadSizeAsync
- 下載資源 (顯示進度) DownloadDependenciesAsync

### 刪除舊包
- 清除快取
清除快取只能清掉 asset，Catalog會保留這會使 Addressables.UpdateCatalogs 不會執行就不會有更新列表
這會導致可以進行應用但預加載的行為就沒有了(變成實時下載)，這可能會有點問題

### 下載斷線
比較麻煩的是 Catalog 更新了但資源載到一半
下次重啟時

### 版本大更
前往商店

### 注意
- UpdateCatalogs : 不提供目錄列表的情況下調用 UpdateCatalog，Addressables 系統會檢查所有當前加載的目錄是否有更新。
- 注意更新資源時要使用Update a Previous Build來生成AB包,如果使用Build重新打包,那也會重新生成catalog文件,而之前發布的應用程序是無法下載新的catalog文件

- 不推薦使用static的Group,因為後續更新需要動到 Group 的結構,管理起來實在太麻煩

### 尚未使用到但應該是需要了解的
- 運行時加載其他目錄 LoadContentCatalogAsync
- Tools: Check for Content Update Restrictions

### Extra
- [为什么抛弃了 Addressable](http://www.liuocean.com/2022/06/24/wei-shen-me-pao-qi-le-addressable/)

