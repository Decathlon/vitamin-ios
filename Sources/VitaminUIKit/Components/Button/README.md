## Button
[Reference](https://www.decathlon.design/726f8c765/p/8008f8-button/b/50afe1)

Vitamin provides a `VitaminButton` class which adapts to a style and a size.

```swift
import Vitamin

// This button will have a white background with a dark border
let button = VitaminButton(style: .secondary)

// This button will have a transparent background and a blue title
let button = VitaminButton(style: .ghost)
```

`VitaminButton` handle 3 states: `.normal`, `.highlighted` and `.disabled`.
 
`VitaminButton` also has a `size` property where you can change the button's intrinsic size. Changing this property changes the various internal spaces and the title's font size.
As the default button size is handled with the intrinsicSize, you can still resize your button with constraints to better suit your needs. 
A good example of that would be to make your button stretched to fit its parent's width.

Note: `VitaminButton` styles its title as  `TextStyle.xxxbutton`, so make sure you setup the Roboto fonts properly.

If you create your button through Storyboard or Xib, do not forget to set its type to `Custom` (instead of `System`, which is the default value). If not set to `Custom`, `VitaminButton` may act oddly in some circumstances.

### Icon management
You can put an icon from Vitamin icons library in your button, or also have a square button with only one icon.

To achieve this, `VitaminButton` provides you with a `setIconType(:for:)` method.
You can have different icons, or even different icon types per state.

`IconType` has four cases :
- `.leading` : icon will be put before your button label
- `.trailing` : icon will be put after your button label
- `.alone` : button will be squared, an icon will be centered, and no button label will be displayed
- `.none` : no icon will be displayed in your button

For `.leading`, `.trailing` and `.alone`, you must provide :
- an `UIImage` from Vitamin icons library (but will work with any UIImage)
- an optional `UIImage.RenderingMode` : if you provide one, image will be resized using this rendering mode, if not, image will be used as is (with unexpected behaviour if your image has a wrong size)

If you do not specify specific icon type for a specific state, the one for .normal state will be chosen.
And by default, the icon type for .normal state is .none

Note: squareness of VitaminButton with `.alone` is handled through intrisicSize, it is not guaranteed if you apply constants that could impact width and height of button.

```swift
import Vitamin

// This button will have a white background with a dark border
// and an apple logo before text (in every state, since only .normal state has been set)
let button = VitaminButton(style: .secondary)
button.setIconType(.trailing(image: Vitamix.Line.Logos.apple.image, renderingMode: .alwaysTemplate), for: .normal)

// This button will be square, have a blue background and a white icon centered
// icon will be an Apple logo in normal state, and an Android logo in .highlighted state
let button2 = VitaminButton(style: .primary)
button2.setIconType(.trailing(image: Vitamix.Line.Logos.apple.image, renderingMode: .alwaysTemplate), for: .normal)
button2.setIconType(.trailing(image: Vitamix.Line.Logos.android.image, renderingMode: .alwaysTemplate), for: .highlighted)
```
