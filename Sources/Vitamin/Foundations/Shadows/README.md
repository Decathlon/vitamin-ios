## Shadows
[Reference](https://www.decathlon.design/726f8c765/p/5522fa-shadows/b/69ed0e)

Vitamin provides you with the `VitaminShadow`enum, which has five possible cases :
- `.shadow100`
- `.shadow200`
- `.shadow300`
- `.shadow400`
- `.none`

To apply a shadow to any view, you can call the `dropShadow(shadowType: VitaminShadow)` method on this view.

```swift
import Vitamin

let label = UILabel(
    frame: CGRect(
        origin: .zero,
        size: CGSize(width: 200, height: 80)
    )
)
label.text = "Test label"
label.layer.cornerRadius = 16

// this label will have a shadow dropped
label.dropShadow(shadowType: .shadow200)
```

In case you would like to remove a shadow you added before, you can call `removeShadow()` method on your view.

```swift
label.removeShadow()
```

**Notes**: 
- Calling `removeShadow()` is equivalent to calling `dropShadow(shadowType: .none)`
- These methods reset all the properties of the layer that are modified by `dropShadow(shadowType: VitaminShadow)`, its usage could lead to strange behavior if used on a view whose shadow was not added by this method
- 


