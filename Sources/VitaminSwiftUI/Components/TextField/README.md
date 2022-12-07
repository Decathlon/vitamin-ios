## TextField
[Reference](https://www.decathlon.design/726f8c765/p/31121d-text-input/b/68557b)

For SwiftUI, Vitamin provides two possibilities to have a `VitaminTextField`.
- A `VitaminTextField` struct which provided an all-in-one component ready to use.
- A `.vitaminTextFieldStyle([...])` modifier which has more customizable possibilities like applying the `VitaminTextField` to a `TextField` or a `SecureField`.

```swift
import SwiftUI
import VitaminSwiftUI
import VitaminCore

struct ExampleView: View {
    @State var text = ""
    @State var state: VitaminTextFieldState = .standard

    var body: some View {
        // VitaminTextField all-in-one component
        VitaminTextField(style: .outlined,
                         text: VitaminTextField.TextConfiguration(label: "Firstname",
                                                                  placeholder: "Ex: John",
-                                                                 text: $text),
                         state: $state)
        
        // VitaminTextField modifier
        TextField("Ex: John", text: $text)
            .vitaminTextFieldStyle(style: .outlined,
                                   label: "Firstname",
                                   state: $state)
    }
}
```

### Basic properties

#### VitaminTextField component

// TODO

#### VitaminTextFieldStyle modifier

// TODO

### Styles and state

`VitaminTextField` handles 2 styles: 
- `.filled`
- `.outlined`

The default style is `.outline`.

`VitaminTextField` handles 5 states: 
- `.standard`
- `.active`
- `.error`
- `.success`
- `.disabled`

The default state is `.standard`.

You can manually change the `state` thanks to the state property that you need to provide. 
The VitaminTextField component will automatically set the state from `.standard` to `.active` when the field gets the focus.
However, the VitaminTextFieldStyle modifier will not do this by default. If you want to update the state automatically you need to use the `VitaminTextField.updateActiveState(state:editing:)` method inside the `onEditingChanged` parameter of the `TextField`.
```swift
TextField("Ex: John", text: $text) { editing in
    state = VitaminTextField.updateActiveState(state: state, editing: editing)
}
.vitaminTextFieldStyle(style: .outlined,
                       label: "Firstname",
                       state: $state)
```

### Validation

If you want to set up a validation on the `TextField` content, you can use methods provided by `SwiftUI`.
If you are on iOS 14 and above, use `onChange(of:perform:)` ([Apple Documentation](https://developer.apple.com/documentation/swiftui/list/onchange(of:perform:\))).
If you are on iOS 13, use `onReceive(_:perform:)` ([Apple Documentation](https://developer.apple.com/documentation/swiftui/view/onreceive(_:perform:\))).

```swift
// iOS 14 and above
VitaminTextField(style: .outlined,
                 text: VitaminTextField.TextConfiguration(label: "Firstname",
                                                          placeholder: "Ex: John",
-                                                         text: $text),
                 state: $state)
    .onChange(of: text) { newValue in
        // Do your validation here.
        // Ex: If you want to update the state of the text field.
        state = .error
    }
    

// iOS 13
VitaminTextField(style: .outlined,
                 text: VitaminTextField.TextConfiguration(label: "Firstname",
                                                          placeholder: "Ex: John",
-                                                         text: $text),
                 state: $state)
    .onReceive(Just(text)) { newValue in
        // Do your validation here.
        // Ex: If you want to update the state of the text field.
        state = .error
    }
```

Check the showcase if you want to see the full implementation.
