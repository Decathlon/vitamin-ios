//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension VitaminColor.Core {
    public enum Hover {
        public static var primary: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Base.blue50.color,
                                 dark: VitaminColor.Base.blue700.color)
        }
        public static var primaryTransparent: UIColor {
            VitaminColor.Core.Background.brandPrimary.withAlphaComponent(0.05)
        }
        public static var secondaryTransparent: UIColor {
            VitaminColor.Core.Content.primary.withAlphaComponent(0.05)
        }
        public static var tertiaryTransparent: UIColor {
            let components = VitaminColor.Core.Hover.primary.hslComponents()
            return UIColor(hue: components.hue,
                           saturation: components.saturation,
                           brightness: components.lightness * 0.98,
                           alpha: 0.05)
        }
        public static var tertiary: UIColor {
            let components = VitaminColor.Core.Background.brandSecondary.hslComponents()
            return UIColor(hue: components.hue,
                           saturation: components.saturation,
                           brightness: components.lightness * 0.95,
                           alpha: 1)
        }
        public static var brand: UIColor {
            let components = VitaminColor.Core.Background.brandPrimary.hslComponents()
            return UIColor(hue: components.hue,
                           saturation: components.saturation,
                           brightness: components.lightness * 0.85,
                           alpha: 1)
        }
        public static var accent: UIColor {
            let components = VitaminColor.Core.Background.accent.hslComponents()
            return UIColor(hue: components.hue,
                           saturation: components.saturation,
                           brightness: components.lightness + (1 - components.lightness) * 0.48,
                           alpha: 1)
        }
        public static var primaryReversedTransparent: UIColor {
            VitaminColor.Core.Content.primaryReversed.withAlphaComponent(0.08)
        }
        public static var secondaryReversedTransparent: UIColor {
            VitaminColor.Core.Content.primaryReversed.withAlphaComponent(0.02)
        }
        public static var brandReversedTransparent: UIColor {
            VitaminColor.Core.Content.primaryReversed.withAlphaComponent(0.8)
        }
    }
}
