//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public class VitaminTag: UILabel {
    // padding constants of the `VitaminTag`
    private let padding = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)

    /// Label of the `VitaminTag`
    public var label: String = "" {
        didSet {
            applyTextAndIcon()
        }
    }

    /// Icon displayed on the VitaminTag
    public var icon: UIImage? {
        didSet {
            applyTextAndIcon()
        }
    }

    /// Variant of the `VitaminTag`
    public var variant: Variant = .brandPrimary {
        didSet {
            self.layer.backgroundColor = variant.backgroundColor.cgColor
            self.textColor = variant.foregroundColor
        }
    }

    /// An initializer that restores a `VitaminTextField` from a serialized version (used in storyboard)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    /// An initializer that instantiate a `VitaminTextField` in a frame, with all default valmues for properties
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    // COmmon initialization
    private func commonInit() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = VitaminRadius.radius100.rawValue
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

// MARK: - Tag Variant
extension VitaminTag {
    /// enum containing the different variants of VitaminTag
    public enum Variant {
        case brandAccent
        case brandPrimary
        case brandAlert
        case decorativeAmethyst
        case decorativeBrick
        case decorativeCobalt
        case decorativeEmerald
        case decorativeGold
        case decorativeGravel
        case decorativeJade
        case decorativeSaffron

        var backgroundColor: UIColor {
            switch self {
            case .brandPrimary:
                return VitaminColor.Core.Background.brandPrimary
            case .brandAccent:
                return VitaminColor.Core.Background.accent
            case .brandAlert:
                return VitaminColor.Core.Background.alert
            case .decorativeAmethyst:
                return VitaminColor.Core.Decorative.amethyst
            case .decorativeBrick:
                return VitaminColor.Core.Decorative.brick
            case .decorativeCobalt:
                return VitaminColor.Core.Decorative.cobalt
            case .decorativeEmerald:
                return VitaminColor.Core.Decorative.emerald
            case .decorativeGravel:
                return VitaminColor.Core.Decorative.gravel
            case .decorativeGold:
                return VitaminColor.Core.Decorative.gold
            case .decorativeJade:
                return VitaminColor.Core.Decorative.jade
            case .decorativeSaffron:
                return VitaminColor.Core.Decorative.saffron
            }
        }

        var foregroundColor: UIColor {
            switch self {
            case .brandAlert, .brandPrimary:
                return VitaminColor.Core.Content.primaryReversed
            case .brandAccent:
                return VitaminColor.Core.Content.accent
            default:
                return VitaminColor.Core.Content.primary
            }
        }
    }
}

// MARK: - private styling method
extension VitaminTag {
    private func applyTextAndIcon() {
        let myString = NSMutableAttributedString(string: "")
        if let icon = icon {
            let leftAttachment = NSTextAttachment()
            let image = icon.withRenderingMode(.alwaysTemplate)
            leftAttachment.image = image
            leftAttachment.bounds = CGRect(x: 0, y: 0, width: 13, height: 13)
            let leftAttachmentStr = NSAttributedString(attachment: leftAttachment)

            myString.append(leftAttachmentStr)
            myString.append(" ".styled(as: .footnote))
        }

        myString.append(label.styled(as: .footnote))
        myString.addAttributes(
            [.foregroundColor: variant.foregroundColor],
            range: NSRange(location: 0, length: myString.length)
        )

        attributedText = myString
    }
}
