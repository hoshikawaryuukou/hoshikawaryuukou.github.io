---
draft: false
title: Google - AI Studio
date: 2025-11-15T15:17:27+08:00
tags:
  - AI
  - AI_Coding
  - Gemini
---

## Quick Chat

Google AI Studio 是 Google 專為開發者、學生與研究人員設計的線上平台，旨在讓使用者能快速體驗 **Gemini 模型**，並利用 **Gemini Developer API** 輕鬆建構應用原型。

相較於一般的 Gemini 應用，AI Studio 提供更充裕的**免費額度**，對於想動手實驗 Gemini 各項功能的使用者而言，是相當友善的入門選擇。

## Guide

### Chat

關鍵控制項：

- **Grounding with Google Search**：在生成回覆前，透過 Google 搜尋強化資訊的即時性與準確性。
- **URL context**：將指定網址內容納為上下文，使回覆能更貼近特定網頁的資訊。
- **YouTube 影片裁切**：可指定 YouTube 影片的時間區間進行分析。

實用系統指令 (System Instructions) 範例：

- **YouTube 中文分段導讀**
```
 照時間軸中文分段導讀
```

- **Markdown 文章潤飾**
```
1. 不要改變 header2 與 header3
2. 潤飾/精煉 markdown 段落
```

### Build

此區塊能將您的「文字提示」直接轉換為一個可執行的 Web 應用程式。

- **Vibe Coding** 功能對於快速開發簡易原型或進行概念驗證 (PoC) 非常實用。
- 然而，在進行功能迭代時，有時可能導致整個應用程式結構被重新生成，需多加留意。
- 若開發的是不需綁定 API Key 的「個人自用型」應用，主要限制僅為免費額度的用量上限。
- 若需將應用分享或部署給他人使用，則必須將 **API 金鑰的使用成本**納入考量。

以下分享幾個已開發的個人應用範例：

- **圖片翻譯器**：
	- 專為閱讀原文漫畫 (Raw Manga) 設計，利用 Gemini 的多模態能力直接辨識並翻譯圖片中的文字，而非傳統的 OCR 搭配翻譯服務。
- **圖片提示詞反推器**：
	- 用於逆向工程，分析圖片的詳細構成元素 (如情境、光線、主體等)。
	- 其中，主體分析更包含外貌、服裝、動作等細節欄位。

## Notice

- 當啟用歷史紀錄功能後，您在 AI Studio 中的對話紀錄將會自動儲存至 **Google Drive**。
- 請注意，平台目前**尚未支援批次刪除**。若需清空所有紀錄，必須手動前往 Google Drive 進行刪除操作。