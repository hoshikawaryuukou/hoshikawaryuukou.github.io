---
draft: false
title: OS - Windows - Tools
date: 2025-08-10T09:56:18
tags:
  - OS
  - Windows
  - Tools
---

## robocopy

- 全名是 **Robust File Copy**。
- 是 Windows 作業系統內建的**命令列檔案複製工具**。
- 支援多執行緒、差異複製、恢復中斷等功能。

```
robocopy source destination /MIR
```
1. `source` : 來源資料夾路徑
2. `destination` : 目標資料夾路徑
3. `/MIR` : 鏡像同步
	- 新增來源有但目標沒有的檔案
	- 覆蓋來源較新的檔案
	- **刪除**目標有但來源已刪除的檔案（⚠️注意不可逆）
