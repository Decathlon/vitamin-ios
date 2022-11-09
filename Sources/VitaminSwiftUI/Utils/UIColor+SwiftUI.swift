//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI

@available(iOS 13, *)
extension UIColor {
    public var swiftUIColor: Color {
        if #available(iOS 15.0, *) {
            return Color(uiColor: self)
        } else {
            guard let components = self.cgColor.components,
                    components.count > 2 else {
                return Color.clear
            }
            return Color(red: Double(components[0]),
                         green: Double(components[1]),
                         blue: Double(components[2]))
        }
    }
}
#endif
