## Button
[Reference](https://www.decathlon.design/726f8c765/p/8008f8-button/b/50afe1)

Vitamin provides a `VitaminButton` SwiftUI View which adapts to a style and a size.

```swift
import SwiftUI
import VitaminSwiftUI
import VitaminCore

struct ExampleView: View {
    @State var enabled = true

    var body: some View {
        VStack {
            // This button will have a white background with a dark border
            VitaminButton(
                text: "Button",
                style: .secondary)
            // This button will have a white background with a dark border and expand to full width
            VitaminButton(
                text: "Button",
                style: .ghost,
                fullWidth: true)
        }
    }
}
```

`VitaminButton` adapts it rendering when it is pressed, or disabled.

### Style and Size management
You must provide `VitaminButton` with a `style` property, which is a `VitaminButtonStyle` enum case.
Reference for different styles of button is available in design reference documentation.

Default style is `.primary`.
 
You must also provide `VitaminButton` with a `size` property (which is a `VitaminButtonSize` enum case) that will change the button's intrinsic size. Changing this property changes the various internal spaces and the title's font size.
The size of the `VitaminButton` will adapt itself with the content you provide (text and icon)

Default style is `.medium`.

Note: `VitaminButton` styles its title as  `TextStyle.xxxbutton`, so make sure you setup the Roboto fonts properly.

If you set the `fullWidth` property to `true` (default is `false`), the button will expand to full width of its container.


### Icon management
You can put an icon from Vitamin icons library in your button, or also have a square button with only one icon.

To achieve this, you should provide `VitaminButton` with a `VitaminButton.IconType` property.

`IconType` has four cases:
- `.leading`: icon will be put before your button label
- `.trailing`: icon will be put after your button label
- `.alone`: button will be squared, an icon will be centered, and no button label will be displayed
- `.none`: no icon will be displayed in your button

For `.leading`, `.trailing` and `.alone`, you must provide:
- an `UIImage` from Vitamin icons library (but will work with any `UIImage`)
- a `Image.TemplateRenderingMode` to explain Vitamin how you would like it to resize and recolor your icon if it has not the right size and color

```swift
import SwiftUI
import VitaminSwiftUI
import VitaminCore

struct ExampleView: View {
    @State var enabled = true

    var body: some View {
        // this button will have a trailing arrow icon
        VitaminButton(
            text: "Button",
            style: .secondary,
            iconType: .trailing(
                Vitamix.Line.System.arrowRightS.image, 
                renderingMode: .template)
        )
    }
}
```


### Action
As a regular SwiftUI Button, you can provide a closure as last parameter. 

NB: The parameter name is `action`, but to follow Decathlon code style recommendations, you should pass it as trailing closure.

```swift
import SwiftUI
import VitaminSwiftUI
import VitaminCore

struct ExampleView: View {
    @State var enabled = true

    var body: some View {
        VitaminButton(
            text: "Button",
            style: .secondary) {
                // whatever action you want to trigger at click
            }
    }
}
```
