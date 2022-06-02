//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

final class ColorTableViewCell: UITableViewCell {
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var colorPreviewView: UIView!

    func setColor(_ name: String, color: UIColor) {
        colorPreviewView.backgroundColor = color
        colorNameLabel.text = name
    }
}
