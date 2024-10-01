---
title: "Workflow - Vite + Vue3 + Electron"
date: 2024-09-28 20:11:00
draft: false

tags: ["Vite", "Vue", "Electron"]
---

## Step 1: 準備一個 Vite + Vue3 專案

使用 vite 指令創建空專案
```bash
pnpm create vite vve
cd vve
pnpm install
pnpm dev
```

## Step 2: 配置 Electron

### 添加依賴
```bash
pnpm add -D electron 
pnpm add -D electron-builder 
pnpm add -D vite-plugin-electron 
pnpm add -D vite-plugin-electron-renderer
```

### 修改 package.json
```json
{
  "main": "dist-electron/main.js",
  "scripts": {
    "dev": "vite",
    "build": "vue-tsc && vite build && electron-builder",
    "preview": "vite preview"
  }
}
```

### 於根目錄添加 electron-builder.json5
```json5
{
  $schema: 'https://raw.githubusercontent.com/electron-userland/electron-builder/master/packages/app-builder-lib/scheme.json',
  appId: 'YourAppID',
  asar: true,
  productName: 'YourAppName',
  publish: null,
  directories: {
    output: 'release/${version}',
  },
  files: ['dist', 'dist-electron'],
  mac: {
    target: ['dmg'],
    artifactName: '${productName}-Mac-${version}-Installer.${ext}',
  },
  win: {
    artifactName: '${productName}-Windows-${version}-Setup.${ext}',
    target: [
      {
        target: 'nsis',
        arch: ['x64'],
      },
      {
        target: 'portable',
        arch: ['x64'],
      },
      {
        target: 'zip',
        arch: ['x64'],
      },
    ],
  },
  nsis: {
    oneClick: false,
    perMachine: false,
    allowToChangeInstallationDirectory: true,
    deleteAppDataOnUninstall: true,
  },
  linux: {
    target: ['AppImage'],
    artifactName: '${productName}-Linux-${version}.${ext}',
  },
}
```