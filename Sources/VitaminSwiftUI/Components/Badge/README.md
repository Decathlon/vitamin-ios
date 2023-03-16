## Badge
[Reference](https://www.decathlon.design/726f8c765/p/465f7c-badge/b/84df92)

Vitamin provides a `VitaminBadge` for SwiftUI.

```swift
import SwiftUI
import VitaminCore
import VitaminSwiftUI

// This badge will be red with a value of 2 in the medium size
let badgeView = VitaminBadge(value: 2, variant: .alert, size: .medium)

// This button will be yellow without any value in the small size
let badge = VitaminBadge(variant: .accent)
```

### Styling

`VitaminBadge` handles 5 variants (the default is `.standard`):
- `.standard`
- `.alert`
- `.accent`
- `.brand`
- `.reversed`

You can pass an optional value as integer.
- If the value is `nil`, the badge will be empty and smaller.
- If the value exceeds `100`, the text displayed will be 99+.
- Every other value will be displayed as is.

`VitaminBadge` handles 3 sizes (the default is `.small`):
- `.small`
- `.medium`
- `.large`

### Adding to a view
You have two choices to add a badge to a View:
- Instantiate yourself the `VitaminBadge`, and place it in your view.
- Use the `.vitaminBadge(:variant:size:)` modifier. This modifier will add the badge on the top trailing of the view.

```swift
import SwiftUI
import VitaminCore
import VitaminSwiftUI

struct BadgesView: View {
    var body: some View {
        VStack {
            // Badge only
            VitaminBadge(10, variant: .alert, size: .small)
            // Badge on the top trailing of the view
            Vitamix.Fill.Media.notification.swiftUIImage
                .vitaminBadge(10, variant: .alert, size: .small)
        }
    }
}
```
