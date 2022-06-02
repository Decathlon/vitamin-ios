## Specificities for SwiftUI

The current version of Vitamin is available for iOS 10 but `SwiftUI` is only available for iOS 13 and above.  
To be compatible we need to add `@available(iOS 13, *)` for `SwiftUI` API.  
Also, iOS 10 is a 32 bits operating system and `SwiftUI` cannot compile for 32 bits. To be able to compile we need use the compilation directive `#if arch(x86_64) || arch(arm64)` for every files that use `SwiftUI`.  

```swift
#if arch(x86_64) || arch(arm64)
import SwiftUI

@available(iOS 13, *)
struct MyView: View {
    var body: some View {
        [...]
    }
}
#endif
```
