---
draft: false
title: Unity - Package - Web Stripping Tool
date: 2025-08-15T12:46:15+08:00
tags:
  - Unity
---

## Quick Chat

> 透過移除未使用的 **子模組（Submodules）**，你可以在不刪除整個功能套件的情況下，有效縮減遊戲的最終建置大小。

這款套件可說是 **Unity 6** 推出至今，我個人認為最有價值的工具之一。然而，它卻只在 **Unity Korea** 的 YouTube 頻道上發布介紹，而且幾乎沒有任何宣傳，這點實在令人費解 😂。

⚠️ 詳細的具體操作步驟，請務必參考官方文件與影片說明。此處僅列出幾個關鍵要點。

## Guide

- [Web Stripping Tool package | Web Stripping Tool | 1.1.0](https://docs.unity3d.com/Packages/com.unity.web.stripping-tool@1.1/manual/index.html)
- [[꼬꼬유] Web Stripping 툴 패키지를 활용한 빌드 크기 및 로드 시간 최적화](https://www.youtube.com/watch?v=p2n7BStUazw)
- [Unity Web Stripping Tool - 초보자용 정리 가이드](https://j2su0218.tistory.com/1706)

## Notice

1. 適用於 Unity 6.1 及以上版本。
2. 用於移除 Submodules 而不是整個 Modules。 若使用 2D Rendering 但未使用到 2D Rendering Sorting，則可以僅刪除指定子模組。
3. 剝離過程是在遊戲完成初步建構後進行的，屬於建構管線的 **後處理** 步驟。
4. 建議將設置文件納入版本控制。
5. 該工具將持續改進，並計劃支持更多子模組。

## Workflow

1. **安裝與設置**：
	- 在 Unity 的 Package Manager 中安裝該工具。
	- 啟用「子模組剝離相容性」選項，並設置調試符號為外部。

2. **剖析（Profiling）**：
	- 進行初次建構並運行遊戲，完整測試遊戲的所有功能。
	- 生成 JSON 格式的剖析報告，列出未使用的子模組。

3. **子模組剝離**：
	- 將剖析數據導入工具，選擇需要剝離的子模組。
	- 執行剝離後，生成完整的報告，包括文件變更對比和剝離的子模組清單。

4. **驗證與調整**：
	- 測試遊戲是否正常運行，若發現錯誤，調整剝離清單。

5. **整合到建構流程**：
	- 可啟用「建構後自動剝離」選項，或使用剝離 API 進一步整合至自定義建構流程。

## Workflow（Practice）

1. 先 Build 一個 Dev 環境的版本 
	- 不必做最佳化輸出，以快速輸出為目標。
	- 這個版本指示是為了用來測試有什麼 **子模組**  可以被剝離。
	- 使用這個版本導出可剝離的子模組清單。

2. 我會將壓縮算法的子模組重新納入
	- 約 0.1 MB 還可以接受。
	- 壓縮算法到導出的階段都可能在調整。
	- 如果真的要保持極限乾淨的包體，之後應該會寫 BuildPipeline。 

	 ![Exempted Compression Algorithm](/images/blog/Unity%20-%20Package%20-%20Web%20Stripping%20Tool-1756364223758.png)

3. 輸出 Release 版本 
	- 於 Submodules Stripping 面板勾選 Strip Automatically After Build 
