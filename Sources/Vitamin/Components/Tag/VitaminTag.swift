//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public class VitaminTag: UILabel {
    // padding constants of the `VitaminTag`
    private let paddingWithIcon = UIEdgeInsets(top: 1, left: 8, bottom: 1, right: 8)
    private let paddingWithoutIcon = UIEdgeInsets(top: 2, left: 8, bottom: 0, right: 8)


    /// Label of the `VitaminTag`
    public var label: String = "" {
        didSet {
            applyTextAndIconAndColor()
            accessibilityLabel = label
        }
    }

    /// Icon displayed on the `VitaminTag`
    public var icon: UIImage? {
        didSet {
            applyTextAndIconAndColor()
        }
    }

    /// Variant of the `VitaminTag`
    public var variant: VitaminTagVariant = .brandPrimary {
        didSet {
            applyTextAndIconAndColor()
        }
    }

    /// An initializer that restores a `VitaminTag` from a serialized version (used in storyboard)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    /// An initializer that instantiate a `VitaminTag` in a frame, with all default valmues for properties
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    // Common initialization
    private func commonInit() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = VitaminRadius.radius100.rawValue
    }
}

// MARK: - Padding methods
extension VitaminTag {
    override public func drawText(in rect: CGRect) {
        let padding = (icon != nil) ? paddingWithIcon : paddingWithoutIcon
        super.drawText(in: rect.inset(by: padding))
    }

    override public var intrinsicContentSize: CGSize {
        let padding = (icon != nil) ? paddingWithIcon : paddingWithoutIcon
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
}

// MARK: - private styling method
extension VitaminTag {
    // apply text and icon when they change
    private func applyTextAndIconAndColor() {
        let tagLabel = NSMutableAttributedString(string: "")
        if let icon = icon {
            let leftIcon = NSTextAttachment()
            let image = icon.withRenderingMode(.alwaysTemplate)
            leftIcon.image = image
            leftIcon.bounds = CGRect(x: 0, y: 0, width: 12, height: 12)
            let leftIconAsString = NSAttributedString(attachment: leftIcon)

            tagLabel.append(leftIconAsString)
            tagLabel.append(" ".styled(as: .footnote))
        }

        tagLabel.append(label.styled(as: .footnote))
        tagLabel.addAttributes(
            [.foregroundColor: variant.foregroundColor],
            range: NSRange(location: 0, length: tagLabel.length)
        )

        attributedText = tagLabel

        layer.backgroundColor = variant.backgroundColor.cgColor
        textColor = variant.foregroundColor
    }
}

// MARK: - dark/light mode change handling
extension VitaminTag {
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTextAndIconAndColor()
    }
}
