//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

public class ShadowTableViewCell: UITableViewCell {
    @IBOutlet weak var exampleLabel: UILabel!

    func update(for shadowType: VitaminShadow, shadowName: String) {
        exampleLabel.removeShadow()
        exampleLabel.layer.cornerRadius = VitaminRadius.radius500.rawValue
        exampleLabel.backgroundColor = VitaminColor.Core.Background.primary
        exampleLabel.dropShadow(shadowType: shadowType)

        exampleLabel.attributedText = "This is a test label \nwith a \(shadowName) shadow type"
            .styled(as: .callout)
        exampleLabel.textAlignment = .center
    }
}
