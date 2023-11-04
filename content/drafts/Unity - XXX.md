---
title: "Unity - Official - URP"
date: 2023-04-01 21:11:00
draft: true

tags: ["Unity"]
---

- [【Unity教學-Rendering】用URP提升渲染品質 | Unity基礎渲染](https://www.youtube.com/watch?v=LLwnmGInpC4)




---
愛使用Camera來畫UI的同學要注意了，在URP下，切記把Overlay Type的stacking Camera的DepthTexture設成Off，尤其是專案有使用到深度紋理的部份，否則會多做一次CopyDepth