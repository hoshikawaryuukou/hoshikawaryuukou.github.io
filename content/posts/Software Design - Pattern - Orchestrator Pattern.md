---
draft: false
title: Software Design - Pattern - Orchestrator Pattern
date: 2025-07-18T10:00:00+08:00
tags:
  - Software_Design
  - Pattern
---

## Quick Chat

> 協調者模式，主要用於管理多個獨立服務或元件之間錯綜複雜的互動。

其核心理念是在系統中引入一個專責的「協調者」（Orchestrator）或「控制器」（Controller）元件，作為整體業務流程的指揮者。

協調者本身並不執行具體的業務邏輯，而是像導演一樣，負責調度各個「參與者」（Participants）或「服務」（Services）來完成任務。每個參與者專注於自己擅長的部分（例如資料查詢、驗證、計算等），執行完後將結果回傳給協調者。

協調者則根據這些結果，決定後續該呼叫哪個參與者、是否中斷流程，或如何彙整輸出，以推進整體流程邏輯。如此一來，流程控制與業務邏輯得以明確分離，讓系統更具彈性與可維護性。

## Examples

```js
class BaseGame {
  play() {
    console.log("Playing base game...");
    const result = this.spin();
    return result;
  }

  spin() {
    return {
      symbols: ["Free", "Free", "Free"],
      freeSpinCount: 3,
      win: 100,
    };
  }
}

class FreeGame {
  play() {
    console.log("Playing free game...");
    return {
      win: 200,
      spins: 6,
    };
  }
}

class GameFlowController {
  constructor() {
    this.baseGame = new BaseGame();
    this.freeGame = new FreeGame();
  }

  run() {
    const baseResult = this.baseGame.play();
    let finalResult = {
      from: "base only",
      baseResult,
    };

    if (baseResult.freeSpinCount >= 3) {
      const freeResult = this.freeGame.play();
      finalResult = {
        from: "base + free",
        baseResult,
        freeResult,
      };
    }

    return finalResult;
  }
}

const controller = new GameFlowController();
const result = controller.run();
console.log(result);
```