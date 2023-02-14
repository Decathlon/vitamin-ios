## SegmentedControl
[Reference](https://www.decathlon.design/726f8c765/v/0/p/705308-tabs/b/66de8b)

Vitamin provides a `VitaminSegmentedControl` class which handles specific colors and typography for selected and unselected items.

```swift
import Vitamin

// This segmented control will have two options, the first item will be selected and in footnoteBold text style and blue
let twoSegments = VitaminSegmentedControl(items: ["One", "Two"])
twoSegments.selectedSegmentIndex = 0

// This  segmented control will have three options, the second item will be selected and in footnoteBold text style and blue
let threeSegments = VitaminSegmentedControl(items: ["One", "Two", "Three"])
threeSegments.selectedSegmentIndex = 1

// This  segmented control will have four options, the third item will be selected and in footnoteBold text style and blue
let fourSegments = VitaminSegmentedControl(items: ["One", "Two", "Three", "Four"])
fourSegments.selectedSegmentIndex = 2
```

### Standard use
Since it is a direct subclass of standard `UISegmentedControl`, it can be used exactly like this one.

### Common use case
A common use case of `VitaminSegmentedControl` is to use it at the top of a view, and display a viewController below, depending on the selected segment.
In order to ease this use case, Vitamin provides a `VitaminSegmentedControlController`.

You can only instantiate it by code (not in a storyboard or xib), and the constructor takes the following parameters:
- an array of `UIViewController`: the list of controllers you want to display below the `VitaminSegmentedControl`. Each view controller should have a `title`, because this title will be displayed as value for each segment.
- a `defaultSegmentIndex` `Int`: represents the segment index that will be selected at first display
- a boolean `fullWidthSegmentedControl`: indicates if the segmented control (that will always be centered horizontally in view) should take the width of the view (with a padding of 10px on each side), or should just take the needed space for displaying the labels. Default value is false.
- a `segmentedControlTopMargin` `CGFloat`: represents the space between the top of the safe area and the top of the `VitaminSegmentedControl`. Default value is 10.
- a `segmentedControlBottomMargin` `CGFloat`: represents the space between the bottom of the `VitaminSegmentedControl` and the view that will host the viewControllers. Default value is 10.

Each of these parameters, except `defaultSegmentIndex` which has no sense after initialization, can be set afterwards.

⚠️ if you want to modify the list of `viewControllers`, please do not modify the list directly, but recreate a new list, et reset it to the `viewControllers` property.

```swift
// SampleLabelViewController is just a example of viewController that has a centered label
let firstVc = SampleLabelViewController()
firstVc.sampleText = "First ViewController"
firstVc.title = "First"

let secondVc = SampleLabelViewController()
secondVc.sampleText = "Second ViewController"
secondVc.title = "Second"

let thirdVc = SampleLabelViewController()
thirdVc.sampleText = "Third ViewController"
thirdVc.title = "Third"

// this will display a `VitaminSegmentedControl` with "First", "Second", "Third" segments,
// the `VitaminSegmentedControl` component will the full width of the screen
// and by default, the "Second" index will be selected (and secondVc dislayed below)
let segmentedControlVc = VitaminSegmentedControlController([firstVc, secondVc, thirdVc], defaultSegmentIndex: 1)
segmentedControlVc.title = "VitaminSegmentedControlController"
segmentedControlVc.fullWidthSegmentedControl = true

self.navigationController?.pushViewController(segmentedControlVc, animated: true)
```
