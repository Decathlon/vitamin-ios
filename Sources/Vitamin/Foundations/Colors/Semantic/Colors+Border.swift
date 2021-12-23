//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension VitaminColor.Core {
    public enum Border {
        public static var active: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.borderActive,
                                 dark: VitaminColor.Theme.Core.Dark.borderActive)
        }
        public static var inactive: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.borderInactive,
                                 dark: VitaminColor.Theme.Core.Dark.borderInactive)
        }
        public static var information: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.borderInformation,
                                 dark: VitaminColor.Theme.Core.Dark.borderInformation)
        }
        public static var negative: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.borderNegative,
                                 dark: VitaminColor.Theme.Core.Dark.borderNegative)
        }
        public static var positive: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.borderPositive,
                                 dark: VitaminColor.Theme.Core.Dark.borderPositive)
        }
        public static var primary: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.borderPrimary,
                                 dark: VitaminColor.Theme.Core.Dark.borderPrimary)
        }
        public static var primaryReversed: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.borderPrimaryReversed,
                                 dark: VitaminColor.Theme.Core.Dark.borderPrimaryReversed)
        }
        public static var secondary: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.borderSecondary,
                                 dark: VitaminColor.Theme.Core.Dark.borderSecondary)
        }
        public static var warning: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.borderWarning,
                                 dark: VitaminColor.Theme.Core.Dark.borderWarning)
        }
    }
}
