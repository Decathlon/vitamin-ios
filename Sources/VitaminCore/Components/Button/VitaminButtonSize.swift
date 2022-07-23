//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public enum VitaminButtonSize {
    case medium, large
}

public extension VitaminButtonSize {
    var textStyle: VitaminTextStyle {
        .button
    }

    var horizontalInset: CGFloat {
        switch self {
        case .medium: return 20
        case .large: return 40
        }
    }

    var verticalInset: CGFloat {
        switch self {
        case .medium: return 16
        case .large: return 20
        }
    }
}
