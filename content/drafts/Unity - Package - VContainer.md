---
title: "Unity - Package - VContainer"
date: 2023-03-01 21:11:00
draft: true

tags: ["Unity"]
---

VContainer 是一個 DI library
操作細節官方手冊講得蠻清晰的，這裡不多贅述，主要紀錄學習時的難點

必須要說 DI library 不是必要的
Composition Root 被稱作窮人的 DI


## Repo
- [hadashiA/VContainer](https://github.com/hadashiA/VContainer)

## Guide
- [Offical](https://vcontainer.hadashikick.jp/)
- [【Unity】DI（依存性の注入）](https://soft-rime.com/post-11249/)

## 核心觀念

### ff
作者是不建議東西被注到 MonoBehaviour 中

### LifetimeScope 
- Lifetime.Singleton : 單例
- Lifetime.Scoped : 同範圍等同單例
- LifeTime.Transient : 每一個都是新的實例

LifetimeScope 能建立樹狀結構關係，在處理依賴時從離自己最近的開始往 Parent LifetimeScope 尋找

### Entry point


### 



