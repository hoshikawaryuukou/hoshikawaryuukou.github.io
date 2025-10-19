---
draft: false
title: Gemini - Google AI Studio
date: 2025-10-15T15:17:27+08:00
tags:
  - AI
  - AI_Coding
  - Gemini
---

## Quick Chat

Google AI Studio 是 Google 推出的線上平台，主要定位在協助開發者、學生與研究人員快速試用 **Gemini 模型**，並透過 **Gemini Developer API** 來建立原型或應用程式。

與一般的 Gemini 應用（像 ChatGPT 類型的介面）相比，AI Studio 提供了更多的 **免費額度**，對想要動手實驗 Gemini 功能的人來說相當友善。

## Guide

### Chat

常用的控制項包括：

- **Grounding with Google Search**：可在回答前透過 Google 搜尋補強資訊，使回覆更準確。
- **URL context**：可將指定連結內容作為上下文，讓回答更貼近指定網頁的資訊。

### Build

這個區域能將「文字提示」轉化為可執行的 Web 應用程式。

- **Vibe Coding** 功能在開發簡單原型或概念驗證（PoC）時相當好用。
- 不過在進行功能迭代時，有時會導致整個結構被重新生成 😂。
- 若只是開發「自用型」應用程式（不綁 API Key），頂多遇到免費流量上限就無法繼續使用； 
- 若要分享或部署給他人，則需要考慮 **API 使用費用**。

目前開發了幾個小應用

- Gemini 圖片翻譯器：使用 Gemini 翻譯圖片而不是 Google Translate。

## Notice

- 若開啟歷史紀錄功能，AI Studio 的紀錄會自動儲存在 **Google Drive**。
- 由於目前平台 **未提供批次刪除功能**，若想清空紀錄，必須手動至 Google Drive 操作。
