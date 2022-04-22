//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCommon

@available(iOS 13, *)
extension VitaminImageAsset {
    public var swiftUIImage: Image {
        image.swiftUIImage
            .renderingMode(.template)
    }
}
