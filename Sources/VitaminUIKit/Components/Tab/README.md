## Tab
[Reference](https://www.decathlon.design/726f8c765/v/0/p/705308-tabs/b/66de8b)

Vitamin provides a `VitaminTab` class which handles specific colors and typography for selected and unselected items.

```swift
import Vitamin

// This switch will have a two options, the first item will be selected and in footNoteBold text style and blue
let twoTabs: VitaminTab = = VitaminTab(items: ["One", "Two"])
twoTabs.selectedSegmentIndex = 0

// This switch will have a three options, the second item will be selected and in footNoteBold text style and blue
let threeTabs: VitaminTab = VitaminTab(items: ["One", "Two", "Three"])
threeTabs.selectedSegmentIndex = 1

// This switch will have a four options, the third item will be selected and in footNoteBold text style and blue
let fourTabs: VitaminTab = VitaminTab(items: ["One", "Two", "Three", "Four"])
tabs.selectedSegmentIndex = 3
```

Since it is a direct subclass of standard `UISegmentedControl`, it can be used exactly like this one.
