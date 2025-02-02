---
title: "Tools - ExifTool - Note"
date: 2024-10-27 21:13:00
draft: false

tags: ["Tools"]
---

## Quick Chat
ExifTool 用來讀取、寫入、編輯各種檔案的 元數據（Metadata），特別是 照片、影片、音訊、PDF 等格式。

## Memo

### source 覆蓋 target
```bash
exiftool -overwrite_original -all= target.png
exiftool -tagsFromFile source.png -all:all target.png
```
