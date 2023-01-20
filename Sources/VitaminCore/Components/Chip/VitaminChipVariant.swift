//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

/// Enum that holds info about a var
public enum VitaminChipVariant {
    case filter(state: VitaminChipVariantState, badge: Int?)
    case input(icon: UIImage? = nil, image: UIImage? = nil)
    case singleChoice(state: VitaminChipVariantState)
    case action(icon: UIImage)

    static let borderSelected: CGFloat = 0
    static let borderUnselected: CGFloat = 1

    /// Bakground color of the chip depending on the variant
    public func backgroundColor(pressed: Bool = false) -> UIColor {
        switch self {
        case let .filter(state, _), let .singleChoice(state):
            return pressed ? VitaminColor.Core.Active.brand : state.backgroundColor
        case .input, .action:
            return pressed ? VitaminColor.Core.Active.secondaryTransparent : VitaminColor.Core.Background.primary
        }
    }

    /// Border color of the chip depending on the variant
    public var borderColor: UIColor {
        switch self {
        case let .filter(state, _), let .singleChoice(state):
            return state.borderColor
        case .input, .action:
            return VitaminColor.Core.Border.inactive
        }
    }

    /// Border width of the chip depending on the variant
    public var borderWidth: CGFloat {
        switch self {
        case let .filter(state, _), let .singleChoice(state):
            return state.borderWidth
        case .input, .action:
            return Self.borderUnselected
        }
    }

    /// Text color of the chip depending on the variant
    public func textColor(pressed: Bool = false) -> UIColor {
        switch self {
        case let .filter(state, _), let .singleChoice(state):
            return pressed ? VitaminColor.Core.Content.primaryReversed : state.textColor
        case .input, .action:
            return VitaminColor.Core.Content.action
        }
    }
}

/// Enum that represent a state of the chip for some variants (`.filter` and `.singleChoice`)
public enum VitaminChipVariantState {
    case selected, unselected

    /// Background color of the chip depending on the state of the variant when relevant
    var backgroundColor: UIColor {
        switch self {
        case .selected:
            return VitaminColor.Core.Background.brandPrimary
        case .unselected:
            return VitaminColor.Core.Background.primary
        }
    }

    /// Border color of the chip depending on the state of the variant when relevant
    var borderColor: UIColor {
        switch self {
        case .selected:
            return .clear
        case .unselected:
            return VitaminColor.Core.Border.inactive
        }
    }

    /// Background width of the chip depending on the state of the variant when relevant
    var borderWidth: CGFloat {
        switch self {
        case .selected:
            return VitaminChipVariant.borderSelected
        case .unselected:
            return VitaminChipVariant.borderUnselected
        }
    }

    /// Text color of the chip depending on the state of the variant when relevant
    var textColor: UIColor {
        switch self {
        case .selected:
            return VitaminColor.Core.Content.primaryReversed
        case .unselected:
            return VitaminColor.Core.Content.action
        }
    }

    /// Method that returns the opposite state
    public func toggle() -> VitaminChipVariantState {
        guard self == .selected else {
            return .selected
        }
        return .unselected
    }
}
