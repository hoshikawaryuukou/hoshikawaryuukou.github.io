---
draft: false
title: Workflow – Mirroring Obsidian Notes to Hugo
date: 2025-08-13T20:31:00+08:00
tags:
  - Workflow
  - Obsidian
  - Hugo
---

## Quick Chat

使用 `robocopy` 以鏡像方式，將 `obsidian-notes` 中的 `posts` 與 `images` 資料夾，同步到 Hugo 專案的對應目錄。

## Operation

1. **詢問使用者**是否要執行同步任務。
2. **設定並驗證路徑**，確保來源與目標皆存在。
3. **執行 `robocopy` 鏡像同步**，將來源內容完整覆蓋至 Hugo 專案目標位置。

### mirror.bat

```bash

@echo off
setlocal

:: Ask if the sync task should be run
echo Do you want to run the sync task? (Y/N):
set /p RUN_SYNC=
if /I not "%RUN_SYNC%"=="Y" (
    echo Sync task cancelled.
    pause
    goto :EOF
)

:: Get the directory of the current script
set "SCRIPT_DIR=%~dp0"

:: Set relative paths
set "SRC_POSTS=%SCRIPT_DIR%..\obsidian-notes\blog\posts"
set "SRC_IMGS=%SCRIPT_DIR%..\obsidian-notes\blog\images"
set "DST_POSTS=%SCRIPT_DIR%content\posts"
set "DST_IMGS=%SCRIPT_DIR%static\images"

:: Check if source paths exist
echo Checking source paths...
if not exist "%SRC_POSTS%" (
    echo ERROR: Source posts directory not found: %SRC_POSTS%
    echo Please confirm that the blog-obsidian project location is correct.
    pause
    goto :EOF
)

if not exist "%SRC_IMGS%" (
    echo ERROR: Source images directory not found: %SRC_IMGS%
    echo Please confirm that the blog-obsidian project location is correct.
    pause
    goto :EOF
)

echo Source path check passed.
echo.
echo Starting synchronization...

:: Run synchronization
echo Syncing posts directory...
robocopy "%SRC_POSTS%" "%DST_POSTS%" /MIR

echo.
echo Syncing images directory...
robocopy "%SRC_IMGS%" "%DST_IMGS%" /MIR

echo.
echo Synchronization complete!
pause

endlocal

```

