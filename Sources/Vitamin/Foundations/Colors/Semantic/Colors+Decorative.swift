//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension VitaminColor.Core {
    public enum Decorative {
        public static var amethyst: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Base.purple100.color,
                                 dark: VitaminColor.Base.purple600.color)
        }
        public static var brick: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Base.red100.color,
                                 dark: VitaminColor.Base.red600.color)
        }
        public static var cobalt: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Base.blue100.color,
                                 dark: VitaminColor.Base.blue600.color)
        }
        public static var emerald: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Base.green100.color,
                                 dark: VitaminColor.Base.green600.color)
        }
        public static var gold: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Base.yellow100.color,
                                 dark: VitaminColor.Base.yellow700.color)
        }
        public static var gravel: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Base.grey100.color,
                                 dark: VitaminColor.Base.grey600.color)
        }
        public static var jade: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Base.conifer100.color,
                                 dark: VitaminColor.Base.conifer700.color)
        }
        public static var saffron: UIColor {
            UIColor.dynamicColor(light: VitaminColor.Base.orange100.color,
                                 dark: VitaminColor.Base.orange600.color)
        }
    }
}
