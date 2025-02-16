---
title: "AI - Stable diffusion - Environment"
date: 2025-02-10 20:13:00
draft: false

tags: ["AI", "Stable diffusion", "Art"]
---

## Local deployment
⚠️ 以下皆須安裝指定版本不可貿然升級
- nvidia 驅動更新至最新
- cuda: [CUDA 12.1](https://developer.nvidia.com/cuda-12-1-0-download-archive) 
  - 檢查顯卡支援的最高 cuda 支援: `nvidia-smi`
  - 顯示CUDA編譯工具的版本信息: `nvcc --version`
- Python: [Python 3.10.11](https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe)
  - `python --version`
- Git: [Fork](https://git-fork.com/)
- GUI: [lllyasviel/stable-diffusion-webui-forge](https://github.com/lllyasviel/stable-diffusion-webui-forge)
- clone 上述專案，執行 `webui.bat`

## Google Colab 
- [gutris1/segsmaker](https://github.com/gutris1/segsmaker)
- [cagliostrolab/forge-colab](https://github.com/cagliostrolab/forge-colab)
