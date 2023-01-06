---
title: "Unity - Packages"
date: 2022-11-12 21:11:00
draft: false

tags: ["Guide"]
categories: ["Unity"]
---

## Package Manager
### Installing Packages using UPM
1. Package manager ->  Advanced project settings
2. Add Scoped Registries

```
Name: package.openupm.com
URL: https://package.openupm.com
Scope(s): 
         com.cysharp.unitask
```
3. Package manager -> Packages: My Registries -> Install


## Dependency Injection
- [VContainer](https://github.com/hadashiA/VContainer)  
openupm - jp.hadashikick.vcontainer  
P.S. [How to avoid Dependency Injection constructor madness?](https://stackoverflow.com/questions/2420193/how-to-avoid-dependency-injection-constructor-madness)


## Rx (Reactive Extensions)
* [UniRx](https://github.com/HoshikawaRyuukou/UnityDev/blob/main/Note/Package/Rx/UniRx.md)    
openupm - com.neuecc.unirx

## Async
* [UniTask](https://github.com/HoshikawaRyuukou/UnityDev/blob/main/Note/Package/Async/UniTask.md)    
openupm - com.cysharp.unitask

## Messaging 
* [MessagePipe](https://github.com/HoshikawaRyuukou/UnityDev/main/Note/Package/Messaging/MessagePipe.md)    
openupm - com.cysharp.messagepipe

* [MagicOnion]()