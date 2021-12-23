## Typography
[Reference](https://www.decathlon.design/726f8c765/p/860e14-typography/b/208916)

Vitamin provides a `TextStyle` enum you can easily use to generate `NSAttributedString` to be fed to your labels.
You can also provide a Vitamin semantic color to directly color your text.

```swift
import Vitamin

let vitaminStyledTitle = "This is an title".styled(as: .title1)
let vitaminStyledBody = "This is a body text".styled(as: .body)

let text = "This a is body text with positive semantic color"
var vitaminStyleBodySuccess: NSAttributedString = text.styled(as: .body, with:  VitaminColor.Core.Content.positive)
```
