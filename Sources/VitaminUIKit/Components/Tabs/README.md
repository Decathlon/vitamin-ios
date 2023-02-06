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

Since it is a direct subclass of standard `UISegmentedControl`, it can be used exactly like this one.
