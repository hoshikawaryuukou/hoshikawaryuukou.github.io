---
title: "Javascript_TypeScript - Package - rimraf"
date: 2024-10-22 21:11:00
draft: false

tags: ["JavaScript", "TypeScript"]
---

## Quick Chat
rimraf 是一個用於遞迴刪除文件或目錄的 Node.js 庫，類似於 Unix 上的 rm -rf 命令。它的主要功能是跨平台刪除文件和文件夾，特別適合在 Windows 和 Unix 系統上使用。

## Guide
- [isaacs/rimraf](https://github.com/isaacs/rimraf)
- [Rimraf详细介绍](https://blog.csdn.net/imdeity/article/details/137772287)

## Install
```bash
pnpm add -D rimraf
```

## Usage

### 單個文件
```bash
pnpm rimraf file.txt
```

### 單個目錄
```bash
pnpm rimraf folder
```

### 複數目標
```bash
pnpm rimraf folder1 folder2 file.txt
```

### 匹配目標
```bash
pnpm rimraf --glob "./**/index.js"
```

### 透過 scripts command 執行
```json
{
  "scripts": {
    "clean": "rimraf dist"
  }
}
```