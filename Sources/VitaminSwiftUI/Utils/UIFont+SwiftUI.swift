//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI

@available(iOS 13, *)
extension UIFont {
    public var swiftUIFont: Font {
        Font(self as CTFont)
    }
}
#endif
