//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCommon

public class VitaminTag: UILabel {
    // padding constants of the `VitaminTag`
    var padding: UIEdgeInsets {
        switch ((icon != nil), interactive) {
        case (true, true):
            return UIEdgeInsets(top: 9, left: 8, bottom: 9, right: 8)
        case (true, false):
            return UIEdgeInsets(top: 1, left: 8, bottom: 1, right: 8)
        case (false, true):
            return UIEdgeInsets(top: 10, left: 8, bottom: 8, right: 8)
        case (false, false):
            return UIEdgeInsets(top: 2, left: 8, bottom: 0, right: 8)
        }
    }

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

    /// indicates if the tag should be interactive, i.e. clickable, or not
    /// If set to true, it will launch the `vitaminTagWasClicked`method of the delegate
    /// if set to true but no delegate provided, nothing will happen
    public var interactive = false {
        didSet {
            isUserInteractionEnabled = interactive
        }
    }

    /// Delegates that allows to define what to do when an interactive tag is clicked
    public weak var interactiveDelegate: VitaminTagInteractiveDelegate?

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
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(VitaminTag.tagClicked)
        )
        addGestureRecognizer(tap)
        isUserInteractionEnabled = false
    }

    // Override the method to add padding when interactive
    public override func layoutSubviews() {
        if interactive {
            layer.bounds = CGRect(
                x: layer.frame.origin.x,
                y: layer.frame.origin.y + 8,
                width: layer.frame.size.width,
                height: layer.frame.size.height - 16
            )
        }
    }

    /// Method called by the gestureRecognizer put on the `VitaminTag`
    @objc public func tagClicked() {
        if interactive {
            self.interactiveDelegate?.vitaminTagWasClicked(self)
        }
    }
}

// MARK: - Padding methods
extension VitaminTag {
    override public func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override public var intrinsicContentSize: CGSize {
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

/// Protocol that defines tha method a delegate should implement to react to click on the tag
public protocol VitaminTagInteractiveDelegate: AnyObject {
    /// Method that is called when the user clicks on `VitaminTag`
    func vitaminTagWasClicked(_ vitaminTag: VitaminTag)
}
