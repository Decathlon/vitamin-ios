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

    // indicates if the badge is added manually or automatically
    // it allows to adjust precisely the insets
    var automatic = false

    /// An initializer that instantiates a `VitaminBadge` with provided values
    ///  - Parameters :
    ///     - value: the value displayed on the badge. If nil, no value is displayed, if greater than 99, 99+ will be displayed
    ///     - variant: the `VitaminBadgeVariant`  to be applied
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

    /// An initializer that instantiates a `VitaminBadge` in a frame, with all default values for properties
    /// - Parameter frame: the frame of the `VitaminBadge`
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
        // Insets will depend on the length of the text displayed in the badge :
        // - if no test, insets are all equals on four sides to create a circle
        guard let intValue = value else {
            return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        }

        // else if the value has one digit, we still want a cricle,
        // but the size of the text should be taken into account
        if "\(intValue)".count == 1 {
            // the insets will be slightly different between the automatic added badge
            // (which do not use autolayout) and the manually added (which does)
            return automatic ? UIEdgeInsets(top: 3, left: 4, bottom: 1, right: 2) :
                UIEdgeInsets(top: 3, left: 3, bottom: 1, right: 3)
        }

        // else if the value has two digits or more (if more, it will be "99+"),
        // insets are defined to create a rounded rect around the text
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
    // Width of the badge, used when added automatically
    var theoricWidth: CGFloat {
        guard let intValue = value else {
            return 6
        }

        switch "\(intValue)".count {
        case 1:
            return 12
        case 2:
            return 17
        default:
            return 21
        }
    }

    // Height of the badge, used when added automatically
    var theoricHeight: CGFloat {
        guard value != nil else {
            return 6
        }
        return 12
    }

    // Horizontal and Vertical offset with the corner of the superview, used when added automatically
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

// MARK: - convenience UIView method
public extension UIView {
    private static var badgeTag = Int.max

    /// Allows to add a badge automatically over the upper roght corner of the view
    /// - Parameters :
    ///  - with: the value displayed on the badge. If nil, no value is displayed, if greater than 99, 99+ will be displayed
    ///  - variant: the `VitaminBadgeVariant`  to be applied
    func addBadge(with value: Int? = nil, variant: VitaminBadgeVariant = .standard) {
        let badge = VitaminBadge()
        badge.value = value
        badge.variant = variant
        badge.automatic = true
        badge.tag = Self.badgeTag
        badge.frame = getBadgeFrame(badge: badge)
        self.addSubview(badge)
    }

    /// Allows to modify an already automatically added badge to the view
    /// - Parameters :
    ///  - with: the value displayed on the badge. If nil, no value is displayed, if greater than 99, `99+` will be displayed
    ///  - variant: the `VitaminBadgeVariant`  to be applied
    func modifyBadge(with value: Int? = nil, variant: VitaminBadgeVariant = .standard) {
        if let badge = getBadge() {
            badge.value = value
            badge.variant = variant
            badge.frame = getBadgeFrame(badge: badge)
        }
    }

    /// Allows to remove an already automatically added badge from the view
    func removeBadge() {
        if let badge = getBadge() {
            badge.removeFromSuperview()
        }
    }

    /// Allows to know whether a badge has already automatically added to the view
    func hasBadge() -> Bool {
        getBadge() != nil
    }

    // get the automatically added badge if exists
    private func getBadge() -> VitaminBadge? {
        subviews.first { ($0 is VitaminBadge) && ($0.tag == Self.badgeTag) } as? VitaminBadge
    }

    // Computes the badge frame relative to this view frame
    private func getBadgeFrame(badge: VitaminBadge) -> CGRect {
        CGRect(
            x: self.frame.width - badge.offset,
            y: badge.offset - badge.theoricHeight,
            width: badge.theoricWidth,
            height: badge.theoricHeight)
    }
}
