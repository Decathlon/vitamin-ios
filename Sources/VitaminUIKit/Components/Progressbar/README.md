## Progress bar
[Reference](https://www.decathlon.design/726f8c765/p/2388f2-progressbar/b/42a1a2)

Vitamin provides a `VitaminProgressbar` class which displays a progress bar

```swift
import Vitamin

// This circular progress bar will have a track and a percentage displayed, and will be 128pt of diameter
let circularProgressbar = VitaminCircularProgressbar(
    variant: .circular(
        size: .medium,
        style: .percentage),
    showTrack: true)

// This circular progress bar will have no track and an image displayed in the center, and will be 64pt of diameter. The image will be cropped and rounded to fit if needed
let circularProgressbar2 = VitaminCircularProgressbar(
    variant: .circular(
        size: .small,
        style: .image(UIImage(named: "flag")),
    showTrack: false)

// This circular progress bar will have a track and an image displayed in the center, and will be 64pt of diameter. The progress will be animated.
let circularProgressbar3 = VitaminCircularProgressbar(
    variant: .circular(
        size: .small,
        style: .empty),
    progressType: .indeterminate,
    showTrack: true)
circularProgressbar3.startAnimationForIndeterminate()

// This linear progress bar will have a track and a percentage displayed, will have a thickness of 8pt, and will have a "Downloading..." text displayed above
let linearProgressbar = VitaminCircularProgressbar(
    variant: .linear(
        size: .medium,
        style: .percentage),
    showTrack: true,
    leftLabelText: "Downloading...")

// This linear progress bar will have no track and no percentage nor text displayed, and will have a thickness of 16pt
let linearProgressbar2 = VitaminCircularProgressbar(
    variant: .linear(
        size: .large,
        style: .empty),
    showTrack: true)

// This linear progress bar will have a track and no text displayed, and will have a thickness of 16pt. The progress will be animated.
let linearProgressbar3 = VitaminCircularProgressbar(
    variant: .circular(
        size: .small,
        style: .empty),
    progressType: .indeterminate,
    showTrack: true)
linearProgressbar3.startAnimationForIndeterminate()
```

### Variant
This progress bar exists in two variants : `.circular`and `.linear`
You can set the variant through the `variant` property.
Variant is a enum with two associated values for size and style (see below)

### Size
The  `VitaminProgressbar` exists in different sizes, depending on the `variant`.

For variant `.linear`, it exists in 3 sizes, settable through the `size` associated value of the `variant` property :
- `.small` : it will have a thickness of 4pt
- `.medium` : it will have a thickness of 8pt
- `.large`: it will have a thickness of 16pt

When `.linear`, the progress bar is extensible in width : it will take the width of its frame view, but will be vertically centered in its frame (if frame is high enough, otherwise, it may be cropped)
The vertical centering will also depend on the `.style` (see below) : if labels are diplayed, their height is taken in consideration for centering the whole (labels + progress bar))

For variant `.circular`, it exists in 2 sizes, also settable through the `size` associated value of the `variant` property :
- `.small` : it will have a diameter of 64pt and a thickness of 4pt
- `.medium` : it will have a diameter of 128pt and a thickness of 8pt

When `.circular`, the progress bar is not extensible : if its frame's width or height is greater than its size, it will be centered
If the frame is too small, it will be cropped


### Style
The  `VitaminProgressbar` exists in different styles, depending on the `variant`.

For variant `.linear`, it exists in 3 styles, settable through the `style` associated value of the `variant` property :
- `.percentage` : the progress percentage will be displayed on the top right of the progress bar, and an optional label can be displayed on the top left of the progress bar. This label can be set with the `leftLabelText` property
- `.empty` : nothing will be displayed except the progress bar

For variant `.circular`, it exists in 4 styles, settable through the `style` associated value of the `variant` property :
- `.percentage` : the progress percentage will be displayed in the center of the progress bar
- `.image(UIImage)` : a rounded configurable image will be displayed in the center of the progress bar. You must provide an imagge, that will be fitted (i.e. resized, but not stretched) and rounded in the available space in the center of the progressbar. 
- `.empty` : nothing will be displayed in the center of the progress bar

You can also decide to display or not the track (i.e. the grey circle behind the progress in `.circular` variant, or the grey line behind the progress in `.linear` variant) by setting the `showTrack` boolean property 

### Progress Type
The progress of a progressbar can have two types : `.determinate` and `.indeterminate`
`.determinate` is the default value.
`.indeterminate` means that you do not know the progress of the task represented by the progressbar. So the progressbar keeps animating, until you stop it.

**NOTE**: In `.indeterminate` progress type, no percentage will be displayed, even if `.percentage` style has been set (this configuration is still allowed by the library)

### Making a determinate progress bar progress
Whenever you want to update the progress of a progress bar with `.determinate` progress type, you can change the value of the `progress` property.
This value is a `CGFloat`, that must be between 0 and 1.
A value lower than 0 will be replaced with 0, a value greater than 1 will be replaced by 1.
Whenever you change this property, the progress bar changes its progress, with an animation.
If the style is `.percentage`, the integer percentage will be computed by multiplying by 100 and rounding the result, and displayed directly (no animation on the value of the label)

### Animating a indeterminate progress bar
Whenever you want to start animating a progress bar with `.indeterminate` progress type, you can call the method `startAnimationForIndeterminate()`. It will launch the running effect on the progress bar.

When you're finished and want to stop the animation, just call `stopAnimationForIndeterminate()` method. It will stop directly the animation without waiting for the end of a loop, and display only the track (or nothing if `showTrack` is `false`)

**NOTE**: Calling these two methods on a `.determinate` progress bar will have no effect

