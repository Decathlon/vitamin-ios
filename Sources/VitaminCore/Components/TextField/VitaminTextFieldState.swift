//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

/// Enum representing the state of a `VitaminTextField`.
public enum VitaminTextFieldState: String {
    case error
    case success
    case disabled
    case active
    case standard
}

extension VitaminTextFieldState {
    /// the border color of a `VitaminTextField` for a specific state
    public var borderColor: UIColor {
        switch self {
        case .error:
            return VitaminColor.Core.Border.negative
        case .success:
            return VitaminColor.Core.Border.positive
        case .disabled:
            return VitaminColor.Core.Border.inactive
        case .active:
            return VitaminColor.Core.Border.active
        case .standard:
            return VitaminColor.Core.Border.primary
        }
    }

    /// The text color of a `VitaminTextField` for a specific state
    public var textColor: UIColor {
        if self == .disabled {
            return VitaminColor.Core.Content.primary.disabledColor()
        } else {
            return VitaminColor.Core.Content.primary
        }
    }

    /// the icon color of a `VitaminTextField` for a specific state
    /// It is only applied for default icon, i.e. success and failure icons
    ///  For custom icons, cutomIconColor will be used
    public var standardIconColor: UIColor {
        switch self {
        case .error:
            return VitaminColor.Core.Content.negative
        case .success:
            return VitaminColor.Core.Content.positive
        default:
            return VitaminColor.Core.Content.primary
        }
    }

    /// the icon color of a `VitaminTextField` for a specific state
    /// It is only applied for custom icon, i.e. ison provided by the caller
    public var customIconColor: UIColor {
        if self == .disabled {
            return VitaminColor.Core.Content.primary.disabledColor()
        } else {
            return VitaminColor.Core.Content.primary
        }
    }

    /// the color of the optionals helper text and counter of a `VitaminTextField` for a specific state
    public var helperAndCounterColor: UIColor {
        switch self {
        case .error:
            return VitaminColor.Core.Content.negative
        case .disabled:
            return VitaminColor.Core.Content.secondary.disabledColor()
        default:
            return VitaminColor.Core.Content.secondary
        }
    }

    /// the placeholder color of a `VitaminTextField`for a specific state
    public var placeholderColor: UIColor {
        if self == .disabled {
            return VitaminColor.Core.Content.tertiary.disabledColor()
        } else {
            return VitaminColor.Core.Content.tertiary
        }
    }

    /// the default icon diaplyed in a `VitaminTextField` for a specific state
    public var icon: UIImage? {
        switch self {
        case .error:
            return Vitamix.Line.System.errorWarning.image
        case .success:
            return Vitamix.Line.System.check.image
        default:
            return nil
        }
    }

    /// the border width of a `VitaminTextField` for a specific state
    public var borderWidth: CGFloat {
        if self == .error || self == .active || self == .success {
            return 2.0
        } else {
            return 1.0
        }
    }
}
