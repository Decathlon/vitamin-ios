//
//  Vitamin iOS
//  Apache License 2.0
//

import Foundation

extension VitaminColor {
    public static var interfaceStyle: VitaminColor.InterfaceStyle = {
        if #available(iOS 13.0, *) {
            return .auto
        } else {
            return .light
        }
    }()

    public enum InterfaceStyle {
        @available(iOS 13.0, *)
        case auto
        case light
        case dark
    }
}
