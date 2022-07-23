//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public enum VitaminButtonStyle: String {
    case primary
    case primaryReversed
    case secondary
    case tertiary
    case conversion
    case ghost
    case ghostReversed
}

// MARK: - Background

public extension VitaminButtonStyle {
    func backgroundColor(for state: UIControl.State) -> UIColor {
        if state == .highlighted {
            return highlightedBackgroundColor
        } else {
            return defaultBackgroundColor
        }
    }

    var defaultBackgroundColor: UIColor {
        switch self {
        case .primary:
            return VitaminColor.Core.Background.brandPrimary
        case .primaryReversed:
            return VitaminColor.Core.Background.brandPrimaryReversed
        case .secondary:
            return VitaminColor.Core.Background.primary
        case .tertiary:
            return VitaminColor.Core.Background.brandSecondary
        case .conversion:
            return VitaminColor.Core.Background.accent
        case .ghost, .ghostReversed:
            return UIColor.clear
        }
    }

    var highlightedBackgroundColor: UIColor {
        switch self {
        case .primary:
            return VitaminColor.Core.Active.brand
        case .primaryReversed:
            return VitaminColor.Core.Active.brandReversedTransparent
        case .secondary, .ghost:
            return VitaminColor.Core.Active.primary
        case .tertiary:
            return VitaminColor.Core.Active.tertiary
        case .conversion:
            return VitaminColor.Core.Active.accent
        case .ghostReversed:
            return VitaminColor.Core.Active.primaryReversedTransparent
        }
    }
}

// MARK: - Foreground

public extension VitaminButtonStyle {
    var foregroundColor: UIColor {
        switch self {
        case .primary:
            return VitaminColor.Core.Content.primaryReversed
        case .primaryReversed:
            return VitaminColor.Core.Content.primary
        case .secondary, .tertiary:
            return VitaminColor.Core.Content.action
        case .conversion:
            return VitaminColor.Core.Content.accent
        case .ghost:
            return VitaminColor.Core.Content.active
        case .ghostReversed:
            return VitaminColor.Core.Content.actionReversed
        }
    }
}

// MARK: - Border

public extension VitaminButtonStyle {
    func borderColor(for state: UIControl.State) -> UIColor {
        if state == .highlighted {
            return highlightedBorderColor
        } else {
            return defaultBorderColor
        }
    }

    var defaultBorderColor: UIColor {
        switch self {
        case .primary,
                .primaryReversed,
                .tertiary,
                .conversion,
                .ghost,
                .ghostReversed:
            return UIColor.clear
        case .secondary:
            return VitaminColor.Core.Border.primary
        }
    }

    var highlightedBorderColor: UIColor {
        switch self {
        case .primary,
                .tertiary,
                .conversion,
                .ghost,
                .ghostReversed:
            return UIColor.clear
        case .primaryReversed:
            return VitaminColor.Core.Border.primaryReversed
        case .secondary:
            return VitaminColor.Core.Border.primary
        }
    }
}

// MARK: - Opacity

public extension VitaminButtonStyle {
    func opacity(for state: UIControl.State) -> CGFloat {
        if state == .disabled {
            return VitaminOpacity.disabled
        } else {
            return VitaminOpacity.enabled
        }
    }
}
