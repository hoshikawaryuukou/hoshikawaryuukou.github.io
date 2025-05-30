---
title: "AI - Common - Note"
date: 2025-03-26 13:11:00
draft: false

tags: ["AI", "LLM"]
---

## Artificial General Intelligence（AGI）

簡單來說，AGI（通用人工智慧）就像是一個能夠像人類一樣思考和學習的 AI。現在的 AI 通常只能做特定的事情，比如語音助理能聽懂指令、圖像辨識能認臉，但它們無法舉一反三或解決各種不同的問題。

AGI 則不同，它能夠適應各種情境、學習新知識、自己思考並解決問題，就像一個真正有智慧的人。這也是人工智慧發展的終極目標——打造一個可以自由學習、理解世界的「超級 AI」。

## Edge Computing

簡單來說，**邊緣運算**就是讓資料的處理工作**盡量靠近資料來源**，而不是全部送到遠端的伺服器（雲端）去計算。  

舉個例子，如果你在用自駕車，車子上的感測器會即時收集路況資訊。如果這些資料都要先傳到雲端再回來，可能會有延遲，影響安全。但如果車子本身就能**即時處理**這些資料，那麼它可以**更快做出決策**，避免危險。  

這種技術不只適合自駕車，也廣泛應用在**智慧工廠、AR/VR、智慧家庭**等需要即時反應的領域，因為它可以**減少延遲、降低網路負擔，並提升運算效率**。

## Retrieval-Augmented Generation（RAG）

簡單來說，**RAG 就是讓 AI 會「先查資料再回答」**，而不是單靠自己記住的知識來作答。  

一般的 AI 模型只能根據訓練時學到的內容回答問題，這可能會導致資訊過時或不夠準確。但 RAG 的特點是，它會**先去找最新或相關的資料**，然後再根據這些資訊來產生回應。  

想像一下，你問 AI：「最近的 AI 技術發展如何？」一般的 AI 可能只會回答它訓練時學到的內容，但 RAG 會**先查找最新的研究或新聞**，再提供更準確的答案。這讓它特別適合**問答系統、企業內部知識搜尋、技術支援**等需要**即時、可靠資訊**的應用。

## Multimodal

簡單來說，多模態 AI 就是讓人工智慧能夠同時理解和處理多種形式的資料，例如文字、圖片、聲音和影片等。​

傳統的 AI 模型通常只專注於單一類型的資料，例如僅處理文字或圖像。​但多模態 AI 能夠整合不同形式的資訊，使其對世界的理解更加全面，並能執行更複雜的任務。

### Natively Multimodal（原生多模態）

所謂「原生」是指模型從一開始就是為多模態設計，並非後期再整合進去，因此能更自然、有效率地跨模態理解與生成資訊。  

- **Gemini 2.0 Flash**
  - [用嘴 P 圖的這一天真的來了！超強多模態 Gemini AI 讓一票設計師默默把繪圖板拿起來邊啃邊思考人生 ~](https://www.youtube.com/watch?v=w0-L2kl_3cU)
- **GPT 4o 原生多模態圖片生成**
  - [OpenAI重大更新，降维打击，自然语言绘图功能修改图片功能跨代提升，真正的多模态，从此人人都是设计师](https://www.bilibili.com/video/BV1yZZMYEEQ4)

### 為圖像生成帶來更穩定/可控的輸出
- 角色一致性
- 文字渲染能力
- 支援多輪對話調整迭代創作(明確指示修改)
- 基於參考圖二次創作(風格遷移)

## Model Context Protocol（MCP）

模型上下文協議（Model Context Protocol，MCP）由 Anthropic 提出，是一種開放標準，用來規範 AI 模型與外部工具、資料來源的互動方式。

傳統上，開發者每次整合新工具或數據源都要寫專屬程式碼，導致開發與維護成本高。MCP 則像是 AI 的「萬用轉接頭」，透過統一規範，讓 AI 無縫存取 API、資料庫與應用程式，大幅提升開發效率與靈活性。

### 🔗 延伸參考與應用案例
- [Cursor + MCP + Blender = 人人都能 3D 建模？](https://www.youtube.com/watch?v=RjOMs1AyW1w)  
- [AI 直接操作電腦建模！MCP 這個詞今年一定要知道！【Blender-MCP 安裝教學】](https://www.youtube.com/watch?v=GEOxJFacPkM)  
- [GitHub: justinpbarnett/unity-mcp](https://github.com/justinpbarnett/unity-mcp)

