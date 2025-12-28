---
draft: false
title: Workflow – Clean Up Old GitHub Deployments
date: 2024-11-13T20:31:00+08:00
tags:
  - Workflow
  - GitHub
  - PowerShell
---

## Quick Chat

透過 GitHub CLI (**`gh`**) 刪除一個儲存庫中**最舊的部署（deployment）記錄**，保留最新的 10 筆。

## Operation

### 登入

```bash
gh auth login
```

### Clean-Up-Old-GitHub-Deployments.ps1

1. 取得指定儲存庫的所有部署記錄 ID。
2. 跳過最新的 10 個 ID。
3. 對剩下的（最舊的）每一個 ID：
    
    - 顯示一條刪除提示訊息。
    - 發送一個 `DELETE` API 請求，將其從 GitHub 移除。

```ps1
$Owner = "Owner Name"
$Repo = "Repo Name"

gh api repos/$Owner/$Repo/deployments --paginate --jq '.[].id' | Select-Object -Skip 10 | ForEach-Object {
    Write-Host "Deleting deployment $_"
    gh api --method DELETE repos/$Owner/$Repo/deployments/$_
}
```

這段程式碼可以拆解為幾個部分來理解：

1. `$Owner` 和 `$Repo` 是 PowerShell 的**變數**，用來存放你的 GitHub 儲存庫的擁有者和名稱。
   
2. `gh api repos/$Owner/$Repo/deployments --paginate --jq '.[].id'`
    
    - `$Owner` 和 `$Repo` 會被替換成你設定的值。
    - 這段指令會透過 GitHub CLI 取得你指定儲存庫的所有部署記錄，並只列出它們的 ID。
        
3. `| Select-Object -Skip 10`
    
    - 這段指令會**跳過**清單中**最前面的 10 個 ID**。
    - 因為 GitHub API 預設是把最新的記錄放在最前面，所以這個步驟等於是保留了最新的 10 筆部署，並選取了剩下的、最舊的部署。
        
4. `| ForEach-Object { ... }`
    
    - 對每一個被選中的舊部署 ID，執行大括號 `{}` 裡面的指令。
        
5. `Write-Host "Deleting deployment $_"`
    
    - 顯示一條提示訊息，讓你知道目前正在刪除哪一個部署。
        
6. `gh api --method DELETE repos/$Owner/$Repo/deployments/$_`
    
    - 這行指令會發送一個 `DELETE` 請求，把這個舊的部署從 GitHub 上**永久刪除**。