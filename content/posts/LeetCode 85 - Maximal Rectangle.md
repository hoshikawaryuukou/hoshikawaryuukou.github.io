---
draft: false
title: LeetCode 85 - Maximal Rectangle
date: 2025-03-13T15:03:00+08:00
tags:
  - LeetCode
  - Algorithm
---

## Description

- [85. 最大矩形](https://leetcode.cn/problems/maximal-rectangle/description/)

## Sample

### input

```
matrix = [
    [1,0,1,0,0],
    [1,0,1,1,1],
    [1,1,1,1,1],
    [1,0,0,1,0]
]
```

### output

```
6
```

## Key points

## Solution 1 - 暴力解

- 檢查矩陣中所有可能的矩形，並計算每個矩形是否符合條件。
- 對每個可能的矩形進行迴圈遍歷。
- 計算該矩形內的元素是否符合條件。

### 複雜度

- m 為 row 的長度 ，n 是 column 的長度 
- 時間複雜度：O(m^2 x n^2)
- 空間複雜度：O(m x n) 

## Solution 2 - 單調棧

- 將原矩陣根據各 row 提取出數個高度(連續的1)陣列。
- 便可將問題拆解成數個 84 題。

### 推導

| Step | Matrix Row  | heights[]       | result by No.84 |
| ---- | ----------- | --------------- | --------------- |
| 1    | [1,0,1,0,0] | [1, 0, 1, 0, 0] | 1               |
| 2    | [1,0,1,1,1] | [2, 0, 2, 1, 1] | 2               |
| 3    | [1,1,1,1,1] | [3, 1, 3, 2, 2] | 6               |
| 4    | [1,0,0,1,0] | [4, 0, 0, 3, 0] | 4               |

![Leetcode85](/images/blog/Leetcode85.png)

**最大矩形面積 = `6`**

### 複雜度

- m 為 row 的長度，n 是 column 的長度 
- 時間複雜度：O(m x n)
- 空間複雜度：O(m) 