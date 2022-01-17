//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

final class IconCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ibImageView: UIImageView!
    @IBOutlet weak var ibLabel: UILabel!

    func setImage(_ image: UIImage, name: String, color: UIColor) {
        ibImageView.image = image.withRenderingMode(.alwaysTemplate)
        ibImageView.tintColor = color
        ibLabel.text = name
    }
}
