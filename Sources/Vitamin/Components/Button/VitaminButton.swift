//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public class VitaminButton: UIButton {
    /// - Note: The Style enumeration is of type String in order to be able to initialize a Style from a String. For example to use an IBInspectable on a VitaminButton to automatically style it from storyboard.
    public enum Style: String {
        case primary
        case primaryReversed
        case secondary
        case tertiary
        case conversion
        case ghost
        case ghostReversed
    }

    public var style: Style = .primary {
        didSet {
            applyNewStyle()
        }
    }

    public enum Size {
        case medium, large
    }

    public var size: Size = .medium {
        didSet {
            applyNewTextStyle()
        }
    }

    public override var isEnabled: Bool {
        didSet {
            updateOpacity()
        }
    }

    public override var isHighlighted: Bool {
        didSet {
            updateBorder()
        }
    }

    public required init(style: Style) {
        self.style = style
        super.init(frame: .zero)
        applyNewStyle()
        applyNewTextStyle()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyNewStyle()
        applyNewTextStyle()
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyNewStyle()
    }

    public override var intrinsicContentSize: CGSize {
        let baseSize = super.intrinsicContentSize
        return CGSize(
            width: 2 * size.horizontalInset + baseSize.width,
            height: 2 * size.verticalInset + baseSize.height
        )
    }

    public override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        applyNewTextStyle()
    }

    public func setLeadingImage(_ image: UIImage, for state: UIControl.State) {
        self.setImage(image, for: state)
        self.imageView?.tintColor = titleLabel?.textColor
        self.tintColor = titleLabel?.textColor
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.contentVerticalAlignment = .fill
        self.contentMode = .center
        self.imageView?.contentMode = .scaleAspectFit
    }

    public func setTrailingImage(_ image: UIImage, for state: UIControl.State) {
        self.setLeadingImage(image, for: state)
        self.semanticContentAttribute = .forceRightToLeft
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }

    public func setLeadingImage(_ image: UIImage, for state: UIControl.State, renderingMode: UIImage.RenderingMode) {
        guard let resizedImage = image
                .resizedImage(size: CGSize(width: 16, height: 16))?
                .withRenderingMode(renderingMode) else { return }
        self.setLeadingImage(resizedImage, for: state)
    }

    public func setTrailingImage(_ image: UIImage, for state: UIControl.State, renderingMode: UIImage.RenderingMode) {
        self.setLeadingImage(image, for: state, renderingMode: renderingMode)
        self.semanticContentAttribute = .forceRightToLeft
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}

// MARK: - Styling

extension VitaminButton {
    private func applyNewStyle() {
        let states: [UIControl.State] = [.normal, .disabled, .highlighted]
        states.forEach {
            setBackgroundImage(UIImage.imageWithColor(style.backgroundColor(for: $0)), for: $0)
            setTitleColor(style.foregroundColor, for: $0)
        }
        updateOpacity()
        updateBorder()

        layer.borderWidth = 2
        layer.cornerRadius = 5
        clipsToBounds = true

        adjustsImageWhenHighlighted = false
    }

    private func updateOpacity() {
        alpha = style.opacity(for: state)
    }

    private func updateBorder() {
        layer.borderColor = style.borderColor(for: state).cgColor
    }
}

// MARK: - Background

extension VitaminButton.Style {
    func backgroundColor(for state: UIControl.State) -> UIColor {
        if state == .highlighted {
            return highlightedBackgroundColor
        } else {
            return defaultBackgroundColor
        }
    }

    var defaultBackgroundColor: UIColor {
        switch self {
        case .primary:
            return VitaminColor.Core.Background.brandPrimary
        case .primaryReversed:
            return VitaminColor.Core.Background.brandPrimaryReversed
        case .secondary:
            return VitaminColor.Core.Background.primary
        case .tertiary:
            return VitaminColor.Core.Background.brandSecondary
        case .conversion:
            return VitaminColor.Core.Background.accent
        case .ghost, .ghostReversed:
            return UIColor.clear
        }
    }

    var highlightedBackgroundColor: UIColor {
        switch self {
        case .primary:
            return VitaminColor.Core.Active.brand
        case .primaryReversed:
            return VitaminColor.Core.Active.brandReversedTransparent
        case .secondary, .ghost:
            return VitaminColor.Core.Active.primary
        case .tertiary:
            return VitaminColor.Core.Active.tertiary
        case .conversion:
            return VitaminColor.Core.Active.accent
        case .ghostReversed:
            return VitaminColor.Core.Active.primaryReversedTransparent
        }
    }
}

// MARK: - Foreground

extension VitaminButton.Style {
    var foregroundColor: UIColor {
        switch self {
        case .primary:
            return VitaminColor.Core.Content.primaryReversed
        case .primaryReversed:
            return VitaminColor.Core.Content.primary
        case .secondary, .tertiary:
            return VitaminColor.Core.Content.action
        case .conversion:
            return VitaminColor.Core.Content.accent
        case .ghost:
            return VitaminColor.Core.Content.active
        case .ghostReversed:
            return VitaminColor.Core.Content.actionReversed
        }
    }
}

// MARK: - Border

extension VitaminButton.Style {
    func borderColor(for state: UIControl.State) -> UIColor {
        if state == .highlighted {
            return highlightedBorderColor
        } else {
            return defaultBorderColor
        }
    }

    var defaultBorderColor: UIColor {
        switch self {
        case .primary,
                .primaryReversed,
                .tertiary,
                .conversion,
                .ghost,
                .ghostReversed:
            return UIColor.clear
        case .secondary:
            return VitaminColor.Core.Border.secondary
        }
    }

    var highlightedBorderColor: UIColor {
        switch self {
        case .primary,
                .tertiary,
                .conversion,
                .ghost,
                .ghostReversed:
            return UIColor.clear
        case .primaryReversed:
            return VitaminColor.Core.Border.primaryReversed
        case .secondary:
            return VitaminColor.Core.Border.secondary
        }
    }
}

// MARK: - Opacity

extension VitaminButton.Style {
    func opacity(for state: UIControl.State) -> CGFloat {
        if state == .disabled {
            return VitaminOpacity.disabled
        } else {
            return VitaminOpacity.enabled
        }
    }
}

// MARK: - Sizing

extension VitaminButton {
    func applyNewTextStyle() {
        guard let text = titleLabel?.text else {
            return
        }
        titleLabel?.attributedText = text.styled(as: size.textStyle)
    }
}

extension VitaminButton.Size {
    var textStyle: VitaminTextStyle {
        .button
    }

    var horizontalInset: CGFloat {
        switch self {
        case .medium: return 20
        case .large: return 40
        }
    }

    var verticalInset: CGFloat {
        switch self {
        case .medium: return 16
        case .large: return 20
        }
    }
}
