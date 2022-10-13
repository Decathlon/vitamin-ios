## Typography
[Reference](https://www.decathlon.design/726f8c765/p/860e14-typography/b/208916)

Vitamin provides a `TextStyle` enum:
- `display`
- `largeTitle1`
- `largeTitle2`
- `title1`
- `title2`
- `title3`
- `headline`
- `body`
- `bodyBold`
- `callout`
- `calloutBold`
- `subhead`
- `footnote`
- `footnoteBold`
- `caption1`
- `caption2`

With the enum you can easily generate a `NSAttributedString` to be fed to your labels.
You can also provide a Vitamin semantic color to directly color your text.

```swift
import Vitamin

let vitaminStyledTitle = "This is a title".styled(as: .title1)
let vitaminStyledBody = "This is a body text".styled(as: .body)

let text = "This a is a body text with positive semantic color"
var vitaminStyleBodySuccess: NSAttributedString = text.styled(as: .body, with: VitaminColor.Core.Content.positive)

let text = "This a is a caption text with custom line break mode"
var vitaminStyleCaption: NSAttributedString = text.styled(as: .caption1, lineBreakMode: .byWordWrapping)
```
