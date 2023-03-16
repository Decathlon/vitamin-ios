//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

public class VitaminButton: UIButton {
    public var style: VitaminButtonStyle = .primary {
        didSet {
            applyNewStyle()
        }
    }

    public var size: VitaminButtonSize = .medium {
        didSet {
            applyNewTextStyle()
        }
    }

    private var iconTypes: [UIControl.State: VitaminButtonIconType] = [.normal: .none]

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

    public required init(style: VitaminButtonStyle) {
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

    public override init(frame: CGRect) {
        super.init(frame: frame)
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
        setTitleColor(style.foregroundColor, for: state)
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

        layer.borderWidth = size.bordeWith
        layer.cornerRadius = size.cornerRadius
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

// MARK: - Sizing

extension VitaminButton {
    func applyNewTextStyle() {
        guard let text = titleLabel?.text else {
            return
        }
        titleLabel?.attributedText = text.styled(as: size.textStyle)
    }
}

// - MARK: Icon managemant

extension VitaminButton {
    public func setIconType(_ iconType: VitaminButtonIconType, for state: UIControl.State) {
        iconTypes[state] = iconType
        applyIcon(for: state)
    }

    public func getIconType(for state: UIControl.State) -> VitaminButtonIconType {
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
        case let .trailing(image, renderingMode):
            self.commonApplyIcon(
                image: image,
                iconType: iconTypeForState,
                state: state,
                renderingMode: renderingMode)
        case let .leading(image, renderingMode):
            self.commonApplyIcon(
                image: image,
                iconType: iconTypeForState,
                state: state,
                renderingMode: renderingMode)
        case let .alone(image, renderingMode):
            self.setTitle(nil, for: state)
            self.commonApplyIcon(
                image: image,
                iconType: iconTypeForState,
                state: state,
                renderingMode: renderingMode)
        }
        updateSemantic(for: state)
    }

    private func commonApplyIcon(
        image: UIImage,
        iconType: VitaminButtonIconType,
        state: UIControl.State,
        renderingMode: UIImage.RenderingMode?
    ) {
        var imageUpdated = image
        if let renderingMode = renderingMode {
            guard let resizedImage = image
                .resizedImage(
                    size: CGSize(
                        width: self.size.defaultIconSize(iconType: getIconType(for: state)),
                        height: self.size.defaultIconSize(iconType: getIconType(for: state))))?
                .withRenderingMode(renderingMode) else { return }
            imageUpdated = resizedImage
        }
        self.setImage(imageUpdated, for: state)
        self.imageView?.tintColor = style.foregroundColor
        self.imageView?.tintAdjustmentMode = .normal
        self.tintColor = style.foregroundColor
        self.imageEdgeInsets = iconType.imageEdgeInsets
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.contentVerticalAlignment = .fill
        self.contentMode = .center
        self.imageView?.contentMode = .scaleAspectFit
    }

    private func updateSemantic(for state: UIControl.State? = nil) {
        if case .trailing = getIconType(for: state ?? self.state) {
            self.semanticContentAttribute = .forceRightToLeft
        } else {
            self.semanticContentAttribute = .forceLeftToRight
        }
    }

    private func updateImageInsets() {
        self.imageEdgeInsets = self.getIconType(for: self.state).imageEdgeInsets
    }
}

extension UIControl.State: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue.hashValue)
    }
}

// MARK: - for retrocompatibility with old UIKit version
public extension VitaminButton {
    @available(*, deprecated, renamed: "VitaminButtonStyle")
    typealias Style = VitaminButtonStyle
    @available(*, deprecated, renamed: "VitaminButtonSize")
    typealias Size = VitaminButtonSize
    @available(*, deprecated, renamed: "VitaminButtonIconType")
    typealias IconType = VitaminButtonIconType
}
