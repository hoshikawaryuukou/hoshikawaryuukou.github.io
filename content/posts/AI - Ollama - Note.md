---
title: "AI - Ollama - Note"
date: 2024-08-19 21:11:00
draft: false

tags: ["AI", "Ollama"]
---

## Guide
- [Ollama](https://ollama.com/)

## UI
- [Page Assist - A Web UI for Local AI Models](https://chromewebstore.google.com/detail/page-assist-a-web-ui-for/jfgfiigpkhlkbnfnbobbkinehhfdhndo)

## Commands
- ollama list : 查看以配置本地模型
- ollama run {model} : 下載/執行模型
- ollama ps : 展示目前載入的模型、它們所佔的記憶體大小以及所使用的處理器類型（GPU 或 CPU）


## Use model from Ollama
- [Ollama search](https://ollama.com/search)


## Use GGUF model from Hugging Face Hub

```bash
# Run Ollama with specified model
# ollama run hf.co/{username}/{repository}
ollama run hf.co/bartowski/Llama-3.2-3B-Instruct-GGUF

# Run Ollama with specified model and desired quantization
# ollama run hf.co/{username}/{repository}:{quantization}
ollama run hf.co/bartowski/Llama-3.2-3B-Instruct-GGUF:IQ3_M
```

## Use GGUF model from local

### import_gguf_to_ollama.bat
```bat
@echo off

REM 設定本地環境，並切換到批次檔所在的目錄
setlocal
cd /d %~dp0

REM 搜尋當前目錄中的 .gguf 檔案
for %%f in (*.gguf) do (
    REM 創建 Modelfile.txt 並寫入模型檔案名稱
    echo FROM %%~nf.gguf > Modelfile.txt
    
    REM 打印 Modelfile.txt 的內容以供確認
    type Modelfile.txt
    
    REM 執行 ollama create 命令來包裝模型檔
    ollama create %%~nf -f Modelfile.txt
    
    REM 刪除 Modelfile.txt
    del Modelfile.txt
    
    REM 如果有多個 gguf 檔案，只處理第一個找到的檔案
    goto end
)

:end
REM 顯示完成訊息
echo done...

REM 列出已經存在的模型
ollama list 

REM 等待用戶確認並關閉
pause >nul
```
