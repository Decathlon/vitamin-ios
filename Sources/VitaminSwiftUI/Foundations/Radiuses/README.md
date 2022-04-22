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
To make a border with a radius, you can use convenience APIs depending of your needs:
- `vitaminAddBorderRadius(_ radius: VitaminRadius, content: S, lineWidth: CGFloat)`
- `vitaminAddBorderRadius(_ radius: VitaminRadius, content: S, style: StrokeStyle)`
For more informations about `StrokeStyle` you check [Apple documentation](https://developer.apple.com/documentation/swiftui/strokestyle)

```swift
import SwiftUI
import VitaminSwiftUI

struct RadiusesView: View {
    var body: some View {
        // Rectangle with radius 400
        Rectangle()
            .vitaminRadius(.radius400)
        // Text with radius 500 and border
        Text("Test with radius 500")
            .vitaminAddBorderRadius(.radius500,
                                    content: VitaminColor.Core.Border.active.swiftUIColor,
                                    lineWidth: 1)
        // Text with radius 700 and dash border
        Text("Test with radius 700")
            .vitaminAddBorderRadius(.radius700,
                                    content: VitaminColor.Core.Border.active.swiftUIColor,
                                    style: StrokeStyle(lineWidth: 1, dash: [10]))
    }
}
```
