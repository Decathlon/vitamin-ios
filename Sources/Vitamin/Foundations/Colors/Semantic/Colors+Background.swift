//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension VitaminColor.Core {
    public enum Background {
        public static var accent: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.backgroundAccent,
                                 dark: VitaminColor.Theme.Core.Dark.backgroundAccent)
        }
        public static var brandPrimary: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.backgroundBrandPrimary,
                                 dark: VitaminColor.Theme.Core.Dark.backgroundBrandPrimary)
        }
        public static var brandPrimaryReversed: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.backgroundBrandPrimaryReversed,
                                 dark: VitaminColor.Theme.Core.Dark.backgroundBrandPrimaryReversed)
        }
        public static var brandSecondary: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.backgroundBrandSecondary,
                                 dark: VitaminColor.Theme.Core.Dark.backgroundBrandSecondary)
        }
        public static var primary: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.backgroundPrimary,
                                 dark: VitaminColor.Theme.Core.Dark.backgroundPrimary)
        }
        public static var primaryReversed: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.backgroundPrimaryReversed,
                                 dark: VitaminColor.Theme.Core.Dark.backgroundPrimaryReversed)
        }
        public static var secondary: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.backgroundSecondary,
                                 dark: VitaminColor.Theme.Core.Dark.backgroundSecondary)
        }
        public static var tertiary: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.backgroundTertiary,
                                 dark: VitaminColor.Theme.Core.Dark.backgroundTertiary)
        }
        public static var alert: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.backgroundAlert,
                                 dark: VitaminColor.Theme.Core.Dark.backgroundAlert)
        }
        @available(*, deprecated, renamed: "alert")
        public static var discount: UIColor = alert
    }
}
