---
title: "AI - Art - Stable diffusion - GUI"
date: 2025-02-10 21:16:00
draft: false

tags: ["AI", "Art", "Stable diffusion"]
---

## Quick Chat
建議新手直接從 Forge 入門即可

## Guide
- [Comfyui官方客户端 desktop桌面版来了](https://www.bilibili.com/video/BV1HDBZYBEjK)
- [AI 繪圖的終極沙盒 ComfyUI 快速上手 #1 無視一切規則，AI 神級繪圖工具還給你全方位掌控權！](https://www.youtube.com/watch?v=bbuspQWHt9w)
- [AI 繪圖的終極沙盒 ComfyUI 快速上手 #2 - LoRA 微調模型 & AI 影像畫質提升](https://www.youtube.com/watch?v=g3COb2joy1A)
- [AI 繪圖的終極沙盒 ComfyUI 快速上手 #3 - ControlNet 精確構圖技巧](https://www.youtube.com/watch?v=rMlZ2Yaw3Ko)

## [Automatic1111](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
是最早推出的圖形使用者介面之一，為使用者提供了直觀且功能豐富的操作平台。由於其開源性質和強大的社群支持，許多初學者和開發者選擇從 Automatic1111 入手，逐步熟悉 Stable Diffusion 的各項功能和應用。

![Automatic1111 Screenshot](https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/refs/heads/master/screenshot.png)

## [Forge](https://github.com/lllyasviel/stable-diffusion-webui-forge)

基於 Automatic1111 進行了多項優化
- 記憶體控制優化且推理速度提升
- 算法優化
- 新增取樣器
- 簡化的命令標誌

介面與 Automatic1111 高度相似，基本能無痛從 Automatic1111 轉移。

```
set COMMANDLINE_ARGS=--xformers --no-half-vae --medvram
```

## [ComfyUI](https://github.com/comfyanonymous/ComfyUI)
是一個開源的節點式圖形介面，允許使用者通過直觀的節點系統設計和執行複雜的工作流程。

![ComfyUI Screenshot](https://github.com/user-attachments/assets/7ccaf2c1-9b72-41ae-9a89-5688c94b7abe)
