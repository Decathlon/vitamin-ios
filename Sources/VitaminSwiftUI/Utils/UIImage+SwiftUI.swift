//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI

@available(iOS 13, *)
extension UIImage {
    public var swiftUIImage: Image {
        Image(uiImage: self)
    }
}
