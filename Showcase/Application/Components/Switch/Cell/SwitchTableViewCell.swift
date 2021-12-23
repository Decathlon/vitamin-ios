//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

class SwitchTableViewCell: UITableViewCell {
    @IBOutlet weak var vitaminSwitch: VitaminSwitch!

    func update(enabled: Bool = true, isOn: Bool = true) {
        self.vitaminSwitch.isOn = isOn
        self.vitaminSwitch.isEnabled = enabled
    }
}
