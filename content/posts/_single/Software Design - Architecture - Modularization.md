---
draft: false
title: Software Design - Architecture - Modularization
date: 2023-02-22T20:00:00+08:00
tags:
  - Software_Design
  - Architecture
---

## Quick Chat

對於軟體模組化，我個人傾向採用漸進式的策略。不同的專案規模，從單一功能的小型專案到多功能的中型專案，各自有其適合的模組化方案。

在深入探討之前，強烈建議先參考以下連結中的圖表，這對於理解 Clean Architecture 的實際應用細節至關重要：
- CA 原著 Chapter 34 - The missing chapter - Actual implementation details of an architecture 
- [連結 34章摘要心得](https://github.com/serodriguez68/clean-architecture/blob/master/part-6-details.md#chapter-34---the-missing-chapter---actual-implementation-details-of-an-architecture)

## Guide

### Clean Architecture 模組化
- [Multiple ways of defining Clean Architecture layers](https://proandroiddev.com/multiple-ways-of-defining-clean-architecture-layers-bbb70afa5d4a)
- [Package by Component with Clean Modules in Java](https://blog.ttulka.com/package-by-component-with-clean-modules-in-java/)
- [Package by feature or component](https://learning-notes.mistermicheels.com/architecture-design/reference-architectures/package-by-feature-or-component/)

### 垂直切片架構 (Vertical Slice)
- [Restructuring to a Vertical Slice Architecture](https://codeopinion.com/restructuring-to-a-vertical-slice-architecture/?fbclid=IwAR0Ek5KW6_MWQ9K5Rxv6P5BpqatHs5tsjfHZ_B9GZmrkd3YaBoH-HHuNZE4)
- [Vertical Slice Architecture, not Layers!](https://www.youtube.com/watch?v=L2Wnq0ChAIA)

### 模組化單體架構 (Modular Monolith)
- [Modular Monolith architecture](https://www.kamilgrzybek.com/design/modular-monolith-primer/)

## Thinking

以下我將以一個新的 Unity 專案為例，說明我的模組化實踐過程。

### 階段一：專案初期的分層策略 (Package by Layer)

在專案初期，我會採用「依分層封裝 (Package by Layer)」的策略，將整個應用程式劃分為幾個核心模組：

- **Domain**：包含核心業務邏輯與規則。
- **Presentation**：處理使用者介面 (UI) 與互動邏輯。
- **App**：負責應用程式的特定使用案例 (Use Cases)。
- **Context**：負責依賴注入 (DI)。

它們之間的依賴關係如下：
- `App` 依賴 `Domain`。
- `App` 依賴 `Presentation`。
- `Context` 負責整合所有模組，並透過依賴注入 (DI) 來建構與串連物件。

對於功能單純的小型遊戲或應用程式，這樣的結構已基本足夠。

### 階段二：演進至垂直切片與功能整合

當應用程式規模擴大，需要處理多個複雜功能時，我會將架構從水平分層演進為「依功能封裝 (Package by Feature)」，也就是所謂的「垂直切片 (Vertical Slicing)」。

在這種策略下，每一個功能 (Feature) 本身就是一個可以獨立開發、測試與運作的完整模組。每個功能模組內部依然可以維持自己的分層結構（如 Domain, Presentation, App）。

隨著功能模組增加，自然會產生模組間的導航與通訊需求。為了解決這個問題，我會建立一個頂層的 `App` 模組來負責整合：

- **管理路由 (Routing)**：負責協調不同功能模組之間的跳轉與資料傳遞。
- **整合功能 (Integration)**：作為應用程式的進入點，並依賴所有需要被整合的功能模組。

這個階段將「功能開發」與「功能整合」明確分離，讓架構能夠隨著專案的複雜度一同成長，兼顧了初期的開發效率與後期的可維護性。 



