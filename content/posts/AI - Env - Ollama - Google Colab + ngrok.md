---
title: "AI - Env - Ollama - Google Colab + ngrok"
date: 2025-01-16 21:11:00
draft: false

tags: ["AI", "Ollama", "Google Colab", "ngrok"]
---

## Quick Chat

參考以下教學
- [十分钟部署本地离线免费大模型！](https://www.youtube.com/watch?v=ZOCY61424JI)
- [Ngrok + Ollama | 在世界任何地方与localhost开源大模型聊天](https://www.youtube.com/watch?v=JfI3K3HwQuI)
- [Free Inference Is All I Need: How to Run Large Language Models for Free Using Google Colab](https://blog.gopenai.com/free-inference-is-all-i-need-how-to-run-large-language-models-for-free-using-google-colab-fe961e86503b)


## Requirements
- 註冊 [ngrok](https://ngrok.com/) 帳號，取得 token ( ngrok > Your Authtoken )
- 將 token 填至 colab > Secret
    - name : NGROK_AUTH
    - value : token
- 本機端使用 [Page Assist - A Web UI for Local AI Models](https://chromewebstore.google.com/detail/page-assist-a-web-ui-for/jfgfiigpkhlkbnfnbobbkinehhfdhndo) 與 Ollama 互動

## Steps

### 安裝必要工具
```bash
!sudo apt-get install -y pciutils
!curl https://ollama.ai/install.sh | sh
!pip install pyngrok
```

- **安裝 pciutils**: 提供硬件檢測和配置工具，用於檢查和診斷 GPU 設置。
- **安裝 Ollama**: 下載並執行 Ollama 的安裝腳本。
- **安裝 pyngrok**: 用於創建到本地服務的反向代理，從而將本地服務器公開到互聯網。

### 啟動 Ollama 服務器
```py
import os
import threading
import subprocess
import requests
from pyngrok import ngrok, conf
from google.colab import userdata

def ollama():
    os.environ['OLLAMA_HOST'] = '0.0.0.0:11434'
    os.environ['OLLAMA_ORIGINS'] = '*'
    os.environ['OLLAMA_KEEP_ALIVE'] = '-1'
    subprocess.Popen(["ollama", "serve"])

ollama_thread = threading.Thread(target=ollama)
ollama_thread.start()
```

- **配置環境變量**：
  - OLLAMA_HOST: 指定服務器的主機和端口，這裡為 0.0.0.0:11434，表示本地所有網絡接口。
  - OLLAMA_ORIGINS: 設置跨域資源共享 (CORS) 的允許範圍。
  - OLLAMA_KEEP_ALIVE: 保持服務器活躍的時長（-1 表示無限）。
- **啟動 Ollama 服務器**：使用 subprocess 啟動 Ollama 的服務模式。
- **使用執行緒運行服務器**：確保主程序不被阻塞，允許服務器在後台運行。

### 下載模型
- [Ollama search](https://ollama.com/search)
```bash
!ollama pull {model_name}
```

### 公開服務
```py
conf.get_default().auth_token = userdata.get('NGROK_AUTH')
ollama_tunnel = ngrok.connect("11434", "http")
public_url = ollama_tunnel.public_url
print(f"Public URL: {public_url}")
```

- **配置 ngrok 驗證令牌**：使用用戶提供的 NGROK_AUTH 確保 Tunnel 服務的授權。
- **創建 ngrok Tunnel**： 將本地服務器（11434 端口）通過 HTTP 隧道公開到互聯網。
- **獲取公開 URL**： 輸出 Tunnel 的公開 URL，便於遠程訪問 Ollama 服務。


### 列出可用模型
```bash
!ollama list
```

### 執行模型
```bash
!ollama run {model_name}
```

### 透過 Page Assist 訪問
- 於 Page Assist 設置 public_url 
- 訪問 public_url 並點擊 visit site，否則 Page Assist 偵測不到遠端 ollama
