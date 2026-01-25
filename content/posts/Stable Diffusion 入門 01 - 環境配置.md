---
draft: false
title: Stable Diffusion 入門 01 - 環境配置
date: 2025-02-10T10:00:00+08:00
tags:
  - AI
  - Art
  - Stable_Diffusion
---

## Quick Chat

目前產圖只使用到 Forge Neo + SDXL(Illustrious)。

介紹兩個方式 : 
- 本地部屬：設備允許。 
- 雲端部屬：白嫖 Google Colab，用於背景抽卡用。 

## 本地部屬

我的本地設備是
- Windows 11
- GeForce RTX™ 5070 Ti 

安裝流程
- 將 nvidia 驅動更新至最新，我是透過 nvidia studio 安裝。
- 透過 git clone [GitHub - Haoming02/sd-webui-forge-classic at neo](https://github.com/Haoming02/sd-webui-forge-classic/tree/neo)

## 雲端部屬

安裝流程
- 到 Civitai 網站取得 Civitai API Key
- Civitai 網站 Menu > Account Settings(齒輪 icon) > API Keys
- 將腳本 [gutris1/segsmaker](https://github.com/gutris1/segsmaker) 複製到自己的雲端硬碟
- 配置腳本參數 Civitai API Key
- 配置模型與插件

## 推薦插件

- 提示詞補字：[DominikDoom/a1111-sd-webui-tagcomplete](https://github.com/DominikDoom/a1111-sd-webui-tagcomplete)。
- 提示詞辭典：[Physton/sd-webui-prompt-all-in-one](https://github.com/Physton/sd-webui-prompt-all-in-one) 
- 細節修復：[Bing-su/adetailer](https://github.com/Bing-su/adetailer) 
- Photopea 外掛：[yankooliveira/sd-webui-photopea-embed](https://github.com/yankooliveira/sd-webui-photopea-embed)

## Settings

Saving images > Saving images/grids
- **Images filename pattern** : `[datetime]-[seed]`
- **Add number to filename when saving** : 反選
- 這樣避免整合圖片時發生亂序。