---
title: "Software Development - Repository Structure"
date: 2024-08-12 21:05:00
draft: false

tags: ["Software Development", "monorepo"]
---

## Quick Chat
最近我在開發公司的共用套件時，踩了不少坑，尤其是在儲存庫結構方面。

最初選擇了 polyrepo 的結構，但隨著開發的進展，碰到了一些問題：
- 要確保這些獨立的 repo 配置能夠同步。
- 每次發佈都需要逐一更新每個套件，尤其是那些有兩三層依賴的，讓發佈變得非常繁瑣。
- 進行 code review 時，還要不停地在不同 repo 之間切換。

為了改善這些問題，開始研究 monorepo 的結構：
- 使用 pnpm workspace 來構建。
- 雖然 monorepo 有一些權限控管的隱憂，但因為共用套件的開發人數不多，所以目前還不用太擔心協作上的衝突。

## Guide
- [monorepo-vs-polyrepo](https://github.com/joelparkerhenderson/monorepo-vs-polyrepo)
- [你很常聽到 monorepo，但為什麼要用 monorepo?](https://www.explainthis.io/zh-hant/swe/why-use-monorepo)
- [PolyrepoからMonorepoへ移行する](https://zenn.dev/kkoudev/articles/3963065a2ffa26)

## 策略
- **monolith**: 當專案需要保持單一應用程式的完整性，所有功能都被打包在一起，且較少外部依賴。
- **monorepo**: 當多個專案需要高度共享資源或密切合作，如共用許多元件、工具或模組的情況下。
- **polyrepo**: 功能差異大、專案之間關聯性不強或不需要彼此干擾的情況下。每個專案獨立運行，較少相互依賴。

## monolith 

## polyrepo

## monorepo
- [Managing a full-stack, multipackage monorepo using pnpm](https://blog.logrocket.com/managing-full-stack-monorepo-pnpm/)
- [Live types in a TypeScript monorepo](https://colinhacks.com/essays/live-types-typescript-monorepo)
- [Building a Typescript + NodeJS Monorepo in 2024](https://www.gfor.rest/blog/node-ts-monorepo)

### 特色
- 👍 package 使用相同版本 **依賴/設定檔/風格**。
- ⚠️ package 權限控管需仰賴其他工作流。
