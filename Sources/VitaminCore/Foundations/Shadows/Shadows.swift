//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public enum VitaminShadow: String {
    case shadow100
    case shadow200
    case shadow300
    case shadow400
    case none

    /// Blur value of the shadow, and height
    public var blur: CGFloat {
        switch self {
        case .shadow100:
            return 6
        case .shadow200:
            return 12
        case .shadow300:
            return 24
        case .shadow400:
            return 48
        case .none:
            return 0
        }
    }

    /// Size of the shadow, i.e. offset of the light source creating the shadow
    public var size: CGSize {
        // In fact, in Vitamin, the blur always equals to the height, we reuse the property to avoid duplication
        // If this changes in the future, we will just have to provide the independant value
        CGSize(width: 0, height: self.blur)
    }

    /// Spread value of the shadow
    /// Always 0 at the moment, but could evolve, that is why this property exists
    public var spread: CGFloat {
        0
    }

    /// Opacity of the shadow
    public var opacity: Float {
        if self == .none {
            return 0
        }
        return 1
    }

    /// Color of the shadow
    /// For the moment, it is the same for dark and light mode
    public var color: UIColor {
        if self == .none {
            return UIColor.clear
        }
        return VitaminColor.Core.Shadow.shadow
    }
}
