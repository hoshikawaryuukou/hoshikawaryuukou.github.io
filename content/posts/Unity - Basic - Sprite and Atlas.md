---
title: "Unity - Basic - Sprite and Atlas"
date: 2025-03-18 21:11:00
draft: false

tags: ["Unity"]
---

## Sprite
- [【2Dゲームで必須】UnityのSprite（スプライト）の単位をわかりやすく解説](https://shibuya24.info/entry/unity-unit)
- [【間違えやすい】Unityの正しい画像サイズとは](https://shibuya24.info/entry/unity-ui-texture-size)

## SpriteAtlas
- [【Unity】SpriteをパックするSpriteAtlasの使い方](https://shibuya24.info/entry/unity-spriteatlas)
<!-- - [【Unity游戏开发】SpriteAtlas与AssetBundle最佳食用方案](https://cloud.tencent.com/developer/article/1765934)
- [Sprite Atlas with late binding and Asset Bundles](https://support.unity.com/hc/en-us/articles/360000665546-Sprite-Atlas-with-late-binding-and-Asset-Bundles)
- [構建 Sprite 圖集 |Addressables 可尋址 |2.3.16](https://docs.unity3d.com/Packages/com.unity.addressables@2.3/manual/AddressablesAndSpriteAtlases.html) 
- https://github.com/dre0dru/AssetManagement/blob/efe2a19c0267e0a7ab98e5d34b439188fb099ff0/Runtime/AddressableAssets/SpriteAtlases/SpriteAtlasesProvider.cs#L24
- https://github.com/It-Life/Deer_GameFramework_Wolong/blob/764f6feb72f4ba5653d90f434aa565d2bfb2725c/Assets/Deer/Scripts/Hotfix/HotfixAGameExample/GameLogic/OrbitCamera.cs#L77
- https://github.com/dre0dru/AssetManagement/tree/efe2a19c0267e0a7ab98e5d34b439188fb099ff0
- 
- -->
- 減少DrawCall
- 圖集將圖片打包為2的冪次方的素材大小，可以提升性能
- 減小包體大小
- 使用 AssetBundle 來打包時，**不要勾選** Include In Build
