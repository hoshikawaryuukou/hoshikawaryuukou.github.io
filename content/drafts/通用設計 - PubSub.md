---
title: "通用設計 - PubSub"
date: 2022-12-15 20:05:00
draft: true

tags: ["Exception"]
categories: ["Common Design"]
---

- [Class Invariant](https://khalilstemmler.com/wiki/invariant/)

## UUID
- [What is a UUID, and why should you care?](https://www.cockroachlabs.com/blog/what-is-a-uuid/)


-------------
Observer, Pub-Sub

## 目的
>有三個角色(主題/發布者/觀察者)，觀察者透過跟主題註冊，當發布者透過主題發送訊息，以達到自動通知狀態更改。

## 實作
### Observer
觀察者模式中的主題同時身為發布者，觀察者是知道發布者的，但發布者不知道觀察者。

### Pub-Sub (Publisher-Subscriber)
發布者-訂閱者模式中的主題通常由消息代理或事件總線處理，發布者和觀察者不知道彼此的存在。發布者項主題發送訊息，主題再轉發給觀察者。

## Reference
[Observer vs Pub-Sub pattern](https://hackernoon.com/observer-vs-pub-sub-pattern-50d3b27f838c)

------
[Pub sub system pros and cons](https://www.semicolonandsons.com/code_diary/architecture/pub-sub-system-pros-and-cons)