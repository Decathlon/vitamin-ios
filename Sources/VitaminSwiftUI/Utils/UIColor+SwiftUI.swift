//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI

@available(iOS 13, *)
extension UIColor {
    public var swiftUIColor: Color {
        if #available(iOS 15.0, *) {
            return Color(uiColor: self)
        } else {
            let components = self.cgColor.components
            return Color(red: Double(components?[0] ?? 0),
                         green: Double(components?[1] ?? 0),
                         blue: Double(components?[2] ?? 0))
        }
    }
}
