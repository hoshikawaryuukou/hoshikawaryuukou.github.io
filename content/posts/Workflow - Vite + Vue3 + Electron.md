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

### 新增 ./electron/electron-env.d.ts
```ts
declare namespace NodeJS {
  interface ProcessEnv {
    /**
     * The built directory structure
     *
     * ```tree
     * ├─┬─┬ dist
     * │ │ └── index.html
     * │ │
     * │ ├─┬ dist-electron
     * │ │ ├── main.js
     * │ │ └── preload.js
     * │
     * ```
     */
    APP_ROOT: string;
    VITE_PUBLIC: string;
  }
}

// Used in Renderer process, expose in `preload.ts`
interface Window {
  ipcRenderer: import('electron').IpcRenderer;
}

```

### 新增 ./electron/main.ts
```ts
import { app, BrowserWindow } from "electron";
import { fileURLToPath } from "node:url";
import path from "node:path";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// The built directory structure
//
// ├─┬─┬ dist
// │ │ └── index.html
// │ │
// │ ├─┬ dist-electron
// │ │ ├── main.js
// │ │ └── preload.mjs
// │
process.env.APP_ROOT = path.join(__dirname, "..");

// 🚧 Use ['ENV_NAME'] avoid vite:define plugin - Vite@2.x
export const VITE_DEV_SERVER_URL = process.env["VITE_DEV_SERVER_URL"];
export const MAIN_DIST = path.join(process.env.APP_ROOT, "dist-electron");
export const RENDERER_DIST = path.join(process.env.APP_ROOT, "dist");

process.env.VITE_PUBLIC = VITE_DEV_SERVER_URL
  ? path.join(process.env.APP_ROOT, "public")
  : RENDERER_DIST;

let win: BrowserWindow | null;

function createWindow() {
  win = new BrowserWindow({
    icon: path.join(process.env.VITE_PUBLIC, "electron-vite.svg"),
    webPreferences: {
      preload: path.join(__dirname, "preload.mjs"),
    },
  });

  // Test active push message to Renderer-process.
  win.webContents.on("did-finish-load", () => {
    win?.webContents.send("main-process-message", new Date().toLocaleString());
  });

  if (VITE_DEV_SERVER_URL) {
    win.loadURL(VITE_DEV_SERVER_URL);
  } else {
    // win.loadFile('dist/index.html')
    win.loadFile(path.join(RENDERER_DIST, "index.html"));
  }
}

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on("window-all-closed", () => {
  if (process.platform !== "darwin") {
    app.quit();
    win = null;
  }
});

app.on("activate", () => {
  // On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (BrowserWindow.getAllWindows().length === 0) {
    createWindow();
  }
});

app.whenReady().then(createWindow);
```

### 新增 ./electron/preload.ts
```ts
import { ipcRenderer, contextBridge } from 'electron'

// --------- Expose some API to the Renderer process ---------
contextBridge.exposeInMainWorld('ipcRenderer', {
  on(...args: Parameters<typeof ipcRenderer.on>) {
    const [channel, listener] = args
    return ipcRenderer.on(channel, (event, ...args) => listener(event, ...args))
  },
  off(...args: Parameters<typeof ipcRenderer.off>) {
    const [channel, ...omit] = args
    return ipcRenderer.off(channel, ...omit)
  },
  send(...args: Parameters<typeof ipcRenderer.send>) {
    const [channel, ...omit] = args
    return ipcRenderer.send(channel, ...omit)
  },
  invoke(...args: Parameters<typeof ipcRenderer.invoke>) {
    const [channel, ...omit] = args
    return ipcRenderer.invoke(channel, ...omit)
  },

  // You can expose other APTs you need here.
  // ...
})
```

### 修改 tsconfig.app.json
```json
{
  "include": ["src/**/*.ts", "src/**/*.tsx", "src/**/*.vue", "electron/**/*.ts"]
}
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

### 新增 

### ./electron-builder.json5
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
        target: 'dir',
        arch: ['x64'],
      },
      // {
      //   target: 'nsis',
      //   arch: ['x64'],
      // },
      // {
      //   target: 'portable',
      //   arch: ['x64'],
      // },
      // {
      //   target: 'zip',
      //   arch: ['x64'],
      // },
    ],
  },
  // nsis: {
  //   oneClick: false,
  //   perMachine: false,
  //   allowToChangeInstallationDirectory: true,
  //   deleteAppDataOnUninstall: true,
  // },
  linux: {
    target: ['AppImage'],
    artifactName: '${productName}-Linux-${version}.${ext}',
  },
}

```