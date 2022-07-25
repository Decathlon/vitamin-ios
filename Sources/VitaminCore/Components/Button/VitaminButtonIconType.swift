//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public enum VitaminButtonIconType {
    case trailing(image: UIImage, renderingMode: UIImage.RenderingMode?)
    case leading(image: UIImage, renderingMode: UIImage.RenderingMode?)
    case alone(image: UIImage, renderingMode: UIImage.RenderingMode?)
    case none
}

public extension VitaminButtonIconType {
    var imageEdgeInsets: UIEdgeInsets {
        switch self {
        case .alone(_, _), .none:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case .trailing(_, _):
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        case .leading(_, _):
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        }
    }
}
