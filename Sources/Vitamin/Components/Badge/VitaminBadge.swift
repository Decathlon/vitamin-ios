//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public class VitaminBadge: UILabel {
    /// Integer value of the `VitaminBadge`
    /// It will be replaced by a "99+" if it is over max value
    public var value: Int? = 0 {
        didSet {
            applyTextAndColor()
            accessibilityLabel = displayableValue
        }
    }

    /// Variant of the `VitaminBadge`
    public var variant: VitaminBadgeVariant = .standard {
        didSet {
            applyTextAndColor()
        }
    }

    public required init(value: Int?, variant: VitaminBadgeVariant = .standard) {
        self.value = value
        self.variant = variant
        super.init(frame: .zero)
        applyTextAndColor()
    }

    /// An initializer that restores a `VitaminBadge` from a serialized version (used in storyboard)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    /// An initializer that instantiate a `VitaminBadge` in a frame, with all default valmues for properties
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    // Common initialization
    private func commonInit() {
        self.backgroundColor = .clear
    }

    // padding constants of the `VitaminTag`
    private var padding: UIEdgeInsets {
        guard let intValue = value else {
            return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        }

        if "\(intValue)".count == 1 {
            return UIEdgeInsets(top: 3, left: 3, bottom: 1, right: 3)
        }

        return UIEdgeInsets(top: 3, left: 4, bottom: 1, right: 4)
    }

    // max displayable value
    private static let maxValue = 99

    // overflow displayable value
    private static var maxDisplayableValue: String {
        "\(maxValue)+"
    }

    // instance displayable value
    private var displayableValue: String {
        guard let value = value else {
            return ""
        }
        return value > Self.maxValue ? Self.maxDisplayableValue : "\(value)"
    }
}

// MARK: - Padding methods
extension VitaminBadge {
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
extension VitaminBadge {
    // apply text and icon when they change
    private func applyTextAndColor() {
        attributedText = displayableValue.styled(as: .badge, with: variant.foregroundColor)
        layer.backgroundColor = variant.backgroundColor.cgColor
        layer.borderColor = variant.borderColor.cgColor
        layer.borderWidth = variant.borderWidth
        textColor = variant.foregroundColor
        // default corener radius when value is nil
        layer.cornerRadius = 4
        // overriden corner radius when value is not nil
        if value != nil {
            layer.cornerRadius = 6
        }
    }
}

extension VitaminBadge {
    var theoricWidth: CGFloat {
        guard let intValue = value else {
            return 6
        }

        switch "\(intValue)".count {
        case 1:
            return 11
        case 2:
            return 17
        default:
            return 21
        }
    }

    var theoricHeight: CGFloat {
        guard value != nil else {
            return 6
        }
        return 12
    }

    var offset: CGFloat {
        guard value != nil else {
            return 3
        }
        return 8
    }
}

// MARK: - dark/light mode change handling
extension VitaminBadge {
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTextAndColor()
    }
}

public extension UIView {
    private static var badgeTag = Int.max

    func addBadge(with value: Int? = nil, variant: VitaminBadgeVariant = .standard) {
        let badge = VitaminBadge()
        badge.value = value
        badge.variant = variant
        badge.tag = Self.badgeTag
        badge.frame = CGRect(
            x: self.frame.width - badge.offset,
            y: badge.offset - badge.theoricHeight,
            width: badge.theoricWidth,
            height: badge.theoricHeight)
        self.addSubview(badge)
    }

    func modifyBadge(with value: Int? = nil, variant: VitaminBadgeVariant = .standard) {
        if let badge = getBadge() {
            badge.value = value
            badge.variant = variant
        }
    }

    func removeBadge() {
        if let badge = getBadge() {
            badge.removeFromSuperview()
        }
    }

    private func getBadge() -> VitaminBadge? {
        subviews.first { ($0 is VitaminBadge) && ($0.tag == Self.badgeTag) } as? VitaminBadge
    }

    func hasBadge() -> Bool {
        getBadge() != nil
    }
}
