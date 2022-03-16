//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension VitaminColor.Core {
    public enum Active {
        public static var primary: UIColor {
            let components = VitaminColor.Core.Hover.primary.hslComponents()
            return UIColor(hue: components.hue,
                           saturation: components.saturation,
                           lightness: components.lightness + (1 - components.lightness) * 0.35,
                           alpha: 1)
        }

        public static var primaryTransparent: UIColor {
            VitaminColor.Core.Content.active.withAlphaComponent(0.15)
        }

        public static var secondaryTransparent: UIColor {
            VitaminColor.Core.Content.primary.withAlphaComponent(0.15)
        }

        public static var tertiary: UIColor {
            let components = VitaminColor.Core.Hover.primary.hslComponents()
            return UIColor(hue: components.hue,
                           saturation: components.saturation,
                           lightness: components.lightness * 0.93,
                           alpha: 1)
        }

        public static var tertiaryTransparent: UIColor {
            let components = VitaminColor.Core.Hover.primary.hslComponents()
            return UIColor(hue: components.hue,
                           saturation: components.saturation,
                           lightness: components.lightness * 0.94,
                           alpha: 0.8)
        }

        public static var brand: UIColor {
            let components = VitaminColor.Core.Background.brandPrimary.hslComponents()
            return UIColor(hue: components.hue,
                           saturation: components.saturation,
                           lightness: components.lightness * 0.7,
                           alpha: 1)
        }

        public static var accent: UIColor {
            let components = VitaminColor.Core.Background.accent.hslComponents()
            return UIColor(hue: components.hue,
                           saturation: components.saturation,
                           lightness: components.lightness + (1 - components.lightness) * 0.5,
                           alpha: 1)
        }

        public static var primaryReversedTransparent: UIColor {
            VitaminColor.Core.Content.primaryReversed.withAlphaComponent(0.25)
        }

        public static var secondaryReversedTransparent: UIColor {
            VitaminColor.Core.Content.primaryReversed.withAlphaComponent(0.4)
        }

        public static var tertiaryReversedTransparent: UIColor {
            VitaminColor.Core.Content.primaryReversed.withAlphaComponent(0.8)
        }

        public static var brandReversedTransparent: UIColor {
            VitaminColor.Core.Content.primaryReversed.withAlphaComponent(0.6)
        }
    }
}
