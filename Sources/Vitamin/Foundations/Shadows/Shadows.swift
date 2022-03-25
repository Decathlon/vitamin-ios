//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public enum VitaminShadow: String {
    case shadow100
    case shadow200
    case shadow300
    case shadow400
    case none

    /// Blur value of the shadow, and height
    var blur: CGFloat {
        switch self {
        case .shadow100:
            return 6
        case .shadow200:
            return 12
        case .shadow300:
            return 24
        case .shadow400:
            return 48
        case .none:
            return 0
        }
    }

    /// Size of the shadow, i.e. offset of the light source creating the shadow
    var size: CGSize {
        // In fact, in Vitamin, the blur always equals to the height, we reuse the property to avoid duplication
        // If this changes in the future, we will just have to provide the independant value
        CGSize(width: 0, height: self.blur)
    }

    /// Spread value of the shadow
    /// Always 0 at the moment, but could evolve, that is why this property exists
    var spread: CGFloat {
        0
    }

    /// Opacity of the shadow
    var opacity: Float {
        if self == .none {
            return 0
        }
        return 1
    }

    /// Color of the shadow
    /// For the moment, it is the same for dark and light mode
    var color: UIColor {
        if self == .none {
            return UIColor.clear
        }
        return VitaminColor.Core.Shadow.shadow
    }
}

extension UIView {
    /// Drops a shadow below this view.
    /// - Parameters shadowType : the `VitaminShadow`you wqnt to drop
    /// Since the shadow os added to the layer of the view, the background color is
    /// forwarded from the view to the view'layer not to overlay the shadow
    public func dropShadow(shadowType: VitaminShadow) {
        layer.applyShadow(
            color: shadowType.color,
            opacity: shadowType.opacity,
            shadowSize: shadowType.size,
            blur: shadowType.blur,
            spread: shadowType.spread)

        if let backgroundCGColor = backgroundColor?.cgColor, shadowType != .none {
            backgroundColor = nil
            layer.backgroundColor = backgroundCGColor
        }
    }

    /// Remove any shadow from this view by resetting all shadow properties on the view's layer
    /// The layer background color is set back to the view if the layer color is not nil and the view's one is nil
    public func removeShadow() {
        dropShadow(shadowType: .none)

        if let backgroundCGColor = backgroundColor?.cgColor, backgroundColor == nil {
            layer.backgroundColor = nil
            backgroundColor = UIColor(cgColor: backgroundCGColor)
        }
    }
}

extension CALayer {
    /// Convenience mathod to apply a shadow on a CALayer
    /// - Parameters:
    ///     - color: the `UIColor` of the shadow
    ///     - opacity: the opacity of the shadow
    ///     - shadowSize: a `CGSize`defining the position of the light source
    ///     - blur: blur of the shadow, as defined in Figma
    ///     - spread: spread of the shadow, as defined in Figma
    func applyShadow(
        color: UIColor = .black,
        opacity: Float = 0.5,
        shadowSize: CGSize = CGSize(width: 0, height: 2),
        blur: CGFloat = 4,
        spread: CGFloat = 0
    ) {
            masksToBounds = false
            shadowColor = color.cgColor
            shadowOpacity = opacity
            shadowOffset = shadowSize
            // the shadow radius in iOS is equals to the blur divided by the screen scale
            shadowRadius = blur / UIScreen.main.scale
            if spread == 0 {
                shadowPath = nil
            } else {
                let deltaX = -spread
                let rect = bounds.insetBy(dx: deltaX, dy: deltaX)
                shadowPath = UIBezierPath(rect: rect).cgPath
            }
    }
}
