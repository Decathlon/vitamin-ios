## Radiuses
[Reference](https://www.figma.com/file/zDZIyayUlr1yTWrsi7cFoo/Vitamin---Web-UI-kit-v0?node-id=8060%3A18265)

Vitamin provides you with the `VitaminRadius` enum, which has eight possible cases:
- `.radius100`
- `.radius200`
- `.radius300`
- `.radius400`
- `.radius500`
- `.radius600`
- `.radius700`
- `.radius800`

To apply a radius to a view, you can call the `vitaminRadius(_ radius: VitaminRadius, antialiased: Bool)` modifier on this view.

```swift
import SwiftUI
import VitaminSwiftUI

struct RadiusesView: View {
    var body: some View {
        // Rectangle with radius 400
        Rectangle()
            .vitaminRadius(.radius400)
    }
}
```
