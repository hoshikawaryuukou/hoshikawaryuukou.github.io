---
draft: false
title: Stable Diffusion 入門 02 - 基本知識
date: 2025-02-17T10:00:00+08:00
tags:
  - AI
  - Art
  - Stable_Diffusion
---

## Quick Chat

- ⚠️ 這是一篇新手導引，目的不在於精準解釋。
- ⚠️ **Checkpoint** 一般會提供推薦的參數設置，建議依據模型的特性調整，以獲得最佳效果。

## Resources

- [Civitai: The Home of Open-Source Generative AI](https://civitai.com/)

## Checkpoint

決定生成圖片的基礎風格。
- 寫實風格 (Photorealistic)
- 動漫風 (Anime)
- 油畫風格 (Painting)
- 科幻賽博龐克 (Cyberpunk)
- 像素風格 (Pixel Art)

## LoRA 

輕量化微調模型可額外載入來增強特定風格或角色。
- 簡單的比喻來形容 LoRA 模型，那就是「濾鏡」

## Embedding

增強對某些 Prompt 的理解。

## VAE

提高圖片細節與顏色準確度。
- 📝 部分 Checkpoints 會內建（Baked）VAE，如使用外部 VAE，請確認是否需要覆蓋內建版本。
- ⚠️ 如果發現圖片的型都對，但只有顏色壞掉，通常都是 VAE 的問題。

## Resolutions

不同種類的 Checkpoints 建議的解析度會有所不同
- SD 1.5
	- 512 x 512 : 1:1
	- 512 X 768 : 2:3
- SDXL
	- 640 x 1536 = 5:12
	- 768 x 1344 = 4:7
	- 832 x 1216 = 13:19
	- 896 x 1152 = 7:9
	- 1024 x 1024 = 1:1
	- 1024 x 1536 = 2:3


## Sampler + Schedule 

Sampler 是從雜訊圖到成品的**去噪算法**。
- **快速收斂** – 能迅速找到解答，適合驗證創意和想法。
- **高品質收斂** – 需較長時間，但能提供更精確結果。
- **無固定收斂** – 無明確收斂條件，為創新提供更大空間。

Schedule 是從雜訊圖到成品的**去噪程度**。

📝 常用組合
- Euler A Automatic
- DPM++ 2M Karras
- DPM++ SDE Karras

## Steps

從雜訊圖到成品的**迭代次數**。
- ⚠️ 步數過少可能導致產生的影像品質不佳。
- ⚠️ 步數過多可能使影像產生過程變得冗長，但未必能提升品質。
- 📝 建議從較低的步數開始，例如 15 或 20。

## CFG Scale

**遵循 Prompt 的程度**。數值越大，產生的影像與文字提示的相關性越高。
- ⚠️ 但當數值過大時可能會出現過度飽和或不自然的情況。
- 📝 建議從較低的 CFG 比例值開始並增加它，直到對結果滿意為止。
- 📝 沒有最佳值，要根據模型的不同來設定不同的值。
- 📝 常用區間：3 ~ 7

## Seed

用於生成雜訊圖。
- ⚠️ 當圖片大小改變時所生成的雜訊圖也會有差異(即使比例一樣)。
- 📝 使用相同的 Seed 可重現相同圖片(前提是設備/環境需一致)。
- 📝 設為 `-1` 為隨機。
- 📝 固定 Seed 進行實驗：在進行圖像生成時，建議固定一個 Seed，然後調整提示詞或其他參數，以便觀察這些變化對最終圖像的影響。

## Clip Skip

調整生成圖像過程中對提示詞的處理方式。
- 📝 現實系建議設為 1。
- 📝 動畫風建議設為 2。

## Prompt

- 不同的 **Checkpoints** 對提示詞的理解會有所不同，選對模型才能產生最好的效果。
- **從左到右的順序**來解析提示詞，**越前面的詞影響越大**，越後面的詞影響越小。
- **正向 Prompt**：描述想要的內容。
- **負向 Prompt**：描述不想要的內容。
- **BREAK**：可用來分隔不同場景或主題。
- **數值控制權重**：調整提示詞的影響力，數值越高影響越強。例如：
	- `(beautiful:1.5)`：增強 "beautiful" 
	- `(dark:0.8)`：減弱 "dark" 
- 提示詞應該從**少量開始，逐步增加**，這樣才能確保：
	- **確定哪些詞有效**
	- **避免無效詞**
	- **確保 Prompt 保持清晰，容易控制風格**
- [Illustrious XL 提示 (+ 更新！)](https://civitai.com/articles/8380/tips-for-illustrious-xl-prompting-updates)
- [NOOBAI XL快速指南](https://fcnk27d6mpa5.feishu.cn/wiki/S8Z4wy7fSiePNRksiBXcyrUenOh)
- [NAIv3 Style Codex: Single Artist](https://300huafeng.vercel.app/single_artist_style.html)
- [NAIv3 Style Codex: Mixed Artists](https://300huafeng.vercel.app/mixed_artists_style.html)

## Extras

- [img2img - inpaint](https://www.youtube.com/watch?v=srvek4ucH-A)
- [ControlNet](https://medium.com/%E5%BA%97%E5%B0%8F%E4%BA%8C%E7%9A%84%E5%B8%B3%E7%B0%BF/ai%E7%B9%AA%E5%9C%96-stable-diffusion-008-controlnet-%E5%89%8D%E8%A8%80-716ce415f87)