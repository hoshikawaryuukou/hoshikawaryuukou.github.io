---
title: "Unity - Package - Spine SDK"
date: 2025-05-13 22:11:00
draft: false

tags: ["Unity"]
---

## Guide
- [spine-unity 下载](https://zh.esotericsoftware.com/spine-unity-download#spine-unity)
- [spine-unity 运行时文档](https://zh.esotericsoftware.com/spine-unity)
- [spine-unity 资产](https://zh.esotericsoftware.com/spine-unity-assets)
- [spine-unity 常见问题(FAQ)](https://zh.esotericsoftware.com/spine-unity-faq)

## Notices

### Version
- Spine 3.8 並未提供 github url，需用 .unitypackage / 自行準備 git url
- 運行時只能載入與 Spine 編輯器版本一致的二進位匯出檔案(新舊版本應執行重導出)

### Asset
- unity 無法載入部分副檔名需修改
  - .skel -> .skel.bytes
  - .atlas -> .atlas.txt
- json 匯出檔案更穩定，有更大可能與未來版本相容

### Performance
- Unity 在多 material /多子網格、排序和動態合批(batching)方面有個老毛病，如果使用多 materials 的 skeleton 有多個副本，Unity 的動態合批系統會嘗試將相似的 materials 合批， 但它在有多個相似 materials 的子網格的合批過程，Objectske 中加入一個 Sorting Group 元件。
- 不過若你的 skeleton 只使用一種 texture 和 material，Unity 原生的合批系統性能仍是更好的。
