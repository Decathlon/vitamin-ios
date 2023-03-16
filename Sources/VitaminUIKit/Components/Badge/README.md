## Badge
[Reference](https://www.decathlon.design/726f8c765/p/465f7c-badge/b/84df92)

Vitamin provides a `VitaminBadge` for UIKit.

```swift
import Vitamin

// This badge will be red with a value of 2 and a medium size
let badge = VitaminBadge(value: 2, variant: .alert, size: .medium)

// This button will be yellow without any value
let badge = VitaminBadge(value: nil, variant: .accent)
```

###Styling

`VitaminBadge` handles 5 variants (the default is `.standard`):
- `.standard`
- `.alert`
- `.accent`
- `.brand`
- `.reversed`

You can pass an optional value as integer.
- If the value is `nil`, the badge will be empty and smaller.
- If the value exceeds `100`, the text displayed will be `99+`.
- Every other value will be displayed as is.

### Sizing
`VitaminBadge` handles 3 sizes (the default is `.small`):
- `.small`
- `.medium`
- `.large`


### Adding to a view
You have two choices to add a badge to a View:
- Instantiate yourself the `VitaminBadge`, and place it upon your view.
- Use the convenience `UIView` extension method `addBadge(with:variant)`.

#### Manual method
You will have to handle everything on your own, Vitamin only provides the badge component, but you have to keep a reference on it to be able to modify it, hide it, or remove it.


#### Automatic method
if you choose to use the method `addBadge(with:variant:size:)`, it will instantiate the Badge, add it as a subview, and place it at the upper right corner of the view.

```swift
import Vitamin

myView.addBadge(with: 2, variant: .alert, size: .medium)
```

You also can modify it by calling it with the convenience `UIView` extension method `modifyBadge(with:variant:size:)`.

```swift
import Vitamin

// won't do anything if no badge is added by the above method
myView.modifyBadge(with: nil, variant: .brand, size: .small)
```

You finally can remove it by calling the convenience `UIView` extension method `removeBadge()`.
```swift
import Vitamin

// won't do anything if no badge is added by the above method
myView.removeBadge()
```


Note: `VitaminBadge` inherits from `UILabel`, but you should not try to modify standard properties such as `numberOfLines`, or `text`, because that could lead to unexpected behaviors.
