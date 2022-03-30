//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI

@available(iOS 13, *)
extension UIFont {
    public var swiftUIFont: Font {
        Font(self as CTFont)
    }
}
