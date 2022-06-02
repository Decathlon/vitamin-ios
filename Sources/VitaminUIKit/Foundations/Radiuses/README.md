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

To apply a radius to any view, you have to attribute the `rawValue` of the desired enum case to the `.layer.cornerRadius` property of your view

```swift
import Vitamin

let label = UILabel(
    frame: CGRect(
        origin: .zero,
        size: CGSize(width: 200, height: 100)
    )
)
label.text = "Test label"
label.layer.backgroundColor = VitaminColor.Core.Background.primary.cgColor
label.layer.borderColor = VitaminColor.Core.Border.primary.cgColor
label.layer.borderWidth = 1.0
label.backgroundColor = .clear

// This label will have a rounded border with a corner radius of 16px
label.layer.cornerRadius = VitaminRadius.radius400.rawValue
```

