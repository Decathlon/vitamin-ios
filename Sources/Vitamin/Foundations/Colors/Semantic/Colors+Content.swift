//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension VitaminColor.Core {
    public enum Content {
        public static var accent: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentAccent,
                                 dark: VitaminColor.Theme.Core.Dark.contentAccent)
        }
        public static var action: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentAction,
                                 dark: VitaminColor.Theme.Core.Dark.contentAction)
        }
        public static var actionReversed: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentActionReversed,
                                 dark: VitaminColor.Theme.Core.Dark.contentActionReversed)
        }
        public static var active: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentActive,
                                 dark: VitaminColor.Theme.Core.Dark.contentActive)
        }
        public static var inactive: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentInactive,
                                 dark: VitaminColor.Theme.Core.Dark.contentInactive)
        }
        public static var information: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentInformation,
                                 dark: VitaminColor.Theme.Core.Dark.contentInformation)
        }
        public static var negative: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentNegative,
                                 dark: VitaminColor.Theme.Core.Dark.contentNegative)
        }
        public static var positive: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentPositive,
                                 dark: VitaminColor.Theme.Core.Dark.contentPositive)
        }
        public static var primary: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentPrimary,
                                 dark: VitaminColor.Theme.Core.Dark.contentPrimary)
        }
        public static var primaryReversed: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentPrimaryReversed,
                                 dark: VitaminColor.Theme.Core.Dark.contentPrimaryReversed)
        }
        public static var secondary: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentSecondary,
                                 dark: VitaminColor.Theme.Core.Dark.contentSecondary)
        }
        public static var tertiary: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentTertiary,
                                 dark: VitaminColor.Theme.Core.Dark.contentTertiary)
        }
        public static var visited: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentVisited,
                                 dark: VitaminColor.Theme.Core.Dark.contentVisited)
        }
        public static var visitedReversed: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentVisitedReversed,
                                 dark: VitaminColor.Theme.Core.Dark.contentVisitedReversed)
        }
        public static var warning: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Theme.Core.Light.contentWarning,
                                 dark: VitaminColor.Theme.Core.Dark.contentWarning)
        }
    }
}
