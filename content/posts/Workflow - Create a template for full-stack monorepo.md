---
title: "Workflow - Create a template for full-stack monorepo"
date: 2024-10-11 09:13:00
draft: false

tags: ["Workflow", "Template"]
---

```bash
project-root/              
├── pnpm-workspace.yaml    
├── apps/ 
|   ├── cli/ 
|   ├── web/ 
|   └── desktop/ 
└── packages/              
    ├── pkg01/             
    └── pkg02/            

```

apps 視為終端，因為每個子資料夾代表一個最終的應用場景，無論是命令行、網頁還是桌面應用，這些都作為最終產品或服務的輸出點。

packages 使它們更專注於封裝和共享具體的功能模組，為各個終端應用提供支援。