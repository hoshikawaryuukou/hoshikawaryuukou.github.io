---
title: "AI - Stable diffusion - CheckPoints"
date: 2025-02-04 21:11:00
draft: false

tags: ["AI", "Stable diffusion", "Art"]
---

## Quick Chat
- ⚠️ 以下主題專注於二次元/動漫風格圖像生成

## Guide
- [Re: [問題] AI 風格怎麼了嗎？為什麼容易膩？ - 看板C_Chat - PTT網頁版](https://www.pttweb.cc/bbs/C_Chat/M.1730732828.A.70C)


## SD1.5
在性能和穩定性上提升很多，社群迎來爆發式成長。

### Milestone/Events
1. **Waifu Diffusion**：這是一個基於 Stable Diffusion 的模型，專注於生成二次元風格的圖像。該模型使用 Danbooru 資料集進行訓練，適合生成各類動漫風格的圖像。

2. **NovelAI 模型外洩（NAI）**：NovelAI 是一個提供 AI 輔助創作的服務平台，其專注於二次元圖像生成的模型曾發生外洩事件。該模型同樣使用 Danbooru 資料集進行訓練。

3. **Anything 系列模型**：Anything V3 和 V4 是專注於二次元圖像生成的模型，具有較高的生成質量和風格多樣性。

4. **ChilloutMix**：這是一個專注於生成寫實風格圖像的模型，能夠生成高品質的寫實人物圖像。

### Resolutions
- 512 x 512 : 1:1
- 512 X 768 : 2:3

## SDXL
相比於 SD1.5 在多方面有顯著的提升
- **更大的模型規模**：SDXL 的參數量遠超 SD1.5，這使其能夠捕捉更複雜的圖像特徵。
- **更高分辨率**：SDXL 支持更高分辨率的圖像生成。
- **雙模型架構**：SDXL 採用雙模型架構，包含一個基礎模型和一個精煉模型。基礎模型生成初步圖像，精煉模型進一步提升細節和質量，這種分工協作顯著提升了生成效果。
- **更強的文本理解能力**：SDXL 在理解複雜提示詞方面表現更好，能更準確地將文本描述轉化為圖像內容，減少誤解和偏差。

### Milestone/Events

1. **Pony Diffusion**：
   - 訓練流程有使用審美分級標籤。
   - 原版 Pony 生成的結果接近歐美審美。
   - Pony 系明顯缺點用色偏暗偏髒。
   - Pony 在「多人互動」方面與 nsfw 表現很好。

2. **NovelAI 3 (NAI3)**：
   - 在識別和再現特定角色和畫師風格方面表現出色，能夠生成高度還原的角色形象和畫風，並融合風格。

3. **Illustrious XL**：
   - [Illustrious XL 提示 (+ 更新！)](https://civitai.com/articles/8380/tips-for-illustrious-xl-prompting-updates)

4. **NoobAI XL**：
   - [NOOBAI XL快速指南](https://fcnk27d6mpa5.feishu.cn/wiki/S8Z4wy7fSiePNRksiBXcyrUenOh)

### Resolutions
- 640 x 1536 = 5:12
- 768 x 1344 = 4:7
- 832 x 1216 = 13:19
- 896 x 1152 = 7:9
- 1024 x 1024 = 1:1
- 1024 x 1536 = 2:3
