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

    func update(for style: VitaminButton.Style, isEnabled: Bool) {
        mediumButton.style = style
        largeButton.style = style

        mediumButton.setTitle("\(style)", for: .normal)
        largeButton.setTitle("\(style)", for: .normal)
        mediumButton.setLeadingImage(Vitamix.Line.Logos.apple.image, for: .normal, renderingMode: .alwaysTemplate)
        largeButton.setTrailingImage(
            Vitamix.Line.System.arrowRightS.image,
            for: .normal,
            renderingMode: .alwaysTemplate)

        mediumButton.isEnabled = isEnabled
        largeButton.isEnabled = isEnabled

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
