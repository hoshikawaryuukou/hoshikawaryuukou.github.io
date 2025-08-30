---
draft: false
title: Workflow – Host Unity Web Game on GitHub Pages
date: 2025-08-18T20:38:51+08:00
tags:
  - Workflow
  - Unity
  - Github
---

## Quick Chat

- ⚠️需要在 Unity 中開啟 **Decompression Fallback** 功能（GitHub Pages 不支援壓縮）。
- ⚠️ **公開的 Repository (Public Repository)** 才能免費使用 GitHub Pages。

以下提供兩種簡單方案（暫不涉及 CI 自動化）：

## 方法一：獨立 Public Repository

1. 建立一個新的 **Public Repository**。
2. 將 Unity WebGL 的建置輸出檔案上傳至該 Repository。
3. 在 GitHub 設定中，選擇包含 `index.html` 的目錄，即可完成部署。

## 方法二：孤兒分支 (Orphan Branch)

1. 建立並切換到孤兒分支（例如 `gh-pages`）。
2. 將 Unity WebGL 的建置輸出檔案推送到該分支。
3. 在 GitHub 設定中，選擇包含 `index.html` 的目錄，即可完成部署。

🤖 以下使用 gemini 生成

### 腳本生成 - AI Prompt

目錄結構

```bash
project-root/              
├── .git
├── Builds/Web/
└── PowerShellCommands/gh-page-command.ps1 
```

我想實作 gh-page-command.ps1 
目標是將指定目錄 (Builds/Web/) 內容推送至 git 的 orphan branch (gh-pages) 上

### 腳本流程

1. 檢查並建立分支：如果 gh-pages 分支不存在，會自動建立一個新的 orphan branch。
2. 建立 Worktree：建立一個連結到 gh-pages 分支的暫時工作目錄 (gh-pages-worktree)。
3. 同步檔案：將 Builds/Web 的內容複製到 worktree 中。
4. Commit & Push：在 worktree 中提交並強制推送到 gh-pages 分支。
5. 清理：最後移除 worktree，保持您的主要工作目錄乾淨。

### gh-page-command.ps1

``` bash

# Deploys the content of a directory to a Git branch using git worktree.
# Usage: ./gh-page-command.ps1 -SourceDir <path-to-dir> -Branch <branch-name>

param (
    [string]$SourceDir = "Builds/Web",
    [string]$Branch = "gh-pages",
    [string]$WorktreeDir = "gh-pages-worktree"
)

$ErrorActionPreference = 'Stop'

# 1. Resolve paths
$scriptPath = $MyInvocation.MyCommand.Path
$projectRoot = (Resolve-Path (Join-Path (Get-Item $scriptPath).Directory.FullName "..")).Path
$fullSourcePath = Join-Path $projectRoot $SourceDir
$fullWorktreePath = Join-Path $projectRoot $WorktreeDir

if (-not (Test-Path $fullSourcePath)) {
    Write-Error "Source directory not found at '$fullSourcePath'"
    exit 1
}

# 2. Cleanup previous worktree if it exists
if (Test-Path $fullWorktreePath) {
    Write-Host "Removing existing worktree directory..."
    # Use Remove-Item with -Recurse and -Force for robustness
    Remove-Item $fullWorktreePath -Recurse -Force
}
# Prune any lingering worktree info from .git
git worktree prune

# 3. Check if the target branch exists and create it if not
$branchExists = git branch --list --all | ForEach-Object { $_.Trim() } | Where-Object { $_ -eq $Branch -or $_ -eq "remotes/origin/$Branch" }
if (-not $branchExists) {
    Write-Host "Branch '$Branch' not found. Creating it as an orphan branch..."
    # Create an orphan branch without checking it out
    git switch --orphan $Branch
    git rm -rf .
    git commit --allow-empty -m "Initial commit for $Branch branch"
    # Go back to the previous branch
    git switch -
    Write-Host "Orphan branch '$Branch' created."
}

# 4. Add the worktree
Write-Host "Creating worktree at '$WorktreeDir' for branch '$Branch'..."
git worktree add $fullWorktreePath $Branch

try {
    # 5. Copy files to the worktree
    Write-Host "Cleaning worktree directory..."
    Get-ChildItem -Path $fullWorktreePath -Force | Where-Object { $_.Name -ne '.git' } | Remove-Item -Recurse -Force

    Write-Host "Copying build artifacts to worktree..."
    Copy-Item -Path (Join-Path $fullSourcePath "*") -Destination $fullWorktreePath -Recurse

    # 6. Commit and push from the worktree
    Write-Host "Committing and pushing from worktree..."
    # Use -C flag to run git commands in the context of the worktree's directory
    git -C $fullWorktreePath add .

    if (git -C $fullWorktreePath status --porcelain) {
        git -C $fullWorktreePath commit -m "Deploy content to $Branch branch"
        git -C $fullWorktreePath push -u origin $Branch --force
        Write-Host "Successfully deployed to $Branch."
    } else {
        Write-Host "No changes to deploy."
    }
}
finally {
    # 7. Cleanup the worktree
    Write-Host "Removing worktree..."
    git worktree remove $fullWorktreePath
    Write-Host "Deployment script finished."
}

```