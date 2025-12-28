---
draft: false
title: Software Design - Code Smell - Side Effect
date: 2025-07-18T16:56:18+08:00
tags:
  - Software_Design
  - Code_Smell
---

## Quick Chat

副作用（Side Effect）指的是一段程式在執行後，**除了回傳值之外還影響了外部狀態**。

在錯誤的位置或缺乏揭露的情況下使用副作用，會造成：
- 函式不可預測
- 測試困難
- 程式閱讀成本上升
- Bug 躲藏不易察覺

## Bad Examples

```js
function getUserName(user) {
  saveLog(user);           // 副作用：寫入外部 log
  notifyOthers(user.name); // 副作用：發送通知
  return user.name;
}
```

## Extras

很多時候副作用可能是無法規避的，因此重點不在「禁止副作用」，而是「把副作用設計得可控、可觀測、可預期」。

較健康的副作用處理策略：
- 明確命名：像 updateState, notifyUser, logError
- 設計邊界：像 useEffect、controller 層 專職處理副作用