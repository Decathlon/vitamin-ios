//
//  Vitamin iOS
//  Apache License 2.0
//

import Foundation
import UIKit

extension UIColor {
    struct HSLComponents {
        let hue: CGFloat
        let saturation: CGFloat
        let lightness: CGFloat
    }

    // see https://en.wikipedia.org/wiki/HSL_and_HSV#Interconversion for algorithm
    func hslComponents() -> UIColor.HSLComponents {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0

        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: nil)

        let lightness = ((2.0 - saturation) * brightness) / 2.0

        switch lightness {
        case 0.0, 1.0:
            saturation = 0.0
        case 0.0..<0.5:
            saturation = (saturation * brightness) / (lightness * 2.0)
        default:
            saturation = (saturation * brightness) / (2.0 - lightness * 2.0)
        }

        return UIColor.HSLComponents(hue: hue, saturation: saturation, lightness: lightness)
    }

    /// Initializes a color from HSL (hue, saturation, lightness) components.
    /// - parameter hue: The hue component used to initialize the color.
    /// - parameter saturation: The saturation component used to initialize the color.
    /// - parameter lightness: The lightness component used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(hue: CGFloat, saturation: CGFloat, lightness: CGFloat, alpha: CGFloat = 1.0) {
        var hsbSaturation = saturation

        let temp = hsbSaturation * ((lightness < 0.5) ? lightness : (1.0 - lightness))
        let brightness = lightness + temp
        hsbSaturation = (lightness > 0.0) ? (2.0 * temp / brightness) : 0.0

        self.init(hue: hue, saturation: hsbSaturation, brightness: brightness, alpha: alpha)
    }
}
