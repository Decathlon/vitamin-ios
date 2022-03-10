## Tag
[Reference](https://www.decathlon.design/726f8c765/p/129f57-tag/b/1008b6)

Vitamin provides a `VitaminTag`.

```swift
import Vitamin

// This tag will have a decorative cobalt color, with the "My tag" text
// and a gift icon
let vitaminTag = VitaminTag()
vitaminTag.label = "My tag"
vitaminTag.icon = Vitamix.Line.Finance.gift.image
vitaminTag.variant = .cobalt
```

### Basic properties

You must provide a variant among the eleven available. Variant will only impact background and foreground color of the tag.
The eleven variants are :
- `.brandPrimary`
- `.brandAccent`
- `.brandAlert`
- `.decorativeAmethyst`
- `.decorativeBrick`
- `.decorativeCobalt`
- `.decorativeEmerald`
- `.decorativeGold`
- `.decorativeGravel`
- `.decorativeJade`
- `.decorativeSaffron`

You must provide a mandatory `label` displayed in the tag

You can provide an optional `icon` that will be displayed on the left side of the tag


### Sizing

Since `VitaminTag` inherits from `UILabel`, you don't have to provide any width and height constraints, it will adapt to the content

Since a `VitaminTag` should always be on one line, please do not use the `numberOfLines` property
