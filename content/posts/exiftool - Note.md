---
title: "exiftool - Note"
date: 2024-10-27 21:13:00
draft: false

tags: ["exiftool"]
---

## Case - source 覆蓋 target
```bash
exiftool -overwrite_original -all= target.png
exiftool -tagsFromFile source.png -all:all target.png
```
