## Shadows
[Reference](https://www.decathlon.design/726f8c765/p/5522fa-shadows/b/69ed0e)

Vitamin provides you with the `VitaminShadow` enum, which has five possible cases:
- `.shadow100`
- `.shadow200`
- `.shadow300`
- `.shadow400`
- `.none`

To apply a shadow to a view, you can call the `vitaminShadow(_ shadow: VitaminShadow)` modifier on this view.

```swift
import SwiftUI
import VitaminSwiftUI

struct ShadowsView: View {
    var body: some View {
        // Rectangle with shadow 200
        Rectangle()
            .vitaminShadow(.shadow200)
    }
}
```

**Notes**: 
- In case you would like to remove a shadow you added before, you can set the shadow to `.none`.
