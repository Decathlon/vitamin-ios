//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension UIImage {
    class func imageWithColor(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let ref = UIGraphicsGetCurrentContext()
        ref?.setFillColor(color.cgColor)
        ref?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
