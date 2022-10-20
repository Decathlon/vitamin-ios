//
//  Vitamin iOS
//  Apache License 2.0
//

import Foundation

/// enum containing the different size of VitaminBadge
public enum VitaminBadgeSize: CaseIterable {
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
