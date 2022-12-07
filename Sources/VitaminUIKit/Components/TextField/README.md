## TextField
[Reference](https://www.decathlon.design/726f8c765/p/31121d-text-input/b/68557b)

Vitamin provides a `VitaminTextField` class which handles styling, states, validation, length counting, delegation.

```swift
import Vitamin

// Here are some examples of the many possibilities for VitaminTextFields (see full 
// documentation below)
// This text field will have a label (mandatory), a placeholder, a helper text, a length counter,
// a blue rounded rectangular border and a heart shaped icon on the right, but no automatic
// validation, and no tag
let textField = VitaminTextField(
	style: .outlined,
	state: VitaminTextField.StateConfiguration(initialState: .active),
	texts: VitaminTextField.TextConfiguration(
		labelText: "Example Field 1",
		placeholderText: "placeholder",
		helperText: "helper text"),
	maxLength: 40,
	icon: VitaminTextField.IconConfiguration(initialIcon: Vitamix.Line.Health.heart.image)

// This text field will have a label (mandatory), a length counter,
// a black underline border and an automatic validation that will check 1s after each 
// change of the value that this value is at least 3 characters long, but no icon and no tag
let textField = VitaminTextField(
	style: .filled,
	state: VitaminTextField.StateConfiguration(initialState: .standard),
	texts: VitaminTextField.TextConfiguration(labelText: "Example Field 2"),
	validation: VitaminTextField.ValidationConfiguration(
		liveValidation: { fieldValue, completion in
			guard let fieldValue = fieldValue else { return }
			    
			if fieldValue.count < 3 {
				completion(.failure(.errorWithMessage("Value must be at least 3 chatracters")))
			} else {
				completion(.success(()))
			}
		},
		liveValidationTimeInterval: 1),
	maxLength: 40)
```

### Basic properties

You can provide different texts:
- a mandatory `labelText` displayed above the text field
- an optional `helperText` displayed below the text field
- an optional `placeholderText` displayed in the text field when no value si present
- an optional `fieldValue` that will be the default value of the text field
- a `isSecureTextEntry` boolean value to indicate if the text of the field should be replaced by dots or not (default value is false)

If you instantiate your `VitaminTextField` programmatically, the text properties must be provided through a `VitaminTextField.TextsConfiguration` struct.

You can provide different property concerning icon displayed in the textField:
- an optional `icon` that will be displayed on the right of the text field, and that should belong to `Vitamix` assets collection
- an optional `iconAction` closure that takes the `VitaminTextField` as only parameter, to allow modify the text field properties when the user clicks on the icon
- an optional `iconActionDelegate` that is an object implementing the `VitaminTextFieldIconActionDelegate` protocol, to allow interacting with the click on the icon if the action you want to perform is more generic than just modifying the text field properties

If you instantiate your `VitaminTextField` programmatically, the text properties must be provided through a `VitaminTextField.IconConfiguration` struct.

You can also provide the following properties:
- an optional `maxLength` that will display a dynamic length counter below the text field


### Styles and state

`VitaminTextField` handles 2 styles: 
- `.filled`
- `.outlined`

This style can be provided and changed directly on the `VitaminTextField`.

If you instantiate your `VitaminTextField` programmatically, it can be provided in the `init` method.
The default style is `.outlined`.

`VitaminTextField` handles 5 states: 
- `.standard`
- `.active`
- `.error`
- `.success`
- `.disabled`

You can manually change the `state` property, or you can set the `activeOnEditing` boolean property to `true` to automatically switch the state to `.active` when the field gets the focus (only if its state is not `.error` or `.success`).

You can also decide if your `VitamintextField` should or not have leading and trailing padding, by modifying the boolean `horizontalPadding` property. Its default value is set to `true`, meaning leading and trailing padding are present.

If you instantiate your `VitaminTextField` programmatically, the `initialState`, `activeOnEditing` and `horizontalPadding` properties must be provided through a `VitaminTextField.StateConfiguration` struct.


### Validation

You can provide two closures to launch validation of the field.
They both are of the same type: `VitaminTextFieldValidation`.

They take as parameter:
- an optional `String` representing the value of the text field
- a closure taking as parameter a `Result<Void,VitaminTextField.ValidationError>` to indicate the result of validation. If the result is `.success`, the text field will switch to `.success` state. If the result is `.failure`, the field will switch to `.error` state, and the optional error message provided in the error will be appended to the helper text (or displayed in place of the helper text if this one is `nil` )

You have to implement your custom validation of the value, and call the completion with a `.failure` or `.success` depending on the result of your validation.
In case you call it with a `.failure`, you have to provide a `VitaminTextField.ValidationError` that can be of two types:
- `.errorWithMessage(String)` with an error message
- `.otherError` if it is not relevant to display a specific error message

The two types of validation are the following:

**Live validation :**

You have to provide a `liveValidation` closure that will be called every time the value of the field changes.
If you need to delay this validation, you can provide a `liveValidationTimeInterval`, which is the minimum time between two call to the liveValidation closure. By default, the `liveValidationTimeInterval` is 0.5 seconds.

**End editing validation**

You have to provide a `endEditingValidation` closure that will be called every time the edition of the field finishes, i.e. when it loses focus.

### Delegation

You can provide a `UITextFieldDelegate` to have access to delegate methods. All methods implemented in this delegate will be forwarded to the delegate of the backing `UITextField`.

If you have the same `delegate` for multiple `VitaminTextField`, you can provide a tag in the `textFieldTag` property.
It will be propagated to the backing `UITextField`, and you will be able to identify the related `VitaminTextField` in the delegate methods, by inspecting `UITextField`'s tag.
