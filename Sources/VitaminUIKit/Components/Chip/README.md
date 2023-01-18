## Chip
[Reference](https://www.decathlon.design/726f8c765/p/08dbe1-chip/b/459b4b)

Vitamin provides a `VitaminChip` class which displays a chip

```swift
import Vitamin

// This chip progress bar will have a "Chip" text, should be used in filtering items, will be in unselected state with no badge, in medium size, and will be disables
let chip = VitaminChip(
            text: "Chip",
            variant: .filter(state: .unselected, badge: nil),
            size: .medium,
            action: nil,
            enabled: false

// For further details and code samples, see below
```

### Text
The `VitaminChip`has always a mandatory text, that can be set either by the `text` parameter of the constructor, or by setting the `text` property on an already created `VitaminChip`.

```swift
import Vitamin

// This chip will have a "test" text
var chip = VitaminChip(text: "test")

// You can change the text to "another test" like that
chip.text = "another test"
```

### Size
This chip exists in two sizes:
- Small
- Medium

Thi size is technically represented by the `VitaminChipSize` enum, which has two cases:
- `.small`
- `.medium`

Default size is `.medium`.

You can specify the size you want either by setting the `size` parameter in the constructor, or by setting the `size` property on an already created `VitaminChip`.

```swift
import Vitamin

// This chip will be in medium size
let chip = VitaminChip(text: "test", size: .medium)

// You can pass it in small size
chip.size = .small
```

### Variant
This chip exists in 4 variants:
- Action
- Input
- Single Choice
- Filter

These different variants are represented by the `VitaminChipVariant` enum, wifth 4 cases:
- `.action`
- `.input`
- `.singleChoice`
- `.filter`

Each of these cases have associated values to specify additional properties only relevant for each variant.

Default value is `.filter(state: .unselected, badge: nil)` (see below).


#### Action Variant
The action chip has a mandatory icon on the left hand side of the `VitaminChip`'s text.
This icon will be colored and resized to 20px x 20px.
You can specify it via the icon associated value of the variant

```swift
import Vitamin

// This chip will have a settings icon
let chip = VitaminChip(text: "test", variant: .action(icon: Vitamix.Line.System.settings.image))

// You can change the icon
chip.variant = .action(icon: Vitamix.Line.Map.mapPin.image)
```

#### Input Variant
The input variant is a chip that you can dynamically add after the user has typed and validated an input.
It always has a close icon on the right hand side of the text, to indicate it can be dismissed.
It can have either an icon or an image on the left hand side of the text.

If you provide an icon, it wil be colored and resized to 20px x 20px.
If you provide an image, it will be ronded and resized to 20px x 20px.
If you provide both, only icon will be taken in account.

You can specify icon or image via the `icon` or `image` associated values ofthe variant.

⚠️ The dismissal of the chip is not iplemented in this library, it is up to you to dismiss the chip when clicked (see #action below)

```swift
import Vitamin

let chip = VitaminChip(text: "test", variant: .input())
chip.variant = .input(icon: Vitamix.Line.System.settings.image)

let anotherChip = VitaminChip(text: "test", variant: .input())
chip.variant = .input(image: VitaminAssets.Placeholder.landscape.image)`

let chipWithImage = VitaminChip(text: "test", variant: .input(image: VitaminAssets.Placeholder.landscape.image))

let chipWithIcon = VitaminChip(text: "test", variant: .input(icon: Vitamix.Line.System.settings.image))
```



#### Single choice variant
The single choice variant is meant to be used in a group of `VitaminChip`, in which only one chip could be selected at a time.

You can provide a `VitaminChipVariantState` in the state associated value of the variant.
It is an enum with two cases:
- `.selected`
- `.unselected`

To change the state, you have to change the whole variant property with a property new `VitaminChipVariant` with the opossite state.
To help you in that, the `VitaminChipVariantState` provides a `toggle()` method that will return the opposite state.

The change of state on click is handled by the component : each time you touch the component, it will toggle to opposite state.

⚠️ The change of state of other single choice `VitaminChip`in the same group is not handled by this library, it is up to you to ahndle that when clicked (see #action).

let chip = VitaminChip(text: "test", variant: .singleChoice(state: .unselected))

```swift
import Vitamin

let chip = VitaminChip(text: "test", variant: .singleChoice(state: .unselected))

// you can toogle the state
if case let .singleChoice(state) = chip.variant {
    chip.variant = .singleChoice(state: state.toggle())
}

// or set it by replacing the variant
chip.variant = .singleChoice(state: .unselected)
```


#### Filter variant
This variant should be used when you want to express the filtering of a list.

You can provide a `VitaminChipVariantState` in the state associated value of the variant.
It is the same enum than for `.singleChoice` variant :
- `.selected`
- `.unselected`

As for single choice variant, to change the state, you have to change the whole variant property with a property new `VitaminChipVariant` with the oposite state.
To help you in that, the `VitaminChipVariantState` provides a `toggle()` method that will return the opposite state.

When selected, the chip will hazve a check icon on the left hand side of the text, thus its width will change.

The change of state on click is handled by the component : each time you touch the component, it will toggle to opposite state.

It can also have a badge which indicates the number of elements matching the filter.

```swift
import Vitamin

let chip = VitaminChip(text: "test", variant: .filter(state: .unselected, badge: 12)

// you can toogle the state or modify the badge from the current value
if case let .filter(state, badge) = chip.variant {
    chip.variant = .filter(state: state.toggle(), badge + 1)
}

// you can replace them
chip.variant = .filter(state: .unselected, badge: 12)

// You can also create a chip without badge
let anotherChip = VitaminChip(text: "test", variant: .filter(state: .unselected)
```


### Enabling a chip
A chip can be disabled, by changing te value of the `enabled` boolean property, or the `enabled` constructor parameter.
The disabling will have an impact on the color, the ability to change state, and the ability to launch an action.

Default value is `true`.

```swift
import Vitamin

// You can create a disabled 
var chip = VitaminChip(text: "test", enabled: false)

// You can enable it
chip.enabled = true
```



### Action
You can provide an action that will be triggered when you tap on the chip.
This action is a closure, that takes the tapped `VitaminChip` as only parameter.

This is settable through the `action` property, or the or the `action` constructor parameter.

Typcally, it is here than you have to handle the change of state for other single choice chips, or the dismissal of input chips.

```swift
import Vitamin

let action : (VitaminChip) -> Void = { chip in 
    print chip.text
}

let chip = VitaminChip(text: "test", action: action)

let anotherChip = VitaminChip(text: "test")
anotherChip.action = action
```
