//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

extension VitaminChipSize {
    /// Horizontal leading padding depending on the current size and variant
    public func leadingPadding(variant: VitaminChipVariant) -> CGFloat {
        switch variant {
        case let .filter(state):
            // for
            guard state == .selected  else {
                return standardPadding
            }
            return reducedPadding
        case let .input(icon, image):
            guard icon != nil || image != nil else {
                return standardPadding
            }
            return reducedPadding
        case .singleChoice:
            return standardPadding
        case .action:
            return reducedPadding
        }
    }

    /// Horizontal trailing padding depending on the current size and variant
    public func trailingPadding(variant: VitaminChipVariant) -> CGFloat {
        switch variant {
        case .filter:
            return standardPadding
        case .input:
            return reducedPadding
        case .singleChoice:
            return standardPadding
        case .action:
            return standardPadding
        }
    }
}
