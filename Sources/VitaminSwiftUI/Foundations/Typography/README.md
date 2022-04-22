## Typography
[Reference](https://www.decathlon.design/726f8c765/p/860e14-typography/b/208916)

Vitamin provides a `TextStyle` enum:
- `display`
- `largeTitle1`
- `largeTitle2`
- `title1`
- `title2`
- `title3`
- `headline`
- `body`
- `callout`
- `subhead`
- `footnote`
- `caption1`
- `caption2`

To apply a text style to a text, you can call the `vitaminTextStyle(_ textStyle: VitaminTextStyle)` modifier on this text.

```swift
import SwiftUI
import VitaminSwiftUI

struct TypographyView: View {
    var body: some View {
        Text("This is a title")
            .vitaminTextStyle(.title1)

        Text("This is a body text")
            .vitaminTextStyle(.body)

        Text("This a is a body text with positive semantic color")
            .vitaminTextStyle(.body)
            .foregroundColor(VitaminColor.Core.Content.positive.swiftUIColor)
    }
}
```
