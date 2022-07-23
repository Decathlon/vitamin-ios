//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

public extension VitaminButton {
    typealias Style = VitaminButtonStyle
    typealias Size = VitaminButtonSize
}

public class VitaminButton: UIButton {
    /// - Note: The Style enumeration is of type String in order to be able to initialize a Style from a String. For example to use an IBInspectable on a VitaminButton to automatically style it from storyboard.
    

    public var style: Style = .primary {
        didSet {
            applyNewStyle()
        }
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

    private var iconTypes: [UIControl.State: IconType] = [.normal: .none]

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



// MARK: - Sizing

extension VitaminButton {
    func applyNewTextStyle() {
        guard let text = titleLabel?.text else {
            return
        }
        titleLabel?.attributedText = text.styled(as: size.textStyle)
    }
}

