---
title: "Workflow - Create a template for full-stack monorepo"
date: 2024-10-11 09:13:00
draft: false

tags: ["Workflow", "Template"]
---

## Structure

```bash
project-root/              
├── pnpm-workspace.yaml    
├── scripts/
├── apps/ 
|   ├── cli/ 
|   ├── web/ (vue)
|   └── desktop/ (electron)
└── packages/              
    ├── pkg01/             
    └── pkg02/            
```

### scripts
- 全域工作區命令。

### apps
- 每個子資料夾代表一個最終的應用場景(終端)。

### packages
- 專注於封裝和共享具體的功能模組，為各個終端應用提供支援。
