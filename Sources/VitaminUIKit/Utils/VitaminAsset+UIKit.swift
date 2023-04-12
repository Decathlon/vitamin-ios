//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension VitaminAsset {
    public var image: UIImage {
        guard let resultImage = optionalImage else {
            fatalError("Unable to load image asset named \(name).")
        }
        return resultImage
    }

    public var optionalImage: UIImage? {
#if os(iOS) || os(tvOS)
        let resultImage = UIImage(named: paymentMapper[name, default: name], in: bundle, compatibleWith: nil)
#elseif os(watchOS)
        let resultImage = UIImage(named: name)
#endif
        return resultImage
    }
}

public extension UIImage {
    convenience init?(asset: VitaminAsset) {
#if os(iOS) || os(tvOS)
        self.init(named: asset.name, in: asset.bundle, compatibleWith: nil)
#elseif os(watchOS)
        self.init(named: asset.name)
#endif
    }
}
