//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var vitaminTag: VitaminTag!

    func update(config: VitaminTagDemoConfig) {
        vitaminTag.label = config.text
        vitaminTag.variant = config.variant
        vitaminTag.icon = config.image
    }
}
