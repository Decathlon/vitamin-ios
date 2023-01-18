//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class ChipTableViewCell: UITableViewCell {
    @IBOutlet weak var smallChip: VitaminChip!
    @IBOutlet weak var mediumChip: VitaminChip!

    func update(
        config: VitaminChipDemoConfig
    ) {
        smallChip.text = config.text
        smallChip.variant = config.variant
        smallChip.size = .small
        smallChip.enabled = config.enabled

        mediumChip.text = config.text
        mediumChip.variant = config.variant
        mediumChip.size = .medium
        mediumChip.enabled = config.enabled
    }
}
