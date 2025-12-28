---
draft: false
title: Git - Reapply .gitignore
date: 2023-07-14T10:00:00+08:00
tags:
  - Git
---

## Quick Chat

當你一開始沒 ignore 到某些檔案，後來補上 .gitignore，卻發現 Git 還是繼續追蹤那些檔案。

## Solution

```bash
# 先清掉 Git 的快取（不會刪檔，只是取消追蹤）
git rm -r --cached .

# 再重新加入所有檔案（讓 .gitignore 這次能正確發揮作用）
git add .

# 然後提交變更
git commit -m "Reapply .gitignore rules"
```