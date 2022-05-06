//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

/// enum containing the different variants of VitaminTag
public enum VitaminTagVariant {
    case brandAccent
    case brandPrimary
    case brandAlert
    case decorativeAmethyst
    case decorativeBrick
    case decorativeCobalt
    case decorativeEmerald
    case decorativeGold
    case decorativeGravel
    case decorativeJade
    case decorativeSaffron

    public var backgroundColor: UIColor {
        switch self {
        case .brandPrimary:
            return VitaminColor.Core.Background.brandPrimary
        case .brandAccent:
            return VitaminColor.Core.Background.accent
        case .brandAlert:
            return VitaminColor.Core.Background.alert
        case .decorativeAmethyst:
            return VitaminColor.Core.Decorative.amethyst
        case .decorativeBrick:
            return VitaminColor.Core.Decorative.brick
        case .decorativeCobalt:
            return VitaminColor.Core.Decorative.cobalt
        case .decorativeEmerald:
            return VitaminColor.Core.Decorative.emerald
        case .decorativeGravel:
            return VitaminColor.Core.Decorative.gravel
        case .decorativeGold:
            return VitaminColor.Core.Decorative.gold
        case .decorativeJade:
            return VitaminColor.Core.Decorative.jade
        case .decorativeSaffron:
            return VitaminColor.Core.Decorative.saffron
        }
    }

    public var foregroundColor: UIColor {
        switch self {
        case .brandAlert, .brandPrimary:
            return VitaminColor.Core.Content.primaryReversed
        case .brandAccent:
            return VitaminColor.Core.Content.accent
        default:
            return VitaminColor.Core.Content.primary
        }
    }
}
