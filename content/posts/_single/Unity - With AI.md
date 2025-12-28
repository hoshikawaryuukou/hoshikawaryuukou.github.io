---
draft: false
title: Unity - With AI
date: 2025-11-09T11:10:37+08:00
tags:
  - AI
  - AI_Coding
  - Unity
---

## Quick Chat

與前端領域相比，將 AI 直接整合至 Unity 開發流程中尚未有標準化的作法。本文旨在彙整社群中針對此議題的幾種導入方法與實踐經驗。

## MCP

Model Context Protocol (MCP) 是一種讓 AI 模型能夠與外部工具（如 Unity 編輯器）互動的協定。以下是一些社群開發的 MCP 伺服器實作：

- [GitHub - CoplayDev/unity-mcp: An MCP server that allows MCP clients like Claude Desktop or Cursor to perform actions in the Unity Editor](https://github.com/CoplayDev/unity-mcp)
- [GitHub - hatayama/uLoopMCP: uLoopMCP enables AI to autonomously compile, test, debug, and manipulate Unity projects. It bridges Unity Editor with AI coding assistants (Claude Code, Cursor, GitHub Copilot, Windsurf) using Model Context Protocol.](https://github.com/hatayama/uLoopMCP)
- [GitHub - Arodoid/UnityMCP](https://github.com/Arodoid/UnityMCP)

## Session

### Unity AI完全に理解した 勉強会

- **活動影片：** [Unity AI完全に理解した 勉強会 - YouTube](https://www.youtube.com/watch?v=Zx0Y3wHkLBE)

#### Unity Sentis 官方範例的黑白棋 AI 介紹

- **正名**：Unity Sentis 現已更名為 **Inference Engine**。
- **核心功能**：Sentis 是 Unity 設計的神經網路推理庫，能夠讓 AI 模型**在終端裝置上以高效率、低記憶體消耗的方式運行**。
- **獨特優勢**：訓練完成的 AI 模型會被封裝成一個標準的 Unity「資產（Asset）」。這代表 AI 邏輯可以像圖片或音檔一樣被動態替換。開發者能夠**在不需重新提交 App Store 審查的情況下更新 AI**，大幅提升了迭代的靈活性。
- **案例分析**：議程中以官方的黑白棋（Reversi）AI 範例，展示了 Sentis 的實際應用。

#### Unity x Groq x MR裝置 遊戲開發中的語音輸入利用

- **服務介紹**：Groq 是一個提供 LLM 模型的雲端平台，其服務包含聊天（Chat）、文字轉語音（TextToSpeech）與語音轉文字（SpeechToText）。
- **提示工程**：透過精確的提示工程（Prompt Engineering），可以讓 AI 的輸出結果更貼近遊戲邏輯的需求。
    - **範例提示**：`「請將輸入的音訊轉為文字。你是 NPC，請根據文字內容，從指令列表 [Reply, GoAway, Sleep, Smile] 中選擇一個指令，並以 CSV 格式回傳。」`
- **效能體驗**：Groq 的高效能與極低延遲提供了流暢的互動體驗，為遊戲互動設計帶來了新的可能性。

#### 使用 Agent Client Protocol 的 AI 代理編輯器整合實踐

- **核心觀點**：講者認為，在 Unity 編輯器中整合 AI 的真正潛力，並非僅是輔助編寫程式碼（這在 VS Code 等外部編輯器中已相當成熟），而應是**利用 AI 對整個專案進行深度分析**。目標是將整個專案作為 AI 的上下文（Context），讓開發者能以自然語言查詢專案內容，如同為專案建立一個「DeepWiki」。
- **UnityAgentClient**：
    - **功能**：這是一款 Unity 編輯器擴充，允許在編輯器內部執行**任意**的 AI 代理。
    - **後端支援**：具備高度靈活性，可對接 Gemini CLI、Claude Code、Codex CLI 等多種不同的 AI 代理作為後端。
    - **編輯器互動**：透過內建的 MCP（Message Channel Protocol）伺服器，AI 代理能夠獲取編輯器內的即時資訊並執行相對應的操作。

---

### 開発現場で試行錯誤した、Unityでのゲーム開発におけるAIエージェント活用術

- **活動影片：** [開発現場で試行錯誤した、Unityでのゲーム開発におけるAIエージェント活用術 - YouTube](https://www.youtube.com/watch?v=-KOuHJMIZW0)
- **相關資源：**
    - [GitHub - rarudo/UnityAIAgentWorkflowSample](https://github.com/rarudo/UnityAIAgentWorkflowSample)
    - [GitHub - Unity-Technologies/UnityCsReference](https://github.com/Unity-Technologies/UnityCsReference)

AI 在遊戲產業的應用正迅速發展，涵蓋自動填寫 Bug 單、推算台詞與動作、利用影像與聲音進行自動化測試、自動生成規格書等領域。

講者分享，當他嘗試讓 AI 生成一個簡單的 Web 小遊戲時，AI 能迅速產出可運作的 HTML 與 JavaScript。然而，當他用相同的指令要求 AI 製作 Unity 版的打磚塊遊戲時，結果卻是徹底失敗。

**Unity 開發的複雜性：**

1.  **資產管理**：圖片、音效、3D 模型之間存在複雜的依賴關係。
2.  **Prefab 製作**：無法單純生成文本檔案，必須透過 Unity API 進行操作。
3.  **場景建構**：涉及 3D 空間配置，AI 難以僅憑文本理解與操作。
4.  **序列化**：Unity 使用獨特的 YAML 格式，對標準 LLM 而言難以處理。
5.  **函式庫**：需要深刻理解各種函式庫（如 UI Toolkit、UniTask）的用法。

講者提出了幾個讓 AI Agent 在 Unity 中有效運作的關鍵策略：

1.  **善用 UnityCsReference 作為知識庫**
    - `UnityCsReference` 是 Unity 官方公開的 C# 原始碼儲存庫。
    - 將此儲存庫以 **Git Submodule** 形式加入專案中，AI Agent 就能在本地直接存取完整的 Unity 原始碼，並將其作為核心知識庫（Context）。
    - 在執行任務的「調查」階段，AI Agent 能**直接讀取原始碼檔案**，以確認 API 是否存在、參數為何，以及 Unity 內部的實際用法。這能有效避免 AI「幻想」出不存在的 API 或用錯誤的方式呼叫 API。

2.  **縮小任務範圍，務實應用**
    - AI 的**回應速度**是目前的一大瓶頸。即使能提供大量資料，若生成一份規格書需要等待 30 分鐘，在實務上並不可行。
    - 與其讓 AI 從零開始建構大型複雜系統，不如專注於**較小且獨立的任務**。
    - **具體範例**：一個極佳的應用場景是製作 **Unity 編輯器擴充功能**。這類工作通常是獨立的，不太需要龐大的專案上下文，非常適合讓 AI 完成「從 0 到 1」的初始開發，大幅節省開發者時間。

3.  **動態擴展上下文（Context）**
    - 講者正在嘗試使用 **Roslyn Analyzer**（C# 編譯器平台）來解析專案程式碼，讓 AI 能夠理解類別之間的**依賴關係**與**參照**，從而提供更精確、更具相關性的上下文。

4.  **總結：人機協作**
    - 現階段最實際的作法並非「將工作完全交給 AI」，而是利用 AI 來處理**初始草稿**或**部分較困難的邏輯**，再由人類開發者接手進行審查、修改與整合，達到人機協作的最佳效益。