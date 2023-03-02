## Snackbar
[Reference](https://www.decathlon.design/726f8c765/p/798580-snackbar/b/83feb7)

Vitamin provides a `VitaminSnackbar` class to display a short message at the bottom of the screen

You have two possibilities:
- build your `VitaminSnackbar`, place it on your screen and make it appear
- use the provided `UIViewController` extension to push a snackbar at the bottom of your ViewController's view

### Setting Content
A `VitaminSnackbar` has 3 properties to set content:
- a `title` String, that should be short, and is mandatory
- a `message` String, that should also be as short as possible, and is also mandatory
- an optional `image` that will be displayed on the left hand side of the snackbar

If the image is set, the title and message will be placed on the right of the image, and aligned to left
If not, title and content will be centered

All these properties can be set in constructor, by passing them in a `VitaminSnackbar.ContentConfiguration` struct.
They can also be set separately afterwards

```swift
// let's set properties in constructor
let snackbar = VitaminSnackbar(
    contentConfiguration: VitaminSnackbar.ContentConfiguration(
        title: "A short title is best",
        message: "A message should be short",
        image: VitaminAssets.Placeholder.landscape.image
    )
)

// or let's define an empty VitaminSnackbar and set its properties afterwards
let anotherSnackbar = VitaminSnackbar()
anotherSnackbar.title = "Another short title is best",
anotherSnackbar.message = "A message should be shorter",
anotherSnackbar.image = VitaminAssets.Placeholder.landscape.image
```

### Width of a snackbar
The width of the snackbar will automatically adjust to content, but the `VitaminSnackbar` has a property to cap the width
- `maxWidth`, which is an optional `CGFloat`, whose default value is `nil`. If set to `nil`, a default `maxWidth` of 320px will be applied

As for content properties, it can be set by initializer or afterwards

```swift
// let's set properties in constructor
let snackbar = VitaminSnackbar(
        contentConfiguration: VitaminSnackbar.ContentConfiguration(
        title: "A short title is best",
        message: "A message should be short"
    ),
    maxWidth: 200.0
)

// or let's define an empty VitaminSnackbar and set its properties afterwards
let anotherSnackbar = VitaminSnackbar()
anotherSnackbar.title = "Another short title is best",
anotherSnackbar.message = "A message should be shorter",
anotherSnackbar.maxWidth = 200.0
```


### Displaying a Snackbar
If you want to manaully display the snackbar, the `VitaminSnackbar` provides a `display(completion:)` function, that will first set opacity of the snackbar (and its subviews) to 0, then fade it in by animating the opacity to 1.

```swift
// let's set properties in constructor
let snackbar = VitaminSnackbar(
    contentConfiguration: VitaminSnackbar.ContentConfiguration(
        title: "A short title is best",
        message: "A message should be short",
        image: VitaminAssets.Placeholder.landscape.image
    )
)

// Define here the layout constraints to place your snackbar on the screen
// for example:
snackbar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
snackbar.bottomAnchor.constraint(
    equalTo: self.view.bottomAnchor,
    constant: 10.0
).isActive = true

// fade you snackbar in
snackbar.display()
```

⚠️ This method should only be used before displaying the snackbar, because if it is already displayed, it will, disappear, then reappear with a fade-in effect.

Since only one snackbar is allowed at the same time, if you display manually the snackbar, it's up to you to remove any other snackbar before (see below)
The completion parameter is an optional closure that will be executed just after the fade-in effect of the snackbar is finished.
By default, the completion is nil.


### Dismissal of a Snackbar
A `VitaminSnackBar` has also advanced properties to handle the dismissal
- a `autodismiss` boolean: if set to `true`, the `VitaminSnackbar` will be automatically dismissed after a delay. If set to `false`, it will remain displayed until any manual dismissal
- a `dismissDelay` Double, that represents the number of seconds before the automatic dismissal. Default value is 5. This property has no effect if `autoDismiss` is set to `false`
- a `dismissOnTap` boolean: if set to `true`, a tap on the snackbar will dismiss it. If set to `false`, snackbar will remain displayed until automatic or programmatic dismissal

All these properties can be set in constructor, by passing them in a `VitaminSnackbar.DismissConfiguration` struct.
They can also be set separately afterwards

```swift
// let's set properties in constructor
// once displayed, snackbar will automatically be dismissed after 10 seconds, or if the user taps on it before
let snackbar = VitaminSnackbar(
    contentConfiguration: VitaminSnackbar.ContentConfiguration(
        title: "A short title is best",
        message: "A message should be short",
        image: VitaminAssets.Placeholder.landscape.image
    ),
    dismissConfiguration: VitaminSnackbar.DismissConfiguration(
        autoDismiss: true,
        dismissDelay: 10.0,
        dismissOnTap: true
    )
)

// or let's define an empty VitaminSnackbar and set its properties afterwards
// once displayed, anotherSnackbar will automatically be dismissed after 5 seconds (default value), but tap on it will have no effect
let anotherSnackbar = VitaminSnackbar()
anotherSnackbar.title = "Another short title is best",
anotherSnackbar.message = "A message should be shorter",
anotherSnackbar.autoDismiss = true
anotherSnackbar.dismissOnTap = false
```

If you want to handle programmatically the dismissal, the `VitaminSnackbar` provides a `dismiss(completion:)` function, that will fade out the snackbar, and finally remove it from its superview.
The completion parameter is an optional closure that will be executed just after the dismissal.
By default, the completion is nil.

```swift
// snackbar is a previously displayed VitaminSnackbar
// it will fade out, then be removed from superview
snackbar.dismiss()
```

### Trigger an action when the snackbar is tapped
You can also add an action, that will be executed whenever the user taps the snackbar (independently of dismissal, see above)
This is done thanks to the following property :
- `actionOnTap` which is an optional closure that takes no argument and returns `Void` (i.e. `(() -> Void)?` )

It will be triggered just before dismissal if you set `dismissOnTap` to `true`.
Be carefull, if you set `dismissOnTap` to `false` while setting a non-nil `actionOnTap`, the action will be triggered every time the user taps the snackbar, not just only once.

The `actionOnTap` can be set in constructor, or afterwards. Default value is `nil`.

```swift
// For example, let's define the action as a lazy var in your ViewController
// Here, the action is to display an alert view
lazy private var action: () -> Void = { [unowned self] in
    var alertView = UIAlertController(
        title: "Snackbar tapped",
        message: "This is just an example of action, you can define whatever action you want",
        preferredStyle: .alert)

    alertView.addAction(UIAlertAction(title: "OK", style: .default))

    self.present(alertView, animated: true)
}

...

// let's set action in constructor
// once tapped, the alert view will be displayed, and the snackbar dismissed
let snackbar = VitaminSnackbar(
    contentConfiguration: VitaminSnackbar.ContentConfiguration(
        title: "A short title is best",
        message: "A message should be short",
        image: VitaminAssets.Placeholder.landscape.image
    ),
    dismissConfiguration: VitaminSnackbar.DismissConfiguration(
        autoDismiss: true,
        dismissDelay: 10.0,
        dismissOnTap: true
    ),
    actionOnTap: self.action
)

// or let's define an empty VitaminSnackbar and set its properties and actionOnTap afterwards
// once tapped, the alert view will be displayed, and the snackbar dismissed
let anotherSnackbar = VitaminSnackbar()
anotherSnackbar.title = "Another short title is best",
anotherSnackbar.message = "A message should be shorter",
anotherSnackbar.autoDismiss = true
anotherSnackbar.dismissOnTap = true
anotherSnackbar.actionOnTap = self.action
```


### Displaying a Snackbar in a ViewController
To ease the use of `VitaminSnackbar`, Vitamin provides a `UIViewController` extension, that adds the following method to any `UIViewController`:
`present(_:bottomMargin:)`

The first parameter is a `VitaminSnackbar`.

There is just one extra parameter:
- bottomMargin: snackbar will always be centered horizontally in view, but you can set the space between the bottom of the view and the bottom of the snackbar. Default value is 10

This method has also a great advantage: it automatically handles the fact that only one snackbar should be displayed.
If you call it while a snackbar is already displayed, it will first dismiss it, then display the new one.

If your snackbar has a `maxWidth`, it will be applied. But if it is not set, a default max width will be applied, which is the width of the controller's view minus a padding of 10px on each side.

```swift
// anywhere in your viewcontroller's code
... 

// it will dismiss any other snackbar already displayed, then display a snackbar 
// that will disappear after 3 seconds, or on tap, that will be placed 10px above bottom of view (default value),
// and whose width won't exceed 200
self.present(
    VitaminSnackbar(
        contentConfiguration: VitaminSnackbar.ContentConfiguration(
            title: "A title is Short",
            message: "A short message is best",
            image: VitaminAssets.Placeholder.landscape.image
        ),
        dismissConfiguration: VitaminSnackbar.DismissConfiguration(
            autoDismiss: true,
            dismissDelay: 3.0,
            dismissOnTap: true
        ),
        maxWidth: 200.0
    )
)

...
```

