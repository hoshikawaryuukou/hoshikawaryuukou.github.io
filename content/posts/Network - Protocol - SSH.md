---
title: "Network - Protocol - SSH"
date: 2025-02-02 20:20:00
draft: false

tags: ["Network"]
---

## Quick Chat
SSH（Secure Shell）是一種加密的網路協議，允許你安全地連接到遠端伺服器。對 Git 來說，使用 SSH 主要有這些優勢：

- **免密碼認證**：使用 SSH 金鑰（SSH Keys）後，不需要每次都輸入帳號密碼。
- **更安全**：SSH 使用非對稱加密，比 HTTPS（帳號 + 密碼）更安全。
- **更適合自動化**：如果你要寫腳本來自動處理 Git 操作，SSH 會比 HTTPS 更方便。

## Env - Windows
⚠️ 以下皆使用 PowerShell 操作

### Step 1: 檢查 Windows 是否已安裝 OpenSSH
Windows 10 以上的系統已經內建 OpenSSH
```bash
ssh -V
```

如果有顯示類似這樣的版本資訊，代表 OpenSSH 已經安裝：
```
OpenSSH_for_Windows_8.1p1, LibreSSL 3.0.2
```

### Step 2: 產生 SSH 金鑰
```ps1
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
```
- `t rsa`：使用 RSA 演算法（GitHub 推薦）
- `b 4096`：密鑰長度 4096 bits（更安全）
- `C "your-email@example.com"`：加上你的 Email 作為標註

### Step 3: 儲存金鑰
執行指令後，系統會詢問你要存在哪裡：
```
Enter file in which to save the key (/c/Users/YourName/.ssh/id_rsa): # 直接按 Enter
```

然後，系統會問你是否要設定密碼（passphrase），如果你希望 SSH Key 更安全，可以輸入密碼，否則直接按 Enter。

### Step 4: 將公鑰新增到 Git 服務
SSH 金鑰有兩個檔案：
- 私鑰（id_rsa）：**不要洩漏**，這是你本機的登入金鑰。
- 公鑰（id_rsa.pub）：可以分享，這是給遠端伺服器認證的金鑰。

檢視公鑰
```ps1
Get-Content $env:USERPROFILE\.ssh\id_rsa.pub
```

填入 GitHub
> Settings > SSH and GPG keys（GitHub）

### Step 5: 測試 SSH 連線
```bash
ssh -T git@github.com
```

如果成功，你會看到
```
Hi your-username! You've successfully authenticated, but GitHub does not provide shell access.
```
