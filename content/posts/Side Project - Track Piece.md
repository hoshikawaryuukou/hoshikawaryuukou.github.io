---
draft: false
title: Side Project - Track Piece
date: 2025-08-31T10:00:00+08:00
tags:
  - Side_Project
---

## Quick Chat

- 此專案已開源，完整設計思路請參見 repo。  
- [GitHub - hoshikawaryuukou/MGSP\_TrackPiece](https://github.com/hoshikawaryuukou/MGSP_TrackPiece)

## 專案目標

這是一個實驗性質的 side project，用來驗證 **single feature / tiny game** 的開發模式。 有以下目標：  

1. 嘗試設計一個複雜度適中，且能快速應用於其他遊戲的架構。  
2. 測試 Unity Web 的輸出與效能優化方式。  
3. 作為小型遊戲開發的設計實驗案例。  

## 遊戲介紹

### 遊戲目標

玩家需要讓自己的棋子連成一線（水平、垂直或對角線）以取得勝利。

### 遊戲規則

- 遊戲由兩名玩家進行，分別使用 **黑子** 與 **白子**。  
- 棋盤大小可選擇 **4x4** 或 **6x6**，初始時所有格子為空。  
- 玩家輪流在棋盤上放置棋子。  

### 遊戲玩法

1. **放置棋子**：玩家在自己的回合選擇一個空格放下棋子。  
2. **旋轉棋盤**：每次放置後，棋盤上的所有棋子會 **逆時針旋轉一格**。  
3. **勝利判定**：若有玩家的棋子形成一條直線（橫、縱或斜線），該玩家即獲勝。若棋盤仍有空格且尚未分出勝負，則換下一位玩家繼續。  
