---
title: "AI - Stable diffusion - Quick Start"
date: 2025-02-17 20:40:00
draft: false

tags: ["AI", "Stable diffusion", "Art"]
---

## Quick Chat
本筆記是針對 Stable diffusion 的基本觀念與操作，環境配置請參考

> AI - Stable diffusion - Environment

## Prompt
提示詞（Prompt）是 AI 生成圖片的指令，分為：
1. **正向提示詞（Positive Prompt）** → 預期的元素
2. **負向提示詞（Negative Prompt）** → 排除的元素

### Sample 
- **「粉色長髮的美少女，穿著和服，背景是櫻花」**

### Positive Prompt 
1. **主題（Main Subject）** → *anime girl, warrior, castle, spaceship*
2. **特徵（Appearance）** → *pink hair, blue eyes, long dress, armor*
3. **背景（Background）** → *cherry blossoms, cyberpunk city, medieval castle*
4. **風格（Style）** → *anime style, photorealistic, oil painting*
5. **燈光（Lighting）** → *soft lighting, cinematic lighting, neon lights*
6. **視角（Camera Perspective）** → *close-up, wide-angle, over-the-shoulder*

### Negative Prompt
1. **品質問題** → blurry, low quality, pixelated, noisy
2. **人體錯誤** → deformed, extra fingers, bad anatomy, malformed limbs
3. **表情問題** → ugly, weird expression, asymmetrical face
4. **不想要的風格** → 3D render, cartoonish, sketch

### Control 
- **使用 () 加強** → `((masterpiece)), (highly detailed), (8K ultra HD)`
- **使用 [] 減弱** → `[blurry], [low quality]`
- **指定數值** → `(pink hair: x)`, `x > 1 加強, x < 1 減弱`
- **從左到右**的順序來解析提示詞，**越前面的詞影響越大，越後面的詞影響越小**。
- 不同的 **Checkpoints** 對提示詞的理解會有所不同，選對模型才能產生最好的效果。
