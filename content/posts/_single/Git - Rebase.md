---
draft: false
title: Git - Rebase
date: 2023-07-16T10:08:39+08:00
tags:
  - Git
---

## Quick Chat

過去常以為 `rebase` 是像「剪下貼上」的操作，但實際上更像是「複製貼上」，它會將一系列的 Commit 複製一份，並重新套用在新的基底上，因此會產生新的 SHA-1 值。

### **主要情境與特性**

- **歷史紀錄更簡潔**：`rebase` 不會像 `merge` 那樣產生額外的合併節點（Merge Commit），讓 Commit 歷史紀錄更為線性、乾淨。
    
- **適用於未推送的 Commit**：當你想要整理、合併或修改本地端「還沒推送到遠端」的 Commit 時，`rebase` 是非常實用的工具。
    
- **避免修改已推送的歷史**：由於 `rebase` 會改寫 Commit 歷史，因此 **絕對不要** 對已經推送到遠端（與他人協作中）的分支進行 `rebase` 操作，以免造成他人的困擾。

## Guide

- [另一種合併方式（使用 rebase）](https://www.youtube.com/watch?v=HeF7dwVyzow)
- [git rebase 用法](https://jessie75919.medium.com/git-rebase-%E7%94%A8%E6%B3%95-3e1ef046e357)

## Extras

### **如何取消 Rebase 操作**

如果你在進行 `rebase` 時後悔了，可以透過以下兩種方式安全地回溯到操作之前的狀態：

- **使用 `git reflog` 尋找歷史紀錄**
    
    1. 輸入 `git reflog`，這會列出你所有的 Git 操作紀錄。
    2. 找到 `rebase` 執行前的 Commit ID。
    3. 輸入 `git reset XXXXXXX --hard` 來回溯（其中 `XXXXXXX` 為該 Commit ID）。
        
- **使用 `ORIG_HEAD` 快速回溯** 由於 Git 在執行 `reset` 等具風險的操作時，會額外將上一個 HEAD 的位置記錄在 `ORIG_HEAD` 中。因此，你也可以直接執行以下指令來快速達到相同的效果：
    
    ```
    git reset ORIG_HEAD --hard
    ```







