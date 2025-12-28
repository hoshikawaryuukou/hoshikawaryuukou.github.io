---
draft: false
title: Stable Diffusion - Env
date: 2025-02-10T10:00:00+08:00
tags:
  - AI
  - Art
  - Stable_Diffusion
---

## Quick Chat

⚠️ 以下皆須安裝指定版本不可貿然升級。

目前產圖只使用到 Forge + SDXL 。

## Local deployment

- nvidia 驅動更新至最新
- 檢查顯卡支援的最高 cuda 支援: `nvidia-smi`
- 安裝 [CUDA 12.1](https://developer.nvidia.com/cuda-12-1-0-download-archive) 
- 顯示 cuda 編譯工具的版本信息: `nvcc --version`
- 安裝 [[stable-diffusion-webui-forge](https://github.com/lllyasviel/stable-diffusion-webui-forge)]

## Google Colab 

- [gutris1/segsmaker](https://github.com/gutris1/segsmaker)
- 配置 Civitai API Key
	- Civitai 網站 Menu > Account Settings(齒輪 icon) > API Keys

## Extensions
- [DominikDoom/a1111-sd-webui-tagcomplete](https://github.com/DominikDoom/a1111-sd-webui-tagcomplete)
- [Physton/sd-webui-prompt-all-in-one](https://github.com/Physton/sd-webui-prompt-all-in-one)
- [Bing-su/adetailer](https://github.com/Bing-su/adetailer)
- [yankooliveira/sd-webui-photopea-embed](https://github.com/yankooliveira/sd-webui-photopea-embed)
