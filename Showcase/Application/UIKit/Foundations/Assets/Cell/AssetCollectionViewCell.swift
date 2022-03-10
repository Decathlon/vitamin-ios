//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

final class AssetCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var assetImageView: UIImageView!
    @IBOutlet weak var assetNameLabel: UILabel!

    func setImage(_ image: UIImage, name: String, textColor: UIColor) {
        assetImageView.image = image
        assetNameLabel.text = name
        assetNameLabel.textColor = textColor
    }
}
