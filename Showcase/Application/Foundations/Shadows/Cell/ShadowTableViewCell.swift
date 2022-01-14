//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

public class ShadowTableViewCell: UITableViewCell {
    @IBOutlet weak var exampleLabel: UILabel!

    func update(for shadowType: VitaminShadow) {
        exampleLabel.removeShadow()
        exampleLabel.layer.cornerRadius = 20
        exampleLabel.backgroundColor = VitaminColor.Core.Background.accent
        exampleLabel.dropShadow(shadowType: shadowType)

        exampleLabel.attributedText = "This is a test label \nwith a \(shadowType.rawValue) shadow type".styled(as: .callout)
        exampleLabel.textAlignment = .center
    }
}
