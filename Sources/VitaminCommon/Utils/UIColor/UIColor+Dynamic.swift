//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit.UIColor

extension UIColor {
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13.0, *),
           VitaminColor.interfaceStyle == .auto {
            return UIColor { trait in
                trait.userInterfaceStyle == .dark ? dark : light
            }
        } else if VitaminColor.interfaceStyle == .dark {
            return dark
        } else {
            return light
        }
    }
}
