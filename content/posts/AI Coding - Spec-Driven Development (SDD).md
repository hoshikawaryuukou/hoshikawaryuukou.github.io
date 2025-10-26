---
draft: false
title: AI Coding - Spec-Driven Development (SDD)
date: 2025-10-24T11:41:40+08:00
tags:
  - AI
  - AI_Coding
  - Specification-Driven_Development
---

## Quick Chat

首先，**規格驅動開發（SDD）並非在 AI 程式碼生成技術出現後才被提出**，它是一個早已存在的概念。

然而，在當前環境下，SDD 重新受到關注：

1. **成本驟降**：AI 的輔助極大地降低了編寫高品質規格文件的成本和時間。
2. **解決困境**：業界普遍遭遇「Vibe Coding」（憑感覺、缺乏規範的開發）所帶來的維護性和協作性困境。
3. **回歸檯面**：市場開始追求更嚴謹、更有規範的寫作方式，使規格驅動開發重新成為主流討論。

我首次被這個概念震撼，是在 **Kiro IDE** 的演示中。儘管 Kiro 以搶先體驗（Early Access）方式開放，許多開發者無法接觸（需要邀請碼），但這反而間接促成了開源社群的迅速響應。如今，相關工具如雨後春筍般出現，**Kiro 似乎已丟失了先發優勢**。😂

## Guide

⚠️ 建議讀者著重理解這些資源所闡述的**核心設計思路**，而非具體的技術實現，因為相關的工具與生態系統正在快速變化。

* [spec-kit/spec-driven.md at main · github/spec-kit · GitHub](https://github.com/github/spec-kit/blob/main/spec-driven.md)
* [Spec-driven development: Using Markdown as a programming language when building with AI - The GitHub Blog](https://github.blog/ai-and-ml/generative-ai/spec-driven-development-using-markdown-as-a-programming-language-when-building-with-ai/)
* [Understanding Spec-Driven-Development: Kiro, spec-kit, and Tessl](https://martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html)

## Concept

SDD 的核心在於**顛覆軟體開發的傳統權力結構**，並將 **規格說明書（Specification）** 提升為開發過程的 **核心真理來源 (Source of Truth)**。

1. **權力翻轉**：規格說明書不再是服務程式碼的附屬文件，而是**程式碼必須服務規格說明書**。
2. **真理來源**：產品需求文件（PRD）不再僅是實作的**指南**，而是**生成實作的源頭**。技術規格成為精確的定義，可以直接**驅動程式碼的生成**。
3. **消除鴻溝**：SDD 透過使規格說明及其具體的實作計畫**可執行化 (Executable)**，從而**消除了規格說明與實際程式碼之間的鴻溝**。當規格說明直接生成程式碼時，這不再是手動實作，而是一個**純粹的轉化 (Transformation) 過程**。

## Thinking

在採用 SDD 之前，我們需要先自問：**你是否希望在一個完全由 AI 主導的結構中工作，每次迭代都只透過修改文件來完成？**

如果是**實驗性或原型項目**，這種模式是完全可行的。

然而，在複雜的專案中：

* **PRD 的局限性**：PRD 通常定義產品目標、受眾和成功標準，但其範圍過於寬泛。如果直接交由 AI 進行整體規劃，由於缺乏「如何實踐」的規範，結果往往不盡理想。
* **我更傾向於將 AI 參與度集中在 Feature 層面。**

我的理想合作模式是：

1. **架構設計**：大型架構與核心技術選型傾向於由人類主導設計。
2. **上下文感知**：確保 AI 了解我當前開發的整體狀況和慣例。
3. **協作規格**：我向 AI 闡述意圖，並與其討論 Feature 設計，共同產出嚴謹的規格文件。
4. **流程實施**：規格文件 → 產生細項任務 → 實作程式碼。
5. **文件精煉**：完成實作後，我會將規格文件進行**精煉**，而不是原封不動地保留。將其轉化為更高層級、更易於維護的**交接文件**。
6. **夥伴定位**：我預設將 AI 視為**一次性的、高效的合作夥伴**（這也符合大型語言模型 (LLM) 的隨機性的特性）。
7. **認知負荷管理**：交接文件不宜過於簡單或複雜。我認為**認知負荷**是關鍵考量——文件應保留核心設計思路、使用說明和注意事項，以便後續協作夥伴或未來的自己能快速上手。