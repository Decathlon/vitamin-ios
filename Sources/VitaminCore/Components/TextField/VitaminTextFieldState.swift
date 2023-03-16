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
    /// The border color of a `VitaminTextField` for a specific state.
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

    /// The text color of a `VitaminTextField` for a specific state.
    public var textColor: UIColor {
        if self == .disabled {
            return VitaminColor.Core.Content.primary.disabledColor()
        } else {
            return VitaminColor.Core.Content.primary
        }
    }

    /// The label color of a `VitaminTextField` for a specific state and style.
    /// - Parameter style: The current used style.
    /// - Returns: The color value with the current state and current style.
    public func labelColor(style: VitaminTextFieldStyle) -> UIColor {
        var color = VitaminColor.Core.Content.primary
        if style == .filled {
            color = VitaminColor.Core.Content.tertiary
        }
        if self == .disabled {
            return color.disabledColor()
        } else {
            return color
        }
    }

    /// The icon color of a `VitaminTextField` for a specific state.
    public var iconColor: UIColor {
        switch self {
        case .error:
            return VitaminColor.Core.Content.negative
        case .success:
            return VitaminColor.Core.Content.positive
        case .disabled:
            return VitaminColor.Core.Content.primary.disabledColor()
        default:
            return VitaminColor.Core.Content.primary
        }
    }

    /// The color of the optionals helper text and counter of a `VitaminTextField` for a specific state.
    public var helperAndCounterColor: UIColor {
        switch self {
        case .error:
            return VitaminColor.Core.Content.negative
        case .disabled:
            return VitaminColor.Core.Content.secondary.disabledColor()
        default:
            return VitaminColor.Core.Content.tertiary
        }
    }

    /// The placeholder color of a `VitaminTextField`for a specific state.
    public var placeholderColor: UIColor {
        if self == .disabled {
            return VitaminColor.Core.Content.tertiary.disabledColor()
        } else {
            return VitaminColor.Core.Content.tertiary
        }
    }

    /// The default icon displayed in a `VitaminTextField` for a specific state.
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

    /// The border width of a `VitaminTextField` for a specific state.
    public var borderWidth: CGFloat {
        if self == .error || self == .active || self == .success {
            return 2.0
        } else {
            return 1.0
        }
    }
}
