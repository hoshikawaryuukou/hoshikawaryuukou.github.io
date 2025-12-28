---
draft: false
title: OS - Window - PowerShell
date: 2025-08-28T16:24:30+08:00
tags: 
  - OS
  - Windows
  - PowerShell
---

## Issues

### 中文顯示問題

1. 在腳本第一行再加上這行
	```
	[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
	```
2. 把 `.ps1` 檔案存成 **UTF-8 with BOM**。