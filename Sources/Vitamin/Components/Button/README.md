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
