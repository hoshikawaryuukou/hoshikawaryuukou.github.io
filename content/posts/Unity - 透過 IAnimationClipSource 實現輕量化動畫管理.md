---
draft: false
title: Unity - 透過 IAnimationClipSource 實現輕量化動畫管理
date: 2026-01-18T13:46:53+08:00
tags:
  - Unity
---

## Quick Chat

在 Unity 中處理動畫時，開發者常會遇到以下令人煩躁的情況：
- **只想做個簡單的背景循環動畫**：卻必須建立 AnimationClip，還得強迫配對建立一個 AnimatorController，流程非常麻煩。
- **想避開 AnimatorController**：雖然可以用 Playable API 來播放動畫從而不需要 AnimatorController，但當你想**編輯**那個 AnimationClip 時，Unity 編輯器通常又會要求你必須掛載 AnimatorController 才能預覽和編輯。

💡使用 **IAnimationClipSource** 這個接口，就能解決上述問題。

## Guide

[IAnimationClipSourceという神インターフェースについて](https://qiita.com/nemuke_cs/items/307b277b9202ab553bc2)

## Sample

1. 建立一個繼承 MonoBehaviour 和 IAnimationClipSource 的腳本（SimpleAnimation.cs）。
2. 實作 GetAnimationClips 方法。
3. 在方法中，將你想要編輯或使用的 AnimationClip 加入到傳入的 List 中。

```cs
public class SimpleAnimation : MonoBehaviour, IAnimationClipSource 
{
    // 想要在 Animation 視窗中顯示的動畫片段
    [SerializeField] AnimationClip[] clips;

    void IAnimationClipSource.GetAnimationClips(List<AnimationClip> results) 
    {
        foreach(var clip in clips)
            results.Add(clip);
    }
}
```

4. 將上述腳本和 Animator 元件掛載到同一個 GameObject 上。
5. 現在即使**沒有**給 Animator 設定 AnimatorController，你依然可以在 Unity 的 **Animation Window** 中選擇、編輯並預覽你在腳本中指定的 AnimationClip。
