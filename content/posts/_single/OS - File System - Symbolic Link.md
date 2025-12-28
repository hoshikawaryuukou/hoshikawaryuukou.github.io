---
draft: false
title: OS - File System - Symbolic Link
date: 2024-07-10T09:56:18+08:00
tags:
  - OS
  - Windows
---

## Quick Chat

> 符號連結本身只是一個檔案，但它的內容指向另一個檔案或資料夾的路徑。當你存取這個符號連結時，作業系統會自動將你導向到它所指向的目標。

⚠️ 符號連結它只是一個指標，不包含實際的檔案內容。如果你刪除原始檔案，符號連結就會失效。

## Windows 

⚠️ Windows 建立符號連結需要 **管理員權限**

1. 使用 **cmd**（需管理員權限）：[mklink](https://learn.microsoft.com/zh-tw/windows-server/administration/windows-commands/mklink)
 2. 使用 **PowerShell**（需管理員權限）：[Create a symbolic link to a file or folder](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item?view=powershell-7.5#example-7-create-a-symbolic-link-to-a-file-or-folder)





