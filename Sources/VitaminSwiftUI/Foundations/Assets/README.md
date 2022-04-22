## Icons
[Reference](https://www.figma.com/file/Fi9WjIkuax79ujCAjvyoHj/Vitamin---Assets-v0?node-id=0%3A1)

Vitamin assets are all available under the namespace `VitaminAssets`.

Assets are grouped by category.

All assets are PDF vectors, and can be thus resized without loss.

```swift
import SwiftUI
import VitaminSwiftUI

struct AssetsView: View {
    var body: some View {
        // Decathlon logo
        VitaminAssets.Logo.logo.swiftUIImage
        // French flag
        VitaminAssets.Flag.fr.swiftUIImage
    }
}
```

The assets are provided as they should be used, so no recoloring is allowed

**TIP**: During development, you can launch the showcase of this project, and in the Assets section, when you click on an asset, its full name will be copied in your clipboard, to allow you pasting it quickly in your code.
