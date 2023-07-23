---
title: "Git - Rebase"
date: 2023-07-16 20:11:00
draft: false

tags: ["Git"]
---

> 之前筆者一直以為 rebase 是進行類似 **剪下貼上** 的操作，但實際上是 **複製貼上** 

## 情境
- 合併時不會像merge 時會有 commit 的節點
- 想整理 **還沒推出去** 的 commit 可以使用
- **避免修改已經推出去的歷史**

### 如何取消操作

使用 reflog 列印出所有「歷史紀錄」找到 rebase 的前一個 hash，並進行 reset 即可
```
git reflog
git reset XXXXXXX --hard
```

此外當進行比較危險操作時 git 會額外紀錄前一個 head 於 ORIG_HEAD，因此也可以直接執行以下，來達到同樣效果
```
git reset ORIG_HEAD --hard
```

## Ref
- [另一種合併方式（使用 rebase）](https://www.youtube.com/watch?v=HeF7dwVyzow)