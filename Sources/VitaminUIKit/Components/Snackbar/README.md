## Snackbar
[Reference](https://www.decathlon.design/726f8c765/p/798580-snackbar/b/83feb7)

Vitamin provides a `VitaminSnackbar` class to display a short message at the bottom of the screen

You have two possibilities:
- build your `VitaminSnackbar`, place it on your screen and make it appear
- use the provided `UIViewController` extension to push a snackbar at the bottom of your ViewController's view

### Basic properties
A `VitaminSnackbar` has 3 basic properties
- a `title` String, that should be short, and is mandatory
- a `message` String, that should also be as short as possible, and is also mandatory
- an optional `image` that will be displayed on the left hand side of the snackbar

If the image is set, the title and message will be placed on the right of the image, and aligned to left
If not, title and content will be centered

All these properties can be set in constructor, by passing them in a `VitaminSnackbar.BasicConfiguration` struct.
They can also be set separately afterwards

```swift
// let's set properties in constructor
let snackbar = VitaminSnackbar(
    basicConfiguration: VitaminSnackbar.BasicConfiguration(
        title: "A short title is best",
        message: "A message should be short",
        image: VitaminAssets.Placeholder.landscape.image
    )
)

// or let's define an empty VitaminSnackbar and set its properties afterwards
let snackbar2 = VitaminSnackbar()
snackbar2.title = "Another short title is best",
snackbar2.message = "A message should be shorter",
snackbar2.image = VitaminAssets.Placeholder.landscape.image
```

### Width of a snackbar
The width of the snackbar will automattically adjust to content, but the `VitaminSnackbar` has a property to cap the width
- `maxWidth` Double, whose default value is 320

As for basic properties, it can be set by initializer or afterwards

```swift
// let's set properties in constructor
let snackbar = VitaminSnackbar(
        basicConfiguration: VitaminSnackbar.BasicConfiguration(
        title: "A short title is best",
        message: "A message should be short"
    ),
    maxWidth: 200.0
)

// or let's define an empty VitaminSnackbar and set its properties afterwards
let snackbar2 = VitaminSnackbar()
snackbar2.title = "Another short title is best",
snackbar2.message = "A message should be shorter",
snackbar2.maxWidth = 200.0
```


### Displaying a Snackbar
If you want to manaully display the snackbar, the `VitaminSnackbar` provides a `display()` function, that will first set opacity of the snackbar (and its subviews) to 0, then fade it in by animating the opacity to 1.

```swift
// let's set properties in constructor
let snackbar = VitaminSnackbar(
    basicConfiguration: VitaminSnackbar.BasicConfiguration(
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

⚠️ This method should only be used before displaying the snackbar, because if it is already displayed, it will, disappear, then reappear with a fade in effect.

Since only one snackbar is alowed at the same time, if you display manually the snackbar, it's up to you to remove any other snackbar before (see below)


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
    basicConfiguration: VitaminSnackbar.BasicConfiguration(
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
// once displayed, snackbar2 will automatically be dismissed after 5 seconds (default value), but tap on it will have no effect
let snackbar2 = VitaminSnackbar()
snackbar2.title = "Another short title is best",
snackbar2.message = "A message should be shorter",
snackbar2.autoDismiss = true
snackbar2.dismissOnTap = false
```

If you want to handle programmatically the dismissal, the `VitaminSnackbar` provides a `dismiss()` function, that will fade out the snackbar, and finally remove it from its superview.

```swift
// snackbar is a previously displayed VitaminSnackbar
// it will fade out, then be removed from superview
snackbar.dismiss()
```


### Displaying a SnackBar in a ViewController
To ease the use of `VitaminSnackbar`, Vitamin provides a `UIViewController` extension, that adds the following method to any `UIViewController`:
`pushVitaminSnackbar(title:message:image:autoDismiss:dismissDelay:dismissOnTap:bottomMargin:maxWidth:)`

All parameters have the same meaning than on a regular VitaminSnackbar.
They can be passed through `VitaminSnackbar.BasicConfiguration` and `VitaminSnackbar.DismissConfiguration` structs.
They also have the same default values.

The only exceptions are:
- `maxWidth`: it is optioanl, and default value is `nil`. If you do not set it, the max width of the snackbar will be the width of the View of the controller, with a margin of 10 on each side.
- bottomMargin: snackbar will always be centered horizontally in view, but you can decide the space between the bottom of the view and the bottom of the snackbar. Default value is 10

This method has also a great advantage: it automatically handles the fact that only one snackbar should be displayed.
If you call it while a snackbar is already displayed, it will first dismiss it, then display the new one.

```swift
// anywhere in your viewcontroller's code
... 

// it will dismiss any other snackbar already displayed, then display a snackbar 
// that will disappear after 3 seconds, or on tap, that will be placed 10px above bottom of view (default value),
// and whose width won't exceed 200
self.pushVitaminSnackbar(
    basicConfiguration: VitaminSnackbar.BasicConfiguration(
        title: "A title is Short",
        message: "A short message is best",
        image: VitaminAssets.Placeholder.landscape.image
    ),
    dismissConfiguration: VitaminSnackbar.DismissConfiguration(
        autoDismiss: true,
        dismissDelay: 3.0,
        dismissOnTap: true
    )
    maxWidth: 200.0
)

...
``

