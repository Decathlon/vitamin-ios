//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

/// Enum that holds preoprties of a VitaminChip
public enum VitaminChipSize {
    case small, medium

    /// Text style used in VitaminChip depending on the size
    public var textStyle: VitaminTextStyle {
        switch self {
        case .small:
            return .footnoteBold
        case .medium:
            return .calloutBold
        }
    }

    /// Height of the VitaminChip depending on the size
    public var height: CGFloat {
        guard self == .medium  else {
            return 32
        }
        return 40
    }

    /// Horizontal pading and spacing in VitaminChip depending on the size
    public var horizontalSpacing: CGFloat {
        guard self == .medium  else {
            return 6
        }
        return 8
    }

    private var standardPadding: CGFloat {
        guard self == .medium else {
            return 12
        }
        return 16
    }

    private var reducedPadding: CGFloat {
        guard self == .medium else {
            return 8
        }
        return 10
    }
}
