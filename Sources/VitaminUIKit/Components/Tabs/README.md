## Tab
[Reference](https://www.decathlon.design/726f8c765/v/0/p/705308-tabs/b/66de8b)

Vitamin provides a `VitaminTabs` class which handles specific colors and typography for selected and unselected items.

```swift
import Vitamin

// This segmented control will have two options, the first item will be selected and in footnoteBold text style and blue
let twoTabs = VitaminTabs(items: ["One", "Two"])
twoTabs.selectedSegmentIndex = 0

// This  segmented control will have three options, the second item will be selected and in footnoteBold text style and blue
let threeTabs = VitaminTabs(items: ["One", "Two", "Three"])
threeTabs.selectedSegmentIndex = 1

// This  segmented control will have four options, the third item will be selected and in footnoteBold text style and blue
let fourTabs = VitaminTabs(items: ["One", "Two", "Three", "Four"])
fourTabs.selectedSegmentIndex = 3
```

### Standard use
Since it is a direct subclass of standard `UISegmentedControl`, it can be used exactly like this one.

### Common use case
A common use case of `VitaminTabs` is to use it at the top of a view, and display a viewController below, depending on the selected tab.
In order to ease this use case, Vitamin provides a `VitaminTabsController`.

You can only instantiate it by ocde (not in a storyboard or xib), and the constructor takes the following parameters:
- an array of `UIViewController`: the list of controllers you want to display below the `VitaminTabs`. Each view controller should have a `title`, because this title will be displayed as value for each tab
- a `defaultTabIndex` `Int`: represents the tab index that will be selected at first display
- a boolean `fullWidthTabs`: indicates if the tabs (that will always be centered horizontally in view) should take the width of the view (with a padding of 10px on each side), or should juste take the needed space for displaying the labels. Default value is false
- a `tabsTopMargin` `CGFloat`: represents the space between the top of the safe area and th top of the `VitaminTabs`. Default value is 10
- a `tabsBottomMargin` `CGFloat`: represents the space between the bottom of the `VitaminTabs` and the view that will host the viewControllers. Default value is 10

Each of these parameters, except `defaultTabIndex` which has no sens after initialization, can be set afterwards.

⚠️ if you want to modify the list of viewControllers, please do not modify the list directly, but recreate a new list, et reset it to the `viewControllers` property.

```swift
// SampleTabViewController is just a example of viewController that has a centered label
let firstVc = SampleTabViewController()
firstVc.sampleText = "First ViewController"
firstVc.title = "First"

let secondVc = SampleTabViewController()
secondVc.sampleText = "Second ViewController"
secondVc.title = "Second"

let thirdVc = SampleTabViewController()
thirdVc.sampleText = "Third ViewController"
thirdVc.title = "Third"

// this will display a `VitaminTabs` with "First", "Second", "Third" semgents,
// the `VitaminTabs` component will tke full wodth o the screen
// and by default, the "Second" index will be selected (and secondVc dislayed below)
let tabVc = VitaminTabsController([firstVc, secondVc, thirdVc], defaultTabIndex: 1)
tabVc.title = "VitaminTabsController"
tabVc.fullWidthTabs = true

self.navigationController?.pushViewController(tabVc, animated: true)
```
