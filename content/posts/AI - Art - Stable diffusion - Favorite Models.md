---
title: "AI - Art - Stable diffusion - Favorite Models"
date: 2025-05-16 21:11:00
draft: false

tags: ["AI", "Art", "Stable diffusion"]
---

## Quick Chat
- sd 1.5 系列基本上不使用了
- Illustrious 是目前的使用主力

## Checkpoints
底模基本分成兩種
- 無風格模型 : lora 會很大程度影響出圖風格
- 風格模型 : 模型本身有一定程度的風格，常用於抵消一些有瑕疵的 lora

### WAI-NSFW-illustrious-SDXL
- [link](https://civitai.com/models/827184?modelVersionId=1490781)
- 無風格模型
- 目前使用版本 14
- 出圖速度較快，適合搭配優良 lora 使用

### SteinCustom
- [link](https://civitai.com/models/1245022?modelVersionId=1669006)
- 無風格模型，但能一定程度約束 lora 風格
- 目前使用版本 6 
- 實測版本 7 風格有變得偏 pony 不太喜歡
- 實測版本 8 光影效果表現不好
- **年齡** 控制相對有效 prompts (`age up, meature female`) 

## Lora - Styles
- 大部分的底模都有人物偏萌系/幼態的問題

### Solo Leveling Anime Style
- [link](https://civitai.com/models/1137411/solo-leveling-anime-style)
- 增強 臉部銳利度
- 增強 較長的體態
- 增強 平塗效果
- ⚠️頸部附近的 hard shadow 有時會過於明顯，需調控 prompts (`anime coloring`) 權重

### Violet Evergarden Anime Style
- [link](https://civitai.com/models/1334756/violet-evergarden-anime-style)
- 增強 較小的眼睛
- 增強 平塗效果

## Prompts - Artists
- 權重超過 0.6 比較穩定(但有些太高會有點 overfitting)
- rella : 增加一些插畫風格

## Prompts - Positive
- looking up : 往上看而臉被順勢帶起
- face up : 用於臉完全朝上

## Prompts - Negative
- headwear : 用於移除一切頭部裝飾