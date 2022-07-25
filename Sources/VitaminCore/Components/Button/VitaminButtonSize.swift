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

    func horizontalInset(iconType: VitaminButtonIconType) -> CGFloat {
        if case .alone(_, _) = iconType {
            return 12
        }

         switch self {
         case .medium: return 20
         case .large: return 40
         }
    }
     
    func verticalInset(iconType: VitaminButtonIconType) -> CGFloat {
        if case .alone(_, _) = iconType {
            return 12
        }

        switch self {
        case .medium: return 16
        case .large: return 20
        }
    }
    
    
    func defaultIconSize(iconType: VitaminButtonIconType) -> CGFloat {
        if case .alone(_, _) = iconType {
            switch self {
            case .medium : return 24
            case .large: return 32
            }
        } else {
            switch self {
            case .medium : return 20
            case .large: return 24
            }
        }
    }

}
