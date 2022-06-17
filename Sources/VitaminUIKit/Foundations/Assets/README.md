## Icons
[Reference](https://www.figma.com/file/Fi9WjIkuax79ujCAjvyoHj/Vitamin---Assets-v0?node-id=0%3A1)

Vitamin assets are all available under the namespace `VitaminAssets`.

Assets are grouped by category.

All assets are PDF vectors, and can be thus resized without loss.

```swift
import UIKit
import Vitamin

let decathlonLogo: UIImage = VitaminAssets.Logo.logo.image

let frenchFlag: UIImage = VitaminAssets.Flag.fr.image
```

For the flags, you can also use the specific API with alpha-2 country code (ISO 3166-1).
```swift
let frenchFlag: UIImage? = VitaminAssets.flag(countryCode: "fr")?.image
```

The assets are provided as they should be used, so no recoloring is allowed

**TIP**: During development, you can launch the showcase of this project, and in the Assets section, when you click on an asset, its full name will be copied in your clipboard, to allow you pasting it quickly in your code.
