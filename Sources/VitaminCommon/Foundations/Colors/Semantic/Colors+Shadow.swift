//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension VitaminColor.Core {
    public enum Shadow {
        public static var shadow: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Base.blue600.color.withAlphaComponent(0.1),
                                 dark: VitaminColor.Base.blue200.color.withAlphaComponent(0.1))
        }
    }
}
