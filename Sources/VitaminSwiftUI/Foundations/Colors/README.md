## Colors
[Reference](https://www.decathlon.design/726f8c765/p/85c5a1-colors/b/06f55e)

Vitamin colors are all available under the namespace `VitaminColor`.

It is recommended to use semantic colors.

```swift
import SwiftUI
import VitaminSwiftUI

struct AssetsView: View {
    var body: some View {
        // Background brand primary
        VitaminColor.Core.Background.brandPrimary.swiftUIColor
    }
}
```

In case the semantic colors are not sufficient for your needs (some specific use cases that design system does not handle), you can access the base colors.

```swift
import SwiftUI
import VitaminSwiftUI

struct ColorsView: View {
    var body: some View {
        // Base blue 400
        VitaminColor.Base.blue400.swiftUIColor
    }
}
```

To use the dark/light theme you can set the `VitaminColor.interfaceStyle` variable.  
You can use `.auto`, `.light` or `.dark` to choose your theme. `.auto` will automatically handle the light/dark theme.  
The default value is `.auto`.  

You can also use `VitaminColor.Theme.Core.Light` and `VitaminColor.Theme.Core.Dark` to get the values of light and dark theme directly.
