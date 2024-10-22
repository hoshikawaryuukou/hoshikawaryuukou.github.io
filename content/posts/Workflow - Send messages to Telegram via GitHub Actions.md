---
title: "Workflow - Send messages to Telegram via GitHub Actions"
date: 2024-10-19 19:11:00
draft: true

tags: ["Workflow", "git", "Github", "Telegram"]
---

## Quick Chat
以下範例為 :
> 在 git push 後透過 Github Actions 將 tag + commit 訊息發送到指定的 Telegram 群組

## 設置 Telegram Bot
- 在 Telegram 中搜尋 @BotFather 並建立一個新的 bot，記下 API token。
- 將 bot 加入群組並發送訊息給 bot
- 使用 `https://api.telegram.org/bot<YourBotToken>/getUpdates` 來獲取群組 ID。

## 設置 GitHub Secrets
GitHub 專案中
> Settings -> Security -> Secrets and variables -> Actions -> Repository secrets

新增以下 secrets : 
- TELEGRAM_BOT_TOKEN : Telegram Bot Token
- TELEGRAM_CHAT_ID : Telegram 群組 ID

## 設置 GitHub Variables
GitHub 專案中
> Settings -> Security -> Secrets and variables -> Actions -> Repository variables

新增以下 variables : 
- TELEGRAM_TAG : 格式為 #Word，多個 tags 用空白分割

## 建立 GitHub Actions Workflow

### .github/workflows/telegram-notify.yml
```yml
name: Notify Telegram on Push

on:
  workflow_dispatch:
  push:
    branches:
      - main

jobs:
  notify:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        with:
          # Fetch only the last commit
          fetch-depth: 1

      - name: Get latest commit message
        id: get_commit
        # Run a shell command to get the latest commit message and set it as an output
        run: echo "::set-output name=message::$(git log -1 --pretty=%B)"

      - name: Send notification to Telegram
        env:
          LAST_COMMIT: ${{ steps.get_commit.outputs.message }}
          TELEGRAM_TOKEN: ${{ secrets.TELEGRAM_TOKEN }}
          TELEGRAM_CHAT_ID: ${{ secrets.TELEGRAM_CHAT_ID }}
          TELEGRAM_TAG: ${{ vars.TELEGRAM_TAG }}
        run: |
          TELEGRAM_MESSAGE="$TELEGRAM_TAG%0A$LAST_COMMIT"
          curl -s -X POST https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage \
            -d chat_id=$TELEGRAM_CHAT_ID \
            -d text="$TELEGRAM_MESSAGE"

```
