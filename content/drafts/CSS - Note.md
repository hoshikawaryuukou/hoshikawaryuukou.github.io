---
title: "CSS - Note"
date: 2023-09-22 21:11:00
draft: true

tags: ["CSS"]
---

## 邊界控制 
- margin：控制元素外部的空間，將元素與其他元素隔開。
- padding：控制元素內部的空間，將內容與邊框隔開。
- border：將內容包裹在內，用於定義元素的邊界。
- box-sizing : 可以選擇是否讓 padding 和 border 包含在指定的 width 和 height 內。
- gap : flexbox 與 grid 能位子元素設置間距。

## 子元素置中

### 使用 Flexbox 置中
```html
<div class="container">
  <div class="centered-box">置中內容</div>
</div>
```
```css
<style>
.container {
  display: flex;
  justify-content: center; /* 水平置中 */
  align-items: center;     /* 垂直置中 */
}
</style>
```
## 基於視窗維持固定比例
```css
.root {
  aspect-ratio: 4 / 3;
}

@media (min-aspect-ratio: 4/3) {
  .root {
    height: 100%;
    width: auto;
  }
}

@media (max-aspect-ratio: 4/3) {
  .root {
    width: 100%;
    height: auto;
  }
}
```