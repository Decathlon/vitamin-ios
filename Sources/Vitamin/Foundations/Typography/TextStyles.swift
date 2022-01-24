//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

/// - Note: The VitaminTextStyle enumeration is of type String in order to be able to initialize a VitaminTextStyle from a String. For example to use an IBInspectable on a UILabel to automatically style it from storyboard.
public enum VitaminTextStyle: String {
    /// RobotoCondensed boldItalic 42pt on iOS
    case display
    case largeTitle1
    case largeTitle2
    case title1
    case title2
    case title3
    case headline
    case body
    case callout
    case subhead
    case footnote
    case caption1
    case caption2
    case button
}

extension VitaminTextStyle {
    private func baseAttributes(
        sizeProvider: SizeProvider,
        font: VitaminFontConvertible,
        lineHeight: SizeProvider
    ) -> [NSAttributedString.Key: Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight.size
        paragraphStyle.maximumLineHeight = lineHeight.size
        let font = font.font(size: sizeProvider.size)

        // Computing the baselineOffset needed to center the texte in its line height.
        // The baselineOffset should be the quarter of the difference between size and lineheight.
        let baseLineOffset = (lineHeight.size - sizeProvider.size) / 4

        var textStyle: UIFont.TextStyle
        switch self {
        case .display:
            textStyle = .largeTitleCompatibility
        case .largeTitle1:
            textStyle = .largeTitleCompatibility
        case .largeTitle2:
            textStyle = .largeTitleCompatibility
        case .title1:
            textStyle = .title1
        case .title2:
            textStyle = .title2
        case .title3:
            textStyle = .title2
        case .headline:
            textStyle = .headline
        case .body:
            textStyle = .body
        case .callout:
            textStyle = .callout
        case .subhead:
            textStyle = .subheadline
        case .footnote:
            textStyle = .footnote
        case .caption1:
            textStyle = .caption1
        case .caption2:
            textStyle = .caption2
        case .button:
            textStyle = .body
        }
        let scaledFont = makeScaledFont(for: font, textStyle: textStyle)
        return [
            .foregroundColor: VitaminColor.Core.Content.primary,
            .font: scaledFont,
            .paragraphStyle: paragraphStyle,
            .baselineOffset: baseLineOffset
        ]
    }

    private func makeScaledFont(for font: UIFont, textStyle: UIFont.TextStyle) -> UIFont {
        if #available(iOS 11.0, *) {
            let metrics = UIFontMetrics(forTextStyle: textStyle)
            return metrics.scaledFont(for: font)
        } else {
            return font
        }
    }

    public var attributes: [NSAttributedString.Key: Any] {
        switch self {
        case .display:
            return baseAttributes(
                sizeProvider: 42,
                font: VitaminFontFamily.RobotoCondensed.boldItalic,
                lineHeight: 44
            )
        case .largeTitle1:
            return baseAttributes(
                sizeProvider: 40,
                font: VitaminFontFamily.Roboto.bold,
                lineHeight: 44
            )
        case .largeTitle2:
            return baseAttributes(
                sizeProvider: 36,
                font: VitaminFontFamily.Roboto.bold,
                lineHeight: 40
            )
        case .title1:
            return baseAttributes(
                sizeProvider: 28,
                font: VitaminFontFamily.Roboto.bold,
                lineHeight: 32
            )

        case .title2:
            return baseAttributes(
                sizeProvider: 24,
                font: VitaminFontFamily.Roboto.bold,
                lineHeight: 28
            )

        case .title3:
            return baseAttributes(
                sizeProvider: 20,
                font: VitaminFontFamily.Roboto.bold,
                lineHeight: 24
            )

        case .headline:
            return baseAttributes(
                sizeProvider: 16,
                font: VitaminFontFamily.Roboto.bold,
                lineHeight: 24
            )

        case .body:
            return baseAttributes(
                sizeProvider: 17,
                font: VitaminFontFamily.Roboto.regular,
                lineHeight: 28
            )

        case .callout:
            return baseAttributes(
                sizeProvider: 16,
                font: VitaminFontFamily.Roboto.regular,
                lineHeight: 24
            )

        case .subhead:
            return baseAttributes(
                sizeProvider: 15,
                font: VitaminFontFamily.Roboto.regular,
                lineHeight: 20
            )

        case .footnote:
            return baseAttributes(
                sizeProvider: 14,
                font: VitaminFontFamily.Roboto.regular,
                lineHeight: 20
            )

        case .caption1:
            return baseAttributes(
                sizeProvider: 12,
                font: VitaminFontFamily.Roboto.regular,
                lineHeight: 16
            )

        case .caption2:
            return baseAttributes(
                sizeProvider: 11,
                font: VitaminFontFamily.Roboto.regular,
                lineHeight: 13
            )

        case .button:
            return baseAttributes(
                sizeProvider: 16,
                font: VitaminFontFamily.Roboto.bold,
                lineHeight: 16
            )
        }
    }
}

extension String {
    public func styled(as textStyle: VitaminTextStyle) -> NSAttributedString {
        NSAttributedString(string: self, attributes: textStyle.attributes)
    }

    public func styled(as textStyle: VitaminTextStyle, with color: UIColor) -> NSAttributedString {
        var attributes = textStyle.attributes
        attributes[.foregroundColor] = color
        return NSAttributedString(string: self, attributes: attributes)
    }
}

extension UIFont.TextStyle {
    static var largeTitleCompatibility: UIFont.TextStyle {
        if #available(iOS 11.0, *) {
            return .largeTitle
        } else {
            return .title1
        }
    }
}
