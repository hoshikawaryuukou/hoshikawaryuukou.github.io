---
draft: false
title: Software Design - Pattern - Data Transfer Object (DTO)
date: 2022-12-11T21:56:18+08:00
tags:
  - Software_Design
  - Pattern
---

## Quick Chat

DTO，即數據傳輸物件，是在系統各層（如 API 層與業務邏輯層）或不同服務之間傳遞資料的專用物件。它像一個純粹的「數據包裹」，只負責承載數據，不包含任何業務邏輯。

## Guide

- [Cutting Edge - Pros and Cons of Data Transfer Objects](https://learn.microsoft.com/en-us/archive/msdn-magazine/2009/august/pros-and-cons-of-data-transfer-objects)
- [The DTO (Data Transfer Object)](https://examples.javacodegeeks.com/the-dto-data-transfer-object/)
- [Data Transfer Objects](https://aspnetboilerplate.com/Pages/Documents/Data-Transfer-Objects)
- [Clean Architecture : why not using the entity as request model of the use case (interactor)](https://stackoverflow.com/questions/52812337/clean-architecture-why-not-using-the-entity-as-request-model-of-the-use-case)
- [Difference between Entity and DTO](https://stackoverflow.com/questions/39397147/difference-between-entity-and-dto)

## Advantages

1. **建立清晰邊界，降低耦合**：DTO 作為公開的數據契約，讓內部資料庫結構 (Entity) 可以自由修改，而不直接影響外部的客戶端或服務。
   
2. **精準控制數據，提升安全性與**：只暴露客戶端真正需要的欄位，避免洩漏如密碼雜湊、內部 ID 等敏感或不相關的實作細節。
   
3. **優化傳輸效率**：可以匯集多個來源的資料於一身，或只傳送部分欄位，以此減少網路請求次數與數據傳輸量。
   
4. **簡化序列化**：因為 DTO 是單純的數據容器，不含複雜的業務邏輯或循環引用，所以能輕易地被序列化為 JSON 或 XML 等格式，在網路上順利傳輸。

## Trade-off

需要額外定義 DTO 類別與轉換邏輯，增加了程式碼量。在極簡單的應用中可能顯得過度設計。

