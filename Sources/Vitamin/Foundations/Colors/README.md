## Colors
[Reference](https://www.decathlon.design/726f8c765/p/85c5a1-colors/b/06f55e)

Vitamin colors are all available under the namespace `VitaminColor`.

It is recommended to use semantic colors.

```swift
import Vitamin

VitaminColor.Core.Background.brandPrimary
```

In case the semantic colors are not sufficient for your needs (some specific use cases that design system does not handle), you can access the base colors.

```swift
import Vitamin

VitaminColor.Base.blue400.color
```

To use the dark/light theme you can set the `VitaminColor.interfaceStyle` variable.  
You can use `.auto`, `.light` or `.dark` to choose your theme. `.auto` will automatically handle the light/dark theme but is only available for iOS >= 13.  
The default value is `.auto` if available or `.light` if not.  

You can also use `VitaminColor.Theme.Core.Light` and `VitaminColor.Theme.Core.Dark` to get the values of light and dark theme directly.
