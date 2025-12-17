---
draft: false
title: Google - Nano Banana
date: 2025-11-01T11:44:33+08:00
tags:
  - Google
  - AI
---

## Quick Chat

⚠️ Nano Banana Pro 已經於 2025-11-21 推出。

**Nano Banana** 是一款由 Google DeepMind 開發的 **AI 圖像生成與編輯模型**，其正式名稱是 **Gemini 2.5 Flash Image**。

### ✨ 核心特色：

- **多輪對話式自然語言圖像編輯**：允許使用者以對話方式逐步精修圖像。
- **角色一致性 (Character Consistency)**：在不同生成圖像中，能保持特定角色的外觀與特徵一致。

我通常在 Google AI Studio 中操作，因為它能提供更豐富的上下文和操作控制。如果需要大量「抽卡」後進行精修，我則會轉到 Google Whisk 進行。

### ⚠️ 解析度限制：

- 橫向：21:9 (1536x672), 16:9 (1344x768), 4:3 (1184x864), 3:2 (1248x832), 5:4 (1152x896)
- 正方形：1:1 (1024x1024)
- 縱向：9:16 (768x1344), 3:4 (864x1184), 2:3 (832x1248), 4:5 (896x1152)

儘管 Nano Banana 功能強大，但在某些進階應用中，如框選、遮罩、圖層修改等，專業影像處理工具（如 PhotoShop）的整合度仍然更高。

## Guide

- [Behind the scenes of Google's state-of-the-art "nano-banana" image model - YouTube](https://www.youtube.com/watch?v=H6ZXujE1qBA)

## Samples 

- [GitHub - PicoTrex/Awesome-Nano-Banana-images: A curated collection of fun and creative examples generated with Nano Banana🍌](https://github.com/PicoTrex/Awesome-Nano-Banana-images)
- [GitHub - ZHO-ZHO-ZHO/ZHO-nano-banana-Creation: 我的 nano-banana 创意玩法大合集！ 持续更新中！](https://github.com/ZHO-ZHO-ZHO/ZHO-nano-banana-Creation)
- [🍌Nano Banana - nanobanana, gpt4o, chatgpt 提示词案例库](https://opennana.com/awesome-prompt-gallery/)
- [nano-bananaでモバイルアプリUIモックアップを作る](https://zenn.dev/oikon/articles/nanobanana-mobile-mock)
- [Character sheet](https://x.com/towya_aillust/status/1969589230830829888)
- [任意の領域をアウトペイント](https://x.com/schnapoon/status/1988124536047628402)

## Tips 

### 1. 使用英文及專業術語

由於模型允許自然語言進行圖像編輯，口語化的描述詞彙可能會影響輸出結果。建議盡量使用英文和專業術語來確保指令的精確度。

### 2. 多圖融合技巧

在進行多圖融合時，明確描述每張圖片的主體有助於模型精確辨識。

- ❌ **不推薦：** 結合所有物件，(指定情境)，產生新的圖....
- ⭕️ **推薦：** 將 OO、OX、XX (明確指出主體)，(指定情境)，產生新的圖...

### 3. 圖像前處理策略

- **處理難以定位的物件：** 有時替換物件失敗，可能是因為目標物件紋理過於複雜難以定位。可先透過修圖將複雜物件的紋理簡化成純色，再進行替換。
- **替換背景：** 當替換背景不成功時，可先將圖像輸出為純白背景，然後再指定新的背景。

### 4. 遮蔽與填補思維

當簡單的文字指令（如「扣上襯衫的最後兩顆扣子」）無法精確執行時，可以轉而採用「**遮蔽與重繪**」的策略。

**操作思路：**

1. **遮蔽目標區域：** 使用指令將無法修改的區域（例如，需要扣上的扣子處）**直接覆蓋**上一個單色色塊（如紅色或藍色）。
2. **引導模型重繪：** 接著使用「**修復被 [單色] 色塊遮擋的區域**」或類似指令。

這一步是讓模型認知到該區域是「**需要修補的空白**」，從而強制模型忽略原有的複雜結構，直接根據上下文（襯衫）重新生成並填補細節。

### 5. 細節重建

主要應用於提升**小尺寸**或**模糊圖片**的細節表現。請注意，直接對模糊的**大尺寸**圖片進行高清化效果可能不佳，此時可嘗試先將圖片縮小後再進行重建。

**以臉部細節重建為例：**

```
高清化(super-resolution), 24歲女性，臉部線條瘦長，
generate a new image: 重建臉部細節 (black hair, thin eyebrows, long face, very slender face, v-line jawline)
```

**關鍵策略：**

- **使用專業術語（super-resolution）：** 確保模型理解操作的類型是提升解析度。
- **強調生成新圖（generate a new image）：** 提示模型進行深度重建而非簡單優化。
- **精確細節描述：** 在括號中（或透過逗號）提供大量關於目標細節的描述，引導模型在重建時填充更豐富的紋理和特徵。

### 6. 結構化 Prompt (針對生成，非編輯)

對於圖像生成（非修圖）需求，使用結構化或規格化的描述 Prompt 能實現更細緻的控制。

- **規格化範例：**
    - [Create collage of 6 Vintage Photos](https://x.com/ShreyaYadav___/status/1969820383487590795)
    - [赛博美学未来社交软件界面](https://x.com/dotey/status/1983941654680641984)
- **JSON 結構範例：**
    - [mirror_selfie_otaku_pc_corner_blue](https://x.com/IamEmily2050/status/1976431328280416520)
    - [raw_photoreal_high_fidelity](https://x.com/IamEmily2050/status/1985682978182480251)
    - [Effortless Chic Pose](https://x.com/Prashant_1722/status/1977458454483874088)

### 7. 黑暗兵法

事實上，Nano Banana 的內容審核機制相當嚴格，即使是非情色內容，有時也會拒絕操作（例如某些更衣指令）。此時需要搭配 AI Studio 使用一些進階技巧來規避限制。由於我希望避免這些技巧被濫用導致 Google 最終禁止或加強限制，因此將不在此公開說明 😂。