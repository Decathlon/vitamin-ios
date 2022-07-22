//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

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
    
    public enum IconType {
        case trailing(image: UIImage, renderingMode: UIImage.RenderingMode?)
        case leading(image: UIImage, renderingMode: UIImage.RenderingMode?)
        case alone(image: UIImage, renderingMode: UIImage.RenderingMode?)
        case none
    }
    
    private var iconTypes: [UIControl.State:IconType] = [.normal: .none]

    public override var isEnabled: Bool {
        didSet {
            updateOpacity()
            updateSemantic()
            updateImageInsets()
        }
    }

    public override var isHighlighted: Bool {
        didSet {
            updateBorder()
            updateSemantic()
            updateImageInsets()
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
            width: 2 * size.horizontalInset(iconType: getIconType(for: self.state)) + baseSize.width,
            height: 2 * size.verticalInset(iconType: getIconType(for: self.state)) + baseSize.height
        )
    }
    
    public override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        applyNewTextStyle()
    }
}

// MARK: - Styling

extension VitaminButton {
    private func applyNewStyle() {
        if #available(iOS 15, *) {
            self.configuration = nil
        }
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
            return VitaminColor.Core.Border.primary
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
            return VitaminColor.Core.Border.primary
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

    func horizontalInset(iconType: VitaminButton.IconType) -> CGFloat {
        if case .alone(_, _) = iconType {
            return 12
        }
        
        switch self {
        case .medium: return 20
        case .large: return 40
        }
        
        
    }

    func verticalInset(iconType: VitaminButton.IconType) -> CGFloat {
        if case .alone(_, _) = iconType {
            return 12
        }
    
        switch self {
        case .medium: return 16
        case .large: return 20
        }
    }
    
    func defaultIconSize(iconType: VitaminButton.IconType) -> CGFloat {
        if case .alone(_, _) = iconType {
            switch self {
            case .medium : return 24
            case .large: return 32
            }
        } else {
            switch self {
            case .medium : return 20
            case .large: return 24
            }
        }
    }
}

// - MARK: Icon managemant

extension VitaminButton {
    public func setIconType(_ iconType: IconType, for state: UIControl.State){
        iconTypes[state] = iconType
        applyIcon(for: state)
    }
    
    public func getIconType(for state: UIControl.State) -> IconType {
        guard let iconType = iconTypes[state] else {
            return iconTypes[.normal] ?? .none
        }
        return iconType
    }
    
    private func applyIcon(for state: UIControl.State) {
        self.invalidateIntrinsicContentSize()
        let iconTypeForState = getIconType(for: state)
        switch iconTypeForState {
        case .none:
            break
        case .trailing(let image, let renderingMode):
            self.commonApplyIcon(
                image: image,
                iconType: iconTypeForState,
                state: state,
                renderingMode: renderingMode)
        case .leading(let image, let renderingMode):
            self.commonApplyIcon(
                image: image,
                iconType: iconTypeForState,
                state: state,
                renderingMode: renderingMode)
        case .alone(let image, let renderingMode):
            self.setTitle("", for: state)
            self.commonApplyIcon(
                image: image,
                iconType: iconTypeForState,
                state: state,
                renderingMode: renderingMode)
        }
    }
    
    private func commonApplyIcon(image: UIImage, iconType: IconType, state: UIControl.State, renderingMode: UIImage.RenderingMode?) {
        var imageUpdated = image
        if let renderingMode = renderingMode {
            guard let resizedImage = image
                .resizedImage(size: CGSize(width: self.size.defaultIconSize(iconType: getIconType(for: state)), height: self.size.defaultIconSize(iconType: getIconType(for: state))))?
                    .withRenderingMode(renderingMode) else { return }
            imageUpdated = resizedImage
        }
        self.setImage(imageUpdated, for: state)
        self.imageView?.tintColor = style.foregroundColor
        self.tintColor = style.foregroundColor
        self.imageEdgeInsets = iconType.imageEdgeInsets
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.contentVerticalAlignment = .fill
        self.contentMode = .center
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    private func updateSemantic() {
        if case .trailing(_, _) = getIconType(for: self.state){
            self.semanticContentAttribute = .forceRightToLeft
        } else {
            self.semanticContentAttribute = .forceLeftToRight
        }
    }
    
    private func updateImageInsets(){
        self.imageEdgeInsets = self.getIconType(for: self.state).imageEdgeInsets
    }
}

extension VitaminButton.IconType {
    var imageEdgeInsets: UIEdgeInsets {
        switch self {
        case .alone(_, _), .none:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case .trailing(_, _):
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        case .leading(_, _):
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        }
    }
}

extension UIControl.State: Hashable {
    public var hashValue: Int {
        self.rawValue.hashValue
    }
}
