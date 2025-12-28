---
draft: false
title: Stable Diffusion - Illustrious XL
date: 2025-02-06T10:00:00+08:00
tags:
  - AI
  - Art
  - Stable_Diffusion
---

## Quick Chat

目前 Stable Diffusion 只拿來自娛自樂 😃。

## Core Working Principles

Stable Diffusion 主要包含三個核心技術：

### 前向擴散（Forward Diffusion）

- 先從大量圖片資料集中學習圖片特徵。
- 然後，系統會逐步加入高斯雜訊（Gaussian Noise），使圖片變得模糊、無法辨識。
- 最後，這個過程會讓圖片變成完全的純雜訊（random noise）。

### 反向去噪（Reverse Denoising / U-Net）

- Stable Diffusion 學習如何逆向去噪，一步步從雜訊還原出清晰的圖片。
- 這部分的關鍵是 U-Net 神經網路架構，它可以在多層次的細節中，捕捉圖片的各種特徵。

### 文本引導（Text Conditioning / CLIP）

- Stable Diffusion 之所以能生成符合指令的圖片，是因為它使用了CLIP（Contrastive Language-Image Pretraining）。
- CLIP 會將文字轉換成向量表示（latent embeddings），這些向量再指導模型生成符合描述的圖像。

### Diagram

- [Improving Diffusion Models as an Alternative To GANs, Part 1](https://developer.nvidia.com/blog/improving-diffusion-models-as-an-alternative-to-gans-part-1/)

![123](https://developer-blogs.nvidia.com/wp-content/uploads/2022/04/Generation-with-Diffusion-Models.png)

## Extras

- [Re: [問題] AI 風格怎麼了嗎？為什麼容易膩？ - 看板C_Chat - PTT網頁版](https://www.pttweb.cc/bbs/C_Chat/M.1730732828.A.70C)