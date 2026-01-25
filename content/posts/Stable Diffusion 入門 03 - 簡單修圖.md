---
draft: false
title: Stable Diffusion 入門 03 - 簡單修圖
date: 2025-06-12T10:00:00+08:00
tags:
  - AI
  - Art
  - Stable_Diffusion
---

## Quick Chat

目前並未特別使用進階修圖技巧。若圖片瑕疵可透過簡單塗色與描邊處理，即會嘗試修復。

若瑕疵較嚴重，則多半直接放棄並重新生成 —— 通常下一張會更好。

## Modification

### 使用內建功能

- 圖片先送入 `img2img`。
- 簡單處理：使用 `Inpaint sketch`（注意不要在 sketch 模式下直接生成）。
- 複雜處理：使用 `photopea-embed` 進行手動遮罩或編輯。
- 完成後再送回 `Inpaint` 重新生成。

### 使用 Nano Banana (pro)

- 直接使用最強的修圖模型。
- Banana 的回傳都會出現一些偏移需要額外到 photopea 中對齊。
- 完成後再送回 `Inpaint` 重新生成調整畫風。

## Generation

- 去雜強度（Denoising strength）建議範圍：
  - `0.2 ~ 0.3`：保留原圖整體色彩結構，僅微調瑕疵與過渡區域。
  - `0.3 ~ 0.5`：適度改變結構與細節，適合嘗試新的構圖或調整 seed 取得更好結果。