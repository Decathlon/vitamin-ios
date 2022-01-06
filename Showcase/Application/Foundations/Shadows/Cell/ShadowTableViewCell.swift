//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

public class ShadowTableViewCell: UITableViewCell {
    @IBOutlet weak var ibLabel: UILabel!

    func update(for shadowType: VitaminShadowType) {
        ibLabel.removeShadow()
        ibLabel.layer.cornerRadius = 20
        ibLabel.backgroundColor = VitaminColor.Core.Background.accent
        ibLabel.dropShadow(shadowType: shadowType)

        ibLabel.attributedText = "This is a test label \nwith a \(shadowType.rawValue) shadow type".styled(as: .callout)
        ibLabel.textAlignment = .center
    }
}
