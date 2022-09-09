//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public enum VitaminButtonIconType {
    case trailing(image: UIImage, renderingMode: UIImage.RenderingMode? = .alwaysTemplate)
    case leading(image: UIImage, renderingMode: UIImage.RenderingMode? = .alwaysTemplate)
    case alone(image: UIImage, renderingMode: UIImage.RenderingMode? = .alwaysTemplate)
    case none
}

public extension VitaminButtonIconType {
    var imageEdgeInsets: UIEdgeInsets {
        switch self {
        case .alone, .none:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case .trailing:
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        case .leading:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        }
    }
}
