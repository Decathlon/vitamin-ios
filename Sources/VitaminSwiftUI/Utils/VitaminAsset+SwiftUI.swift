//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
extension VitaminAsset {
    public var image: Image {
        guard let resultImage = optionalImage else {
            fatalError("Unable to load image asset named \(name).")
        }
        return resultImage
    }

    public var optionalImage: Image? {
#if os(iOS) || os(tvOS)
        let resultImage = Image(name, bundle: bundle)
#elseif os(watchOS)
        let resultImage = Image(name)
#endif
        return resultImage
    }
}
#endif
