---
draft: false
title: Unity - Project Structure
date: 2025-03-18T12:56:18+08:00
tags:
  - Unity
---

## Guide  
- [Organizing Your Unity Project — Content vs Feature Folders](https://www.youtube.com/watch?v=o8HIGKObG1Q)  
- [Organizing Project Folder Structure: Function-Based vs Feature-Based](https://medium.com/@ikonija.bogojevic/organizing-project-folder-structure-function-based-vs-feature-based-168596b6d169)  

## Content-Based（依內容分類）

### 特點  

- 以「資源類型」來劃分資料夾，例如腳本、材質、模型等。

### 缺點  

- 同一個功能可能分散在多個資料夾中。  
  例如你想找「商店系統」的 prefab、script 和 UI，可能得在三、四個資料夾中翻找。

### 範例  

```
Assets/
├── Materials/
├── Models/
├── Textures/
├── Scripts/
├── Animations/
├── Prefabs/
├── Audio/
```

## Feature-Based（依功能分類）

### 特點  

- 以功能模組為單位集中管理相關資源。  
- 適合模組化開發，有助於封裝、重用與搬移。  
- 找特定功能時，所有相關資源都集中在一起，不需東找西找。

### 缺點  

- 相同類型的資源（例如所有動畫或音效）會分散各處，不利統一管理。  
  （不過透過 Editor 的搜尋功能，其實影響不大。）  
- 若模組間耦合度高，可能導致功能邊界模糊。

### 範例  
```
Assets/
├── Shop/
│   ├── Scripts/
│   ├── Prefabs/
│   ├── UI/
├── Player/
│   ├── Scripts/
│   ├── Animations/
│   ├── Prefabs/
├── Inventory/
│   ├── Scripts/
│   ├── UI/
```

## Hybrid（混合式）

### 特點  

- 以 Feature-Based 為主體。  
- 共用資源集中放置於 Common 或 Shared 資料夾中，避免重複。

### 範例  
```
Assets/
├── Common/
│   ├── Materials/
│   ├── Fonts/
│   ├── Audio/
├── Player/
│   ├── Scripts/
│   ├── Prefabs/
├── Shop/
│   ├── Scripts/
│   ├── UI/
```

## 實踐建議  

- 小型專案或原型（Prototype）建議先採用 Content-Based 結構，快速上手。  
- 專案逐漸擴大後，可以逐步轉向 Feature-Based，以利管理與維護。
