//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

public class RadiusTableViewCell: UITableViewCell {
    @IBOutlet weak var exampleLabel: UILabel!

    func update(for radius: VitaminRadius, radiusName: String) {
        exampleLabel.layer.cornerRadius = radius.rawValue
        exampleLabel.layer.backgroundColor = VitaminColor.Core.Background.primary.cgColor
        exampleLabel.layer.borderColor = VitaminColor.Core.Border.primary.cgColor
        exampleLabel.layer.borderWidth = 1.0
        exampleLabel.backgroundColor = .clear

        exampleLabel.attributedText = "This is a test label \nwith a \(radiusName) corner radius"
            .styled(as: .callout)
        exampleLabel.textAlignment = .center
    }
}
