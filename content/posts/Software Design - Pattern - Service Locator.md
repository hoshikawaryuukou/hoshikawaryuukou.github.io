---
draft: false
title: Software Design - Pattern - Service Locator
date: 2023-06-28T16:56:18+08:00
tags:
  - Software_Design
  - Pattern
---

## Quick Chat

**Service Locator** 是一種 **依賴尋找（Dependency Lookup）** 的實作方式，它確實屬於控制反轉（IoC）的一種。

過去我曾頻繁使用這個模式，當時對於 DI（依賴注入）與 IoC 的概念還不熟悉，只覺得它讓依賴的取用變得非常方便，因為你可以在任何地方直接這樣取得所需物件：

```csharp
var target = ServiceLocator.Resovle<Target>();
```

然而，這種作法存在幾個顯著問題：

1.  **隱性依賴**：由於依賴的取得過程被隱藏起來，程式碼的真實依賴關係難以被一眼識別，增加了閱讀與維護的難度。
2.  **打破分層原則**：任何元件都可以隨意取得服務，這可能會導致 View 層級的物件存取到不屬於其範疇的業務邏輯，破壞了應用程式的架構分層。

因此，當我對 DI 與 IoC 的概念更加熟悉，並開始使用 DI/IoC Container 後，就逐漸棄用了 Service Locator 這個模式。

## Situation

這次的專案讓我重新思考了 Service Locator 的價值。我發現它非常適合做為從 **Singleton 過渡到 DI/IoC Container** 的中間階段。

我們目前專案嚴重依賴 Singleton 模式，團隊成員也已經習慣了這種寫法。若要直接切換到 DI/IoC Container，勢必會引發不小的陣痛期。

在這種情況下，Service Locator 成了理想的過渡方案，理由如下：

1.  **寫法近似 Singleton**：它的使用方式與靜態的 Singleton 模式極為相似，能讓團隊成員無痛轉換，降低學習成本。
2.  **快速感受 IoC 好處**：儘管只是過渡，但它能讓團隊成員立即感受到集中管理依賴所帶來的便利性，為後續全面採用 DI/IoC Container 鋪路。
3.  **集中管理依賴**：它提供一個中央註冊點，讓所有依賴關係被統一看管。

## Practice

這種模式使用一個中央註冊表（**Service Locator**）來根據請求返回執行特定任務所需的物件。

以下是一個簡化版的實作範例，它有別於一般的 IoC Container，具有以下特色：

  * **不強制介面實作**：註冊的物件可以不必實作特定介面。
  * **單純的容器**：主要功能就是作為物件的儲存庫。
  * **不使用反射**：為避免效能開銷，它搭配一個 **Installer（組合根）** 來進行物件的註冊。

<!-- end list -->

```csharp
// 這裡透過 static 達成全域存取
public class ServiceLocator
{
    private static readonly Dictionary<Type, object> instances = new Dictionary<Type, object>();

    // 註冊服務
    public static void Register<T>(T instance)
    {
        instances[typeof(T)] = instance;
    }

    // 尋找服務
    public static T Resolve<T>()
    {
        if (instances.TryGetValue(typeof(T), out var instance))
        {
            return (T)instance;
        }

        throw new Exception($"Service of type {typeof(T)} is not registered.");
    }

    // 釋放服務 (可選)
    public static void Release<T>()
    {
        if (instances.ContainsKey(typeof(T)))
        {
            instances.Remove(typeof(T));
        }
    }
}
```

```csharp
// 由 Installer 集中註冊物件
public class DemoBasicServiceLocatorsInstaller : MonoBehaviour
{
    public DemoBasicMoneyUI moneyUI;

    public MoneyType moneyType;
    public int moneyValue = 100;

    void Start()
    {
        switch (moneyType)
        {
            case MoneyType.Real: ServiceLocator.Register<IMoneyFormatConverter>(new RealMoneyFormatConverter()); break;
            case MoneyType.Coin: ServiceLocator.Register<IMoneyFormatConverter>(new CoinMoneyFormatConverter()); break;
            default: throw new System.NotImplementedException();
        }

        moneyUI.Show(moneyValue);
    }
}
```

```csharp
// 在需要的地方從容器取得服務
public class DemoBasicMoneyUI : MonoBehaviour
{
    [SerializeField] private TMP_Text text;

    private IMoneyFormatConverter moneyFormatConverter;

    public void Show(int moneyValue)
    {
        // 透過 ??= 確保只在第一次使用時尋找服務
        moneyFormatConverter ??= ServiceLocator.Resolve<IMoneyFormatConverter>();
        text.text = moneyFormatConverter.Convert(moneyValue);
    }
}
```