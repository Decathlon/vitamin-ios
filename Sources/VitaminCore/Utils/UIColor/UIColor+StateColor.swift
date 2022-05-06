//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit.UIColor

extension UIColor {
    /// function that provides any `UIColor` with a opacity of `VitaminOpacity.disabled`
    /// which is the default value to switch to disabled
    public func disabledColor() -> UIColor {
        self.withAlphaComponent(VitaminOpacity.disabled)
    }
}
