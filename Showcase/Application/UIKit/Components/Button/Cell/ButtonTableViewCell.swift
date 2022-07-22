//
//  Vitamin iOS
//  Apache License 2.0
//

#if os(iOS)
import UIKit
import Vitamin

final class ButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var mediumButton: VitaminButton! {
        didSet {
            mediumButton.size = .medium
        }
    }

    @IBOutlet weak var largeButton: VitaminButton! {
        didSet {
            largeButton.size = .large
        }
    }
    @IBOutlet weak var mediumIconAloneButton: VitaminButton! {
        didSet {
            mediumIconAloneButton.size = .medium
        }
    }

    @IBOutlet weak var largeIconAloneButton: VitaminButton! {
        didSet {
            largeIconAloneButton.size = .large
        }
    }

    func update(for style: VitaminButton.Style, isEnabled: Bool) {
        mediumButton.style = style
        largeButton.style = style
        mediumIconAloneButton.style = style
        largeIconAloneButton.style = style

        mediumButton.setTitle("\(style)", for: .normal)
        largeButton.setTitle("\(style)", for: .normal)
        
        mediumButton.setIconType(.trailing(image: Vitamix.Line.Logos.apple.image, renderingMode: .alwaysTemplate), for: .normal)
        largeButton.setIconType(.leading(image: Vitamix.Line.System.arrowRightS.image, renderingMode: .alwaysTemplate), for: .normal)
        mediumIconAloneButton.setIconType(.alone(image: Vitamix.Line.Logos.apple.image, renderingMode: .alwaysTemplate), for: .normal)
        largeIconAloneButton.setIconType(.alone(image: Vitamix.Line.System.arrowRightS.image, renderingMode: .alwaysTemplate), for: .normal)

        mediumButton.isEnabled = isEnabled
        largeButton.isEnabled = isEnabled
        mediumIconAloneButton.isEnabled = isEnabled
        largeIconAloneButton.isEnabled = isEnabled

        contentView.backgroundColor = style.needsReversedBackground ?
        VitaminColor.Core.Background.brandPrimary :
        VitaminColor.Core.Background.primary
    }
}

private extension VitaminButton.Style {
    var needsReversedBackground: Bool {
        self == .primaryReversed || self == .ghostReversed
    }
}
#endif
