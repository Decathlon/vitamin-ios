//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

class BadgeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var fakeView: UIView!
    @IBOutlet weak var badge: VitaminBadge!
    @IBOutlet weak var button: VitaminButton!
    @IBOutlet weak var variantLabel: UILabel!

    private var badgeValue: Int?
    private var badgeVariant: VitaminBadgeVariant = .standard
    private var badgeSize: VitaminBadgeSize = .small

    func update(
        with value: Int?,
        variant: VitaminBadgeVariant,
        size: VitaminBadgeSize = .small,
        automatic: Bool = false
    ) {
        badgeValue = value
        badgeVariant = variant
        badgeSize = size
        contentView.backgroundColor = VitaminColor.Core.Background.primary
        fakeView.backgroundColor = VitaminColor.Core.Background.tertiary

        variantLabel.numberOfLines = 2
        variantLabel.attributedText = "\(variant.name)\n\(size.name)".styled(
            as: .caption2,
            with: VitaminColor.Core.Content.primary
        )
        variantLabel.textAlignment = .center

        button.style = .ghost
        button.size = .medium
        // Specific colors for reversed variant
        if variant == .reversed || variant == .standard {
            contentView.backgroundColor = VitaminColor.Core.Background.brandPrimary
            fakeView.backgroundColor = VitaminColor.Core.Background.brandSecondary
            button.style = .ghostReversed
        }
        button.setIconType(
            .alone(
                image: UIImage.Vitamix.addLine,
                renderingMode: UIImage.RenderingMode.alwaysTemplate),
            for: .normal
        )

        if automatic {
            badge.isHidden = true
            button.isHidden = false
            if fakeView.hasBadge() {
                fakeView.modifyBadge(with: badgeValue, variant: badgeVariant, size: badgeSize)
                button.setIconType(
                    .alone(
                        image: UIImage.Vitamix.subtractLine,
                        renderingMode: UIImage.RenderingMode.alwaysTemplate),
                    for: .normal
                )
            } else {
                button.setIconType(
                    .alone(
                        image: UIImage.Vitamix.addLine,
                        renderingMode: UIImage.RenderingMode.alwaysTemplate),
                    for: .normal
                )
            }
        } else {
            fakeView.removeBadge()
            badge.isHidden = false
            button.isHidden = true
            badge.value = value
            badge.variant = variant
            badge.size = size
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        contentView.backgroundColor = VitaminColor.Core.Background.primary
        fakeView.backgroundColor = VitaminColor.Core.Background.tertiary
        button.style = .ghost

        if badgeVariant == .reversed {
            contentView.backgroundColor = VitaminColor.Core.Background.brandPrimary
            fakeView.backgroundColor = VitaminColor.Core.Background.brandSecondary
            button.style = .ghostReversed
        }
    }

    @IBAction func addRemoveButtonClicked() {
        if fakeView.hasBadge() {
            fakeView.removeBadge()
            button.setIconType(
                .alone(
                    image: UIImage.Vitamix.addLine,
                    renderingMode: UIImage.RenderingMode.alwaysTemplate),
                for: .normal
            )
        } else {
            fakeView.addBadge(with: badgeValue, variant: badgeVariant, size: badgeSize)
            button.setIconType(
                .alone(
                    image: UIImage.Vitamix.subtractLine,
                    renderingMode: UIImage.RenderingMode.alwaysTemplate),
                for: .normal
            )
        }
    }
}

extension VitaminBadgeSize {
    var name: String {
        switch self {
        case .small:
            return "Small"
        case .medium:
            return "Medium"
        case .large:
            return "Large"
        }
    }
}
