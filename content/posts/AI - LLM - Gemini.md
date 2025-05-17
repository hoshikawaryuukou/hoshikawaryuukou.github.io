---
title: "AI - LLM - Gemini"
date: 2025-05-08 13:11:00
draft: false

tags: ["AI"]
---

## Quick Chat
😊 免費方案對於輕度開發綽綽有餘
- [Gemini新手教学](https://www.youtube.com/watch?v=3jdhFHgvxpg)
- [Gemini API  |  Google AI for Developers](https://ai.google.dev/gemini-api/docs?hl=zh-tw)
- [定價  |  Gemini API  |  Google AI for Developers](https://ai.google.dev/gemini-api/docs/pricing?hl=zh-tw&_gl=1*1bgoxhp*_up*MQ..&gclid=CjwKCAiAopuvBhBCEiwAm8jaMRbEEnIJr7BCEthg7psSBoIKbpA9CmArCYnFF-oHxtxYB-4PtmvykRoC120QAvD_BwE)
- [頻率限制  |  Gemini API  |  Google AI for Developers](https://ai.google.dev/gemini-api/docs/rate-limits?hl=zh-tw&_gl=1*hth47i*_up*MQ..&gclid=CjwKCAiAopuvBhBCEiwAm8jaMRbEEnIJr7BCEthg7psSBoIKbpA9CmArCYnFF-oHxtxYB-4PtmvykRoC120QAvD_BwE)

## API
- 透過 Google AI Studio [申請](https://aistudio.google.com/apikey)

## Hello World
```js
import { GoogleGenAI } from "@google/genai";

const ai = new GoogleGenAI({ apiKey: "YOUR_API_KEY" });

async function main() {
  const response = await ai.models.generateContent({
    model: "gemini-2.0-flash",
    contents: "Explain how AI works in a few words",
  });
  console.log(response.text);
}

await main();
```

