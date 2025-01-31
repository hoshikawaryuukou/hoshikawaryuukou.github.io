---
title: "Unity - Package - YooAsset"
date: 2025-01-22 21:11:00
draft: false

tags: ["Unity"]
---

## Quick Chat
Addressables 是在 AssetBundle 的基礎上對操作進行更友善的封裝，AssetBundle 有很多要小心的地方
- [AssetBundle 卸載](https://juejin.cn/post/7066814466167422989)

Addressable System 主要改善幾點
- 透過 name/label，而是不與資源直接連結，減少因移動或重命名資產而出錯的機會。
- 本地或是異地都可以追踪。
- 簡化打包和依賴管理(name/label/group/catalog)。
- 較好的記憶體管理機制(引用計數)與性能分析系統。

## Guide
- [tuyoogame/YooAsset](https://github.com/tuyoogame/YooAsset)

### AssetBundle
- [Assets, Resources and AssetBundles](https://learn.unity.com/tutorial/assets-resources-and-assetbundles#)
- [Case Studies of Unity AssetBundle Efficient Encryption](https://blog.en.uwa4d.com/2022/02/26/case-studies-of-unity-assetbundle-efficient-encryption/)

### Addressable Frameworks
不同 Framework 在常規操作上大同小異，可以從資源最多的 Addressables 做觀念入門
- [Unity Addressables资源管理方式用起来太爽了，资源打包、加载、热更变得如此轻松（Addressable Asset System | 简称AA）](https://blog.csdn.net/linxinfa/article/details/122390621)
- [Unity - Addressables项目总结（一）：基础工作流](https://zhuanlan.zhihu.com/p/588120058)
- [Unity - Addressables项目总结（二）：业务需求](https://zhuanlan.zhihu.com/p/592124758)
- [静态包、动态包有什么区别？何时使用增量更新？Addressables 更新流程大梳理](https://www.bilibili.com/read/cv11642315/)

## Issue
- [Shaders are pink when loaded from an AssetBundle](https://support.unity.com/hc/en-us/articles/208380753-Shaders-are-pink-when-loaded-from-an-AssetBundle)
  - 大部分時候是 Editor 的問題，關注真機運作如何即可(因為 AssetBundle 是根據指定平台生成的)。
  - ⚠️ Unity 6 之後似乎無法透過取消 Auto Graphics API 來調整 Graphics API

## Extra
- [为什么抛弃了 Addressable](https://www.liuocean.com/archives/wei-shi-me-pao-qi-liao-addressable)
