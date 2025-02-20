---
title: "AI - Stable diffusion - Quick Start"
date: 2025-02-17 20:40:00
draft: false

tags: ["AI", "Stable diffusion", "Art"]
---

## Quick Chat
- ⚠️ 這是一篇新手導向的筆記，目的不在於精準解釋
- ⚠️ 環境配置請參考 `AI - Stable diffusion - Environment`
- ⚠️ **Checkpoint** 一般會提供推薦的參數設置，建議依據模型的特性調整，以獲得最佳效果。

## Components

### Checkpoint
- 決定生成圖片的基礎風格。
  - 寫實風格 (Photorealistic)
  - 動漫風 (Anime)
  - 油畫風格 (Painting)
  - 科幻賽博龐克 (Cyberpunk)
  - 像素風格 (Pixel Art)

### LoRA 
- 可額外載入來增強特定風格或角色。
- 輕量化微調模型，可以附加到不同的 Checkpoint。

### Embedding
- 增強對某些 Prompt 的理解。
- 小型數據文件，用來微調特定特徵或風格。

### VAE
- 提高圖片細節與顏色準確度。
- 部分 Checkpoints 會內建（Baked）VAE，如使用外部 VAE，請確認是否需要覆蓋內建版本。
- ⚠️ 如果發現圖片的型都對，但只有顏色壞掉，通常都是 VAE 的問題。

### Sampler
- 從雜訊中逐步還原出圖片的方法。
  - 圖片細節（清晰度、細緻程度）
  - 收斂速度（步數少時的品質）
  - 風格穩定度（隨機性 vs 可重現性）
- 不同的情境： 
  - **Euler a**：快速預覽。
  - **DPM++ SDE Karras**：細節較佳。

## Generation

### Prompt
- **正向 Prompt**：描述想要的畫面，例如 `a beautiful girl, wearing kimono, sakura background`

- **負向 Prompt**：描述不想要的內容，例如 `blurry, low quality, deformed`

- **BEEAK**：可用來分隔不同場景或主題。例如：`a warrior in armor BREAK a futuristic cityscape`。

- **數值控制權重**：使用 `(word:1.2)` 來增加特定詞的影響力，數值越高影響越強。例如：`(beautiful:1.5), (dark:0.8)` 讓 "beautiful" 更突出，而 "dark" 影響較弱。

- **從左到右的順序**來解析提示詞，**越前面的詞影響越大**，越後面的詞影響越小。

- 不同的 **Checkpoints** 對提示詞的理解會有所不同，選對模型才能產生最好的效果。

- 提示詞應該從**少量開始，逐步增加**，這樣才能確保：
  - **確定哪些詞有效**
  - **避免無效詞**
  - **確保 Prompt 保持清晰，容易控制風格**

### Parameters

- **Steps（步數）**：決定圖片細節程度，建議 20~30。

- **CFG Scale**：影響 AI 遵循 Prompt 的程度，建議 7~9。

- **Seed（種子值）**：相同 Seed 可重現相同圖片，設為 `-1` 會隨機變化。

- **Clip Skip**：影響 AI 理解 Prompt 的方式，動畫風建議設為 2。
