---
title: "Unity - Google Service"
date: 2023-03-02 21:11:00
draft: true

tags: ["Unity"]
---

## 前言
Google 停止維護 Game Package Registry (GPR) 導致不能直接使用 Package Manager 導入包。必須到封存檔網站下載「.tgz」手動導入。

## 連結
- [Importing UPM packages with .tgz files (2018.4+)](https://developers.google.com/unity/instructions#install-tgz)
- [下載 Google Unity 套件](https://developers.google.com/unity/archive?hl=zh-tw#firebase)
- [【Unity】Google APIs for UnityをPackage Managerで管理する](https://kingmo.jp/kumonos/unity-google-apis-for-unity-import-package-manager/)
- [Firebase SDK を Unity Package Manager(UPM) 管理へ移行検証してみた話](https://tech.sumzap.co.jp/entry/firebase-sdk-to-upm)

## 措施
為了避免不同的專案要重複導入 .tgz 包，將他們集中放於某處比較省空間。但須要自己注意路徑。