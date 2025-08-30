---
draft: false
title: Unity - Coding - Warnings
date: 2025-03-25T16:56:18+08:00
tags:
  - Unity
---

## UNT0023 Coalescing assignment on Unity objects

合併賦值運算子 `??=` 是 C# 8.0 引入的運算子，其功能是：如果左側運算元為 null，則將右側運算元的值賦給左側運算元。

然而，在 Unity 中直接對 Unity 物件 (如 GameObject、Component 等) 使用這個運算子可能會導致問題，因為：

1. **Unity 物件的特殊生命週期**：Unity 物件即使被銷毀，在 C# 層面的變數可能不會自動設為 null，而是成為"偽 null"物件。

2. **自訂的 null 檢查行為**：Unity 覆寫了 `==` 運算子，使得對已銷毀的 Unity 物件進行 null 檢查時會返回 true，但 `?? 運算子使用的是底層的 null 檢查機制。

### 使用明確的 null 檢查

```cs
private Rigidbody rb;

void Start()
{
    if (rb == null)
    {
        rb = GetComponent<Rigidbody>();
    }
} 
```
