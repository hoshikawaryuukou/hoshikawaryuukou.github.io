---
draft: false
title: Software Design - Pattern - Guard Clauses
date: 2023-01-10T21:56:18+08:00
tags:
  - Software_Design
  - Pattern
---

## Quick Chat

- 符合 Fail Fast 原則，驗證條件並在不滿足條件時立即停止執行。
- 增加可讀性(更扁平)，減少了巢狀判斷。

## Guide
- [Guard Clause \| DevIQ](https://deviq.com/design-patterns/guard-clause)
- [Implementation Patterns: Guard Clause](http://teddy-chen-tw.blogspot.com/2012/05/implementation-patterns-guard-clause.html)
- [Stop using trivial Guard Clauses! Try this instead](https://codeopinion.com/stop-using-trivial-guard-clauses-try-this-instead/) 

## Example

- [Guard Clause \| DevIQ](https://deviq.com/design-patterns/guard-clause)

## Extras  

### Guard Class

-  [GitHub - ardalis/GuardClauses](https://github.com/ardalis/GuardClauses)

將通用的保護子句封裝在一個專門的類是一種很好的做法，可重用邏輯並編寫更具可讀性的保護子句。

### Value Object

- [Stop using trivial Guard Clauses! Try this instead](https://codeopinion.com/stop-using-trivial-guard-clauses-try-this-instead/) 

文章作者避免瑣碎 Guard 的方式，是使用 Value Object，來避免域接受到無效參數。(YT評論區也建議閱讀，有許多不錯的討論)

但不可否認的 Guard Clause 作法在大多情況下是有益的。
