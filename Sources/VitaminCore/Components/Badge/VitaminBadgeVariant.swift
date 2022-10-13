//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

/// enum containing the different variants of VitaminBadge
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
            return VitaminColor.Core.Background.alert
        }
    }

    public var foregroundColor: UIColor {
        switch self {
        case .standard, .reversed:
            return VitaminColor.Core.Content.primary
        case .accent:
            return VitaminColor.Core.Content.accent
        case .brand, .alert:
            return VitaminColor.Core.Content.primaryReversed
        }
    }

    public var borderColor: UIColor {
        if self == .standard {
            return VitaminColor.Core.Border.secondary
        }
        return .clear
    }

    public var borderWidth: CGFloat {
        if self == .standard {
            return 1
        }
        return 0
    }
}

/// enum containing the different variants of VitaminBadge
public enum VitaminBadgeSize {
    case small
    case medium
    case large

    public var textStyle: VitaminTextStyle {
        switch self {
        case .small:
            return VitaminTextStyle.badgeSmall
        case .medium:
            return VitaminTextStyle.badgeMedium
        case .large:
            return VitaminTextStyle.badgeLarge
        }
    }
}
