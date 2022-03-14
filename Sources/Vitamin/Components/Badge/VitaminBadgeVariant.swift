//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

/// enum containing the different variants of VitaminTag
public enum VitaminBadgeVariant {
    case standard
    case brand
    case reversed
    case accent
    case alert

    public var backgroundColor: UIColor {
        switch self {
        case .standard:
            return VitaminColor.Core.Background.tertiary
        case .brand:
            return VitaminColor.Core.Background.brandPrimary
        case .reversed:
            return VitaminColor.Core.Background.brandPrimaryReversed
        case .accent:
            return VitaminColor.Core.Background.accent
        case .alert:
            return VitaminColor.Core.Background.discount
        }
    }

    var foregroundColor: UIColor {
        switch self {
        case .standard, .reversed, .accent:
            return VitaminColor.Core.Content.primary
        case .brand, .alert:
            return VitaminColor.Core.Content.primaryReversed
        }
    }

    var borderColor: UIColor {
        switch self {
        case .standard:
            return VitaminColor.Core.Border.secondary
        default:
            return .clear
        }
    }

    var borderWidth: CGFloat {
        if self == .standard {
            return 1
        }
        return 0
    }
}
