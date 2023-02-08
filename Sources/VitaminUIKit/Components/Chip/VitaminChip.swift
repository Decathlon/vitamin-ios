//
//  Vitamin iOS
//  Apache License 2.0
//

import Foundation
import UIKit
import VitaminCore

public class VitaminChip: UIView {
    private var label = InsetLabel()
    private var iconOrImageView = UIImageView()
    private var badge = VitaminBadge()
    private var dismissIcon = UIImageView()
    private var stackView = UIStackView()

    private var iconHeightConstraint: NSLayoutConstraint?
    private var iconWidthConstraint: NSLayoutConstraint?

    private var heightConstraint: NSLayoutConstraint?
    private var leadingPaddinConstraint: NSLayoutConstraint?
    private var trailingPaddinConstraint: NSLayoutConstraint?

    /// Text displayed in the chip
    public var text: String = "" {
        didSet {
            applyNewText()
        }
    }

    /// Variant of the chip. Can be one among:
    /// - .filter
    /// - .input
    /// - .singleChoice
    /// - .action
    /// Ecah if these type may have associated values
    /// Default value is .filter, deselected and without tag
    public var variant: VitaminChipVariant = .filter(state: .unselected, badge: nil) {
        didSet {
            applyNewVariant()
        }
    }

    /// Size of the chip, among .small and .medium
    /// Defalt value id .medium
    public var size: VitaminChipSize = .medium {
        didSet {
            applyNewSize()
        }
    }

    public var enabled = true {
        didSet {
            applyNewEnabled()
        }
    }

    public var action: ((VitaminChip) -> Void)?

    /// An initializer that instantiates a `VitaminChip` by setting all its properties
    public init(
        text: String,
        variant: VitaminChipVariant = .filter(state: .unselected, badge: nil),
        size: VitaminChipSize = .medium,
        action: ((VitaminChip) -> Void)? = nil,
        enabled: Bool = true
    ) {
        super.init(frame: .zero)
        self.text = text
        self.variant = variant
        self.size = size
        self.action = action
        self.enabled = enabled
        self.commonInit()
    }

    /// An initializer that instantiates a `VitaminChip` in a frame, with all default values for properties
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    /// An initializer that restores a `VitaminChip` from a serialized version (used in storyboard)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

extension VitaminChip {
    public override var intrinsicContentSize: CGSize {
        let width = stackView.intrinsicContentSize.width +
            size.leadingPadding(variant: variant) +
            size.trailingPadding(variant: variant)
        let height = stackView.intrinsicContentSize.height
        return CGSize(width: width, height: height)
    }
}

// MARK: private methods
private extension VitaminChip {
    // Common code for all initializzrs
    func commonInit() {
        setupViews()
    }

    // Method called when text changes
    func applyNewText() {
        self.label.attributedText = self.text.styled(
            as: size.textStyle,
            with: disableColor(variant.textColor()))
    }

    // method called when variant changes.
    // implicitely call applyNewText to handle text color change
    func applyNewVariant() {
        applyNewText()
        invalidateIntrinsicContentSize()
        backgroundColor = disableColor(variant.backgroundColor())
        label.textColor = disableColor(variant.textColor())
        label.contentInsets = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0)

        layer.borderColor = disableColor(variant.borderColor).cgColor
        layer.borderWidth = variant.borderWidth

        switch variant {
        case let .filter(state, badgeValue):
            applyFilterVariant(state: state, badgeValue: badgeValue)
        case let .input(icon, image):
            applyInputVariant(icon: icon, image: image)
        case .singleChoice:
            applySingleChoiceVariant()
        case let .action(icon):
            applyActionVariant(icon: icon)
        }

        applyLeadingAndTrailingConstraints(size: size, variant: variant)
    }

    // method called when size changes
    // implicitely call applyNewText to handle text style change
    func applyNewSize() {
        applyNewText()
        layer.cornerRadius = size.height / 2
        stackView.spacing = size.horizontalSpacing
        if let heightConstraint = heightConstraint {
            heightConstraint.constant = size.height
        } else {
            heightConstraint = heightAnchor.constraint(equalToConstant: size.height)
        }
        heightConstraint?.isActive = true
        applyLeadingAndTrailingConstraints(size: size, variant: variant)
    }

    func applyNewEnabled() {
        applyNewSize()
        applyNewVariant()
    }

    // inital Setup of all views
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false

        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        iconOrImageView = UIImageView()
        setIconConstraints(width: 20, height: 20)
        let dismissIconImage = Vitamix.Line.System.close.image.withRenderingMode(.alwaysTemplate)
        dismissIcon = UIImageView(image: dismissIconImage)
        dismissIcon.tintColor = disableColor(variant.textColor())

        stackView.addArrangedSubview(iconOrImageView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(badge)
        stackView.addArrangedSubview(dismissIcon)

        label.numberOfLines = 1

        addSubview(stackView)

        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        applyNewSize()
        // we do not call applyNewText() becase it is called by applyNewSize() under the hood
        applyNewVariant()
    }

    private func applyLeadingAndTrailingConstraints(size: VitaminChipSize, variant: VitaminChipVariant) {
        if let leadingPaddinConstraint = leadingPaddinConstraint {
            leadingPaddinConstraint.constant = size.leadingPadding(variant: variant)
        } else {
            leadingPaddinConstraint = stackView.leftAnchor.constraint(
                equalTo: leftAnchor, constant: size.leadingPadding(variant: variant))
        }
        leadingPaddinConstraint?.isActive = true

        if let trailingPaddinConstraint = trailingPaddinConstraint {
            trailingPaddinConstraint.constant = -size.trailingPadding(variant: variant)
        } else {
            trailingPaddinConstraint = stackView.rightAnchor.constraint(
                equalTo: rightAnchor, constant: -size.trailingPadding(variant: variant))
        }
        trailingPaddinConstraint?.isActive = true
    }

    private func disableColor(_ color: UIColor) -> UIColor {
        return enabled ? color : color.disabledColor()
    }

    @objc private func chipTapped() {
        guard enabled else {
            return
        }
        switch variant {
        case let .filter(state, badge):
            variant = .filter(state: state.toggle(), badge: badge)
        case let .singleChoice(state):
            variant = .singleChoice(state: state.toggle())
        case .input:
            self.removeFromSuperview()
        default:
            break
        }

        action?(self)
    }
}

// MARK: pressed state handling
public extension VitaminChip {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard enabled else {
            return
        }
        label.textColor = variant.textColor(pressed: true)
        backgroundColor = variant.backgroundColor(pressed: true)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        resetBackgroundAfterTouch()
        chipTapped()
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        resetBackgroundAfterTouch()
    }

    private func resetBackgroundAfterTouch() {
        guard enabled else {
            return
        }
        label.textColor = variant.textColor()
        backgroundColor = variant.backgroundColor()
    }
}

// MARK: Variant change utilty methods
public extension VitaminChip {
    // Utility method to handle variant change when .filter variant is applied
    private func applyFilterVariant(
        state: VitaminChipVariantState,
        badgeValue: Int?
    ) {
        if state == .selected {
            let image = Vitamix.Line.System.check.image.withRenderingMode(.alwaysTemplate)
            iconOrImageView.image = image
            iconOrImageView.tintColor = disableColor(variant.textColor())
            iconOrImageView.isHidden = false
            iconOrImageView.clipsToBounds = false
        } else {
            self.iconOrImageView.isHidden = true
        }

        if let badgeValue = badgeValue {
            self.badge.value = badgeValue
            badge.isHidden = false
            badge.textColor = enabled ?
                VitaminBadgeVariant.standard.foregroundColor :
                VitaminBadgeVariant.standard.foregroundColor.disabledColor()
        } else {
            badge.isHidden = true
        }
        dismissIcon.isHidden = true
    }

    // Utility method to handle variant change when .input variant is applied
    private func applyInputVariant(icon: UIImage?, image: UIImage?) {
        if let icon = icon {
            let iconRendered = icon.withRenderingMode(.alwaysTemplate)
            iconOrImageView.image = iconRendered
            iconOrImageView.tintColor = disableColor(variant.textColor())
            iconOrImageView.layer.cornerRadius = 0
            iconOrImageView.clipsToBounds = false
            iconOrImageView.isHidden = false
        } else if let image = image {
            iconOrImageView.image = image
            iconOrImageView.layer.cornerRadius = 10
            iconOrImageView.clipsToBounds = true
            iconOrImageView.isHidden = false
            iconOrImageView.alpha = enabled ? VitaminOpacity.enabled : VitaminOpacity.disabled
        } else {
            iconOrImageView.isHidden = true
        }
        dismissIcon.isHidden = false
        dismissIcon.tintColor = disableColor(variant.textColor())
        badge.isHidden = true
    }

    // Utility method to handle variant change when .singleChoice variant is applied
    private func applySingleChoiceVariant() {
        dismissIcon.isHidden = true
        iconOrImageView.isHidden = true
        badge.isHidden = true
    }

    // Utility method to handle variant change when .action variant is applied
    private func applyActionVariant(icon: UIImage) {
        let iconRendered = icon.withRenderingMode(.alwaysTemplate)
        self.iconOrImageView.image = iconRendered
        iconOrImageView.tintColor = disableColor(variant.textColor())
        self.iconOrImageView.layer.cornerRadius = 0
        self.iconOrImageView.isHidden = false
        iconOrImageView.clipsToBounds = false
        dismissIcon.isHidden = true
        badge.isHidden = true
    }

    // Set constraints to size icon
    private func setIconConstraints(width: CGFloat, height: CGFloat) {
        if let heightConstraint = iconHeightConstraint {
            heightConstraint.constant = height
        } else {
            iconHeightConstraint = iconOrImageView.heightAnchor.constraint(equalToConstant: height)
        }
        iconHeightConstraint?.isActive = true

        if let widthConstraint = iconWidthConstraint {
            widthConstraint.constant = width
        } else {
            iconWidthConstraint = iconOrImageView.widthAnchor.constraint(equalToConstant: width)
        }
        iconWidthConstraint?.isActive = true
    }
}

// Utility class that allows to add insets to a UILabel when inserted in Stackview
private class InsetLabel: UILabel {
    var contentInsets = UIEdgeInsets.zero

    override func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: contentInsets)
        super.drawText(in: insetRect)
    }

    override var intrinsicContentSize: CGSize {
        return addInsets(to: super.intrinsicContentSize)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return addInsets(to: super.sizeThatFits(size))
    }

    private func addInsets(to size: CGSize) -> CGSize {
        let width = size.width + contentInsets.left + contentInsets.right
        let height = size.height + contentInsets.top + contentInsets.bottom
        return CGSize(width: width, height: height)
    }
}
