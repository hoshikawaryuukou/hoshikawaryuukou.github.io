---
draft: false
title: Unity - Coding - Managed code stripping
date: 2024-03-26T10:00:00+08:00
tags:
  - Unity
---

## Quick Chat

在構建過程中，Unity 通過稱為託管代碼剝離的過程刪除未使用或無法訪問的代碼，這可以顯著減小應用程式的最終大小。

> File -> Build Settings -> Player Settings -> Optimization -> Managed Stripping Level

- ⚠️ Managed Stripping Level 等級越高裁剪掉的代碼越多，包體也就越小，但是對應的風險也就更大。
- 藉由屬性或特殊 XML 配置檔的形式提供註釋，以指示 Unity 連結器要保留代碼庫的哪些部分。

## Guide

- [Unity - Manual: Managed code stripping](https://docs.unity3d.com/6000.0/Documentation/Manual/managed-code-stripping.html)
- [KuraiAndras/LinkerGenerator](https://github.com/KuraiAndras/LinkerGenerator)
- [IUnityLinkerProcessorでCodeStrippingからコードを守る](https://zenn.dev/hatopopo_0113/articles/279d3b89c791d1)

## Preserving

### Preserve attribute

- ⚠️ [Preserve] 屬性屬於“侵入式”的解決方案，不建議

```cs
class Foo
{
    [Preserve]
    public void PreservedMethod(){}
}
```

### link.xml

- 在專案的 Assets 目錄下創建個 link.xml

```xml
<linker>
    <assembly fullname="DOTween" preserve="all" />               
    <assembly fullname="Newtonsoft.Json" preserve="all" />  
    <assembly fullname="Assembly-CSharp" preserve="all" /> 
    <assembly fullname="UnityEngine">
        <type fullname="UnityEngine.SpriteRenderer" preserve="all"/>
        <type fullname="UnityEngine.Rigidbody2D" preserve="all"/>
    </assembly>
</linker>
```

