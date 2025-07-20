---
title: "Software Design - Flow Control - Note"
date: 2025-07-19 08:05:00
draft: true

tags: ["Software Design"]
---

## Quick Chat
程式碼的流程控制是一個核心概念。當邏輯變得複雜，特別是牽涉到「重試 (Retry)」機制時，程式碼的閱讀性和維護性往往會面臨挑戰。

本文將介紹兩種在 JavaScript 中處理這類跳躍式流程控制的實作模式：嵌套迴圈 + 標籤 (Labels) 和 狀態機 (State Machine)。

## Examples

### 流程結構
```
point 1:
  operation 1-1
  operation 1-2（失敗達 retry 次數 -> 回到 point 1）

point 2:
  operation 2-1（失敗達 retry 次數 -> 回到 point 2）
    operation 2-1-1（失敗達 retry 次數 -> 回到 point 1）
```