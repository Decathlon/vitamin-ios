//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

final class IconCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconNameLabel: UILabel!

    func setImage(_ image: UIImage, name: String, color: UIColor) {
        iconImageView.image = image.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = color
        iconNameLabel.text = name
        iconNameLabel.textColor = color
    }
}
