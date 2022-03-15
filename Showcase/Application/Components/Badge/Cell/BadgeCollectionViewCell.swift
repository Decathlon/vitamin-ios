//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

class BadgeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var fakeView: UIView!
    @IBOutlet weak var badge: VitaminBadge!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var button: VitaminButton!

    private var badgeValue: Int?
    private var badgeVariant: VitaminBadgeVariant = .standard

    func update(with value: Int?, variant: VitaminBadgeVariant, automatic: Bool = false) {
        badgeValue = value
        badgeVariant = variant
        contentView.backgroundColor = VitaminColor.Core.Background.primary
        fakeView.backgroundColor = VitaminColor.Core.Background.tertiary
        detailLabel.textColor = VitaminColor.Core.Content.primary

        button.style = .ghost
        button.size = .medium

        if automatic {
            badge.isHidden = true
            button.isHidden = false
            if fakeView.hasBadge() {
                fakeView.modifyBadge(with: badgeValue, variant: badgeVariant)
                button.setTitle("Remove badge", for: .normal)
            } else {
                button.setTitle("Add badge", for: .normal)
            }
        } else {
            fakeView.removeBadge()
            badge.isHidden = false
            button.isHidden = true
            badge.value = value
            badge.variant = variant
        }

        var displayableNbDigits = "no digit"
        if let value = value {
            let nbDigits = "\(value)".count
            displayableNbDigits = nbDigits < 3 ? "\(nbDigits) digits" : "more than 2 digits"
        }

        let text = "\(variant.name) badge with \(displayableNbDigits)"
        detailLabel.attributedText = text.styled(
            as: .footnote,
            with: VitaminColor.Core.Content.primary)

        // Specific colors for reversed variant
        if variant == .reversed {
            contentView.backgroundColor = VitaminColor.Core.Background.primaryReversed
            fakeView.backgroundColor = VitaminColor.Core.Background.brandPrimary
            detailLabel.textColor = VitaminColor.Core.Content.primaryReversed
            detailLabel.attributedText = text.styled(
                as: .footnote,
                with: VitaminColor.Core.Content.primaryReversed)
            button.style = .ghostReversed
        }
    }

    @IBAction func addRemoveButtonClicked() {
        if fakeView.hasBadge() {
            fakeView.removeBadge()
            button.setTitle("Add badge", for: .normal)
        } else {
            fakeView.addBadge(with: badgeValue, variant: badgeVariant)
            button.setTitle("Remove badge", for: .normal)
        }
    }
}

extension VitaminBadgeVariant {
    var name: String {
        switch self {
        case .standard:
            return "Standard"
        case .brand:
            return "Brand"
        case .reversed:
            return "Reversed"
        case .accent:
            return "Accent"
        case .alert:
            return "Alert"
        }
    }
}
