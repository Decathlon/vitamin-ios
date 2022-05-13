//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
extension VitaminAsset {
    public var swiftUIImage: Image {
        image.swiftUIImage
    }
}
#endif
