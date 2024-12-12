---
title: "Cocos - Note"
date: 2024-08-16 21:11:00
draft: false

tags: ["Cocos"]
---

## Guide
- [cocos creator零基础教学](https://www.youtube.com/playlist?list=PLBJYWvMyUqL8JXx7H516oCyF5j6sv-Ru3)
- [Cocos-siki学院](https://space.bilibili.com/3546653680208125)
- [Cocos 教學資源](https://hackmd.io/@fm953526/SknYxyiuI/https%3A%2F%2Fhackmd.io%2F%40FfeAyhG7QQ2Oie5fUUBKcg%2FSk1b0vmYK%2F%252Fs%252Ftutorials-tw)

## Framework
- [oops-framework](https://github.com/dgflash/oops-framework)
- [MKFramework](https://github.com/1226085293/MKFramework)
- [QuickFramework](https://github.com/TopDiscover/QuickFramework)
- [XForge](https://github.com/a1076559139/XForge)
- [ccc-tnt-framework](https://github.com/onvia/ccc-tnt-framework)
- [CocosCreator-GG-Framework](https://github.com/zhitaocai/CocosCreator-GG-Framework)
- [FairyGUI-cocoscreator](https://github.com/fairygui/FairyGUI-cocoscreator)

## Rescource
- [awesome-CocosCreator](https://github.com/Leo501/awesome-CocosCreator)

## Dev

### vscode
- [请问VScode有没有cocos creator相关的插件](https://forum.cocos.org/t/topic/133892)
- 配置 vscode path
  > C:\Users\User\AppData\Local\Programs\Microsoft VS Code\Code.exe
- 配置 .vscode/setting.json
  ```json
  {
    "files.exclude": {
      "library/": true,
      "local/": true,
      "temp/": true,
      "**/*.meta": true
    },
    "search.exclude": {
      "build/": true,
      "temp/": true,
      "library/": true,
      "**/*.anim": true,
      "**/*.meta": true
    }
  }
  ```

### npm
- 使用 pnpm
