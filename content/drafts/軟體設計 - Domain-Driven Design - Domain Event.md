---
title: "軟體設計 - Domain-Driven Design - Domain Event"
date: 2022-12-15 20:05:00
draft: true

tags: ["Software Design", "DDD"]
---





應用服務控制著事務。不要在事件通知過程中修改另一個聚合實例，因為這樣會破壞聚合的一大原則：在一個事務中，只能對一個聚合進行修改。

使用異步處理。及每一個定義方都在各自獨立的事務中修改額外的聚合實例。

事件訂閱方不應該在另一個聚合上執行命令方法，因為這樣將破壞“在單個事務中只修改單個聚合實例”的原則。所有聚合實例間的最終一致性必須通過異步方式處理。

在確實需要異步集成的地方，則可能需要處理事務的最終一致性。
需不需要維護事務的一致性?

事务也是以业务用例为单位的


## Ref
- [领域驱动设计战术篇--领域事件](https://zhuanlan.zhihu.com/p/108495225) ??
- [DDD诊所——异步事件综合征](https://zhuanlan.zhihu.com/p/552465548)
- [Handling domain events](https://piotrgankiewicz.com/2016/08/01/handling-domain-events/)
- [領域事件在 Rails 中的呈現形式](https://blog.aotoki.me/posts/2023/01/04/the-domain-event-types-in-rails/)



