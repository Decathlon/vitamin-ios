//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension UIImage {
    func resizedImage(size sizeImage: CGSize) -> UIImage? {
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: sizeImage.width, height: sizeImage.height))
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        self.draw(in: frame)
        let resizedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.withRenderingMode(self.renderingMode)
        return resizedImage
    }
}
