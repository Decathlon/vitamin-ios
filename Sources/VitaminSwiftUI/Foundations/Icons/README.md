## Icons
[Reference](https://www.decathlon.design/726f8c765/p/91dc94-iconography/b/477d6e)

Vitamin icons are all available under the namespace `Vitamix`.

Each icon exists in two variants, fill and line.
Each variant has its own sub-namespace: `Vitamix.Fill` and `Vitamix.Line`.
In these sub-namspaces, icons are grouped by category.

All icons are PDF vectors, and can be thus resized without loss.

```swift
import SwiftUI
import VitaminSwiftUI

struct IconsView: View {
    var body: some View {
        // Heart fill
        Vitamix.Fill.Health.heart.swiftUIImage
        // Eye line
        Vitamix.Line.System.eye.swiftUIImage
    }
}
```

By default, icon color is black.
If you need to change the color, using a color of the `VitaminColor` namespace, you can do that by using the `foregroundColor` modifier:

```swift
import SwiftUI
import VitaminSwiftUI

struct IconsView: View {
    var body: some View {
        // Heart fill red
        Vitamix.Fill.Health.heart.swiftUIImage
            .foregroundColor(VitaminColor.Core.Content.negative.swiftUIColor)
    }
}
```

**TIP**: During development, you can launch the showcase of this project, and in the Icons section, when you click on an icon, its full name will be copied in your clipboard, to allow you pasting it quickly in your code.
