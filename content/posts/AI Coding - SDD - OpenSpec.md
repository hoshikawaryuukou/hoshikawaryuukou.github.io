---
draft: false
title: AI - Coding - SDD - OpenSpec
date: 2025-10-17T14:12:33+08:00
tags:
  - AI
  - AI_Coding
  - Specification-Driven_Development
---

## Quick Chat

在使用 OpenSpec 進行開發的體驗相當不錯，我認為原作者的設計理念解決了許多團隊在導入 AI 協作時的痛點。

- **OpenSpec 的核心優勢：** 它極其擅長管理**既有功能的變更 (1→n)**。 OpenSpec 是一個**輕量級**的框架，無需 API 金鑰即可輕鬆整合到現有專案中，不需從頭來過。 

- **現有工具的痛點：** 許多工具如 `spec-kit` 或 `Kiro` 在處理**從零到一 (0→1) 的全新專案**時表現非常出色。 然而，當專案進入維護與迭代階段，需要持續更新和管理不斷演進的「規格文件」時，這些工具就顯得力不從心。它們的結構在追蹤「系統當前狀態」以及「即將發生的變更」時，往往不夠直觀。

- **清晰的檔案結構：** OpenSpec 透過簡單的雙資料夾結構，讓規格與變更的管理一目了然，有效地將「事實的根源」與「進行中的提案」分開：
    1.  `specs/` → **系統的當前狀態**：存放目前系統的規格，是團隊與 AI 的共同認知基礎。
    2.  `changes/` → **進行中的變更**：所有新的功能需求或修改都會在這裡以獨立的資料夾進行，包含提案、任務列表與規格草案。
    3.  `archive/` → **已完成的變更歷史**：所有已合併的變更都會被移至此處，成為一份「活文件」，記錄系統的演進歷程。

## Guide

- [GitHub - Fission-AI/OpenSpec](https://github.com/Fission-AI/OpenSpec)
- [開發者福音！用 AI 迭代現有專案？OpenSpec 讓 AI 按規範寫程式碼，零失誤！](https://www.youtube.com/watch?v=ANjiJQQIBo0)

一位開發者的使用心得分享，原作者也在評論區參與了討論，提供了更多有趣的見解。
- [I Found the Simplest AI Dev Tool Ever](https://www.youtube.com/watch?v=cQv3ocbsKHY)

## Workflow

這個流程確保了人類開發者與 AI 之間能夠進行順暢且可控的協作，在 AI 動手寫程式碼**之前**，就先對齊目標。

1.  **起草變更提案 (Draft Change Proposal)：** 開發者向 AI 提出一個新的功能需求或變更請求。
2.  **審查與對齊 (Review & Align)：** AI 會根據你的請求生成詳細的規格與任務列表。開發者此時可以審查、提出修改意見，AI 會再根據回饋更新，形成一個**反覆回饋的循環**，直到雙方對「要做什麼」與「如何做」達成共識。
3.  **執行任務 (Implement Tasks)：** AI 依據最終拍板定案的規格與任務列表，開始進行程式碼的編寫。
4.  **套用變更 (Apply the Change)：** 開發者審查 AI 生成的程式碼，確認無誤後，執行指令將程式碼合併到專案中。
5.  **封存與更新 (Archive & Update Specs)：** 變更完成後，該次的變更紀錄會被完整地「封存」到 `archive/` 資料夾，同時更新 `specs/` 中的主要規格文件，確保規格文件永遠處於最新狀態，為下一次的變更做好準備。