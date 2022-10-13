//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public struct VitaminTextStyle {
    public let size: CGFloat
    public let lineHeight: CGFloat
    private let fontType: VitaminFontConvertible
    private let textStyle: UIFont.TextStyle
    public let rawValue: String

    public static let display = VitaminTextStyle(size: 42,
                                                 lineHeight: 44,
                                                 fontType: VitaminFontFamily.RobotoCondensed.boldItalic,
                                                 textStyle: .largeTitleCompatibility,
                                                 rawValue: "display")
    public static let largeTitle1 = VitaminTextStyle(size: 40,
                                                     lineHeight: 44,
                                                     fontType: VitaminFontFamily.Roboto.bold,
                                                     textStyle: .largeTitleCompatibility,
                                                     rawValue: "largeTitle1")
    public static let largeTitle2 = VitaminTextStyle(size: 36,
                                                     lineHeight: 40,
                                                     fontType: VitaminFontFamily.Roboto.bold,
                                                     textStyle: .largeTitleCompatibility,
                                                     rawValue: "largeTitle2")
    public static let title1 = VitaminTextStyle(size: 28,
                                                lineHeight: 32,
                                                fontType: VitaminFontFamily.Roboto.bold,
                                                textStyle: .title1,
                                                rawValue: "title1")
    public static let title2 = VitaminTextStyle(size: 24,
                                                lineHeight: 28,
                                                fontType: VitaminFontFamily.Roboto.bold,
                                                textStyle: .title2,
                                                rawValue: "title2")
    public static let title3 = VitaminTextStyle(size: 20,
                                                lineHeight: 24,
                                                fontType: VitaminFontFamily.Roboto.bold,
                                                textStyle: .title3,
                                                rawValue: "title3")
    public static let headline = VitaminTextStyle(size: 16,
                                                  lineHeight: 24,
                                                  fontType: VitaminFontFamily.Roboto.bold,
                                                  textStyle: .headline,
                                                  rawValue: "headline")
    public static let body = VitaminTextStyle(size: 17,
                                              lineHeight: 28,
                                              fontType: VitaminFontFamily.Roboto.regular,
                                              textStyle: .body,
                                              rawValue: "body")
    public static let bodyBold = VitaminTextStyle(size: 17,
                                                  lineHeight: 28,
                                                  fontType: VitaminFontFamily.Roboto.bold,
                                                  textStyle: .body,
                                                  rawValue: "bodyBold")
    public static let callout = VitaminTextStyle(size: 16,
                                                 lineHeight: 24,
                                                 fontType: VitaminFontFamily.Roboto.regular,
                                                 textStyle: .callout,
                                                 rawValue: "callout")
    public static let calloutBold = VitaminTextStyle(size: 16,
                                                     lineHeight: 24,
                                                     fontType: VitaminFontFamily.Roboto.bold,
                                                     textStyle: .callout,
                                                     rawValue: "calloutBold")
    public static let subhead = VitaminTextStyle(size: 15,
                                                 lineHeight: 20,
                                                 fontType: VitaminFontFamily.Roboto.regular,
                                                 textStyle: .subheadline,
                                                 rawValue: "subhead")
    public static let footnote = VitaminTextStyle(size: 14,
                                                  lineHeight: 20,
                                                  fontType: VitaminFontFamily.Roboto.regular,
                                                  textStyle: .footnote,
                                                  rawValue: "footnote")
    public static let footnoteBold = VitaminTextStyle(size: 14,
                                                      lineHeight: 20,
                                                      fontType: VitaminFontFamily.Roboto.bold,
                                                      textStyle: .footnote,
                                                      rawValue: "footnoteBold")
    public static let caption1 = VitaminTextStyle(size: 12,
                                                  lineHeight: 16,
                                                  fontType: VitaminFontFamily.Roboto.regular,
                                                  textStyle: .caption1,
                                                  rawValue: "caption1")
    public static let caption2 = VitaminTextStyle(size: 11,
                                                  lineHeight: 13,
                                                  fontType: VitaminFontFamily.Roboto.regular,
                                                  textStyle: .caption2,
                                                  rawValue: "caption2")
    public static let button = VitaminTextStyle(size: 16,
                                                lineHeight: 16,
                                                fontType: VitaminFontFamily.Roboto.bold,
                                                textStyle: .body,
                                                rawValue: "button")
    // internal text style used for badges
    public static let badgeSmall = VitaminTextStyle(size: 8,
                                                    lineHeight: 10,
                                                    fontType: VitaminFontFamily.Roboto.bold,
                                                    textStyle: .caption2,
                                                    rawValue: "badgeSmall")
    public static let badgeMedium = VitaminTextStyle(size: 12,
                                                     lineHeight: 16,
                                                     fontType: VitaminFontFamily.Roboto.bold,
                                                     textStyle: .caption2,
                                                     rawValue: "badgeMedium")
    public static let badgeLarge = VitaminTextStyle(size: 14,
                                                    lineHeight: 20,
                                                    fontType: VitaminFontFamily.Roboto.bold,
                                                    textStyle: .caption2,
                                                    rawValue: "badgeLarge")
}

// MARK: - RawRepresentable

/// - Note: The `VitaminTextStyle` use the `RawRepresentable` in order to be able.
/// to initialize a `VitaminTextStyle` from a String.
/// For example to use an `IBInspectable` on a `UILabel` to automatically set the style in the storyboard.
extension VitaminTextStyle: RawRepresentable {
    // swiftlint:disable:next cyclomatic_complexity
    public init?(rawValue: String) {
        switch rawValue {
        case "display": self = .display
        case "largeTitle1": self = .largeTitle1
        case "largeTitle2": self = .largeTitle2
        case "title1": self = .title1
        case "title2": self = .title2
        case "title3": self = .title3
        case "headline": self = .headline
        case "body": self = .body
        case "bodyBold": self = .bodyBold
        case "callout": self = .callout
        case "calloutBold": self = .calloutBold
        case "subhead": self = .subhead
        case "footnote": self = .footnote
        case "footnoteBold": self = .footnoteBold
        case "caption1": self = .caption1
        case "caption2": self = .caption2
        case "button": self = .button
        default: return nil
        }
    }
}

// MARK: - Private methods

extension VitaminTextStyle {
    /// The paragraph style for the current style.
    private func paragraphStyle(
        lineHeight: CGFloat,
        lineBreakMode: NSLineBreakMode
    ) -> NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.lineBreakMode = lineBreakMode
        return paragraphStyle
    }

    /// The baseline offset for the current style.
    private func baselineOffset(lineHeight: CGFloat, size: CGFloat) -> CGFloat {
        // Computing the baselineOffset needed to center the text in its line height.
        // The baselineOffset should be the quarter of the difference between size and lineheight.
        (lineHeight - size) / 4
    }
}

// MARK: - TextStyle extension

extension UIFont.TextStyle {
    /// Return a large title `TextStyle` compatible with the current iOS version.
    /// - Note: Return `.largeTitle` if iOS >= 11, otherwise `.title1`.
    static var largeTitleCompatibility: UIFont.TextStyle {
        if #available(iOS 11.0, *) {
            return .largeTitle
        } else {
            return .title1
        }
    }
}

// MARK: - Public methods

extension VitaminTextStyle {
    /// The font with the size for the current style.
    public var font: UIFont {
        fontType.font(size: size)
    }

    /// The font with a scaled size adjusted with accessibility settings for the current style.
    public var scaledFont: UIFont {
        if #available(iOS 11.0, *) {
            let metrics = UIFontMetrics(forTextStyle: textStyle)
            return metrics.scaledFont(for: font)
        } else {
            return font
        }
    }

    /// The scaled line height with the provided font for the current style.
    /// - Parameter font: The font for which we want the line height.
    /// - Returns: The adjusted line height value.
    public func scaledLineHeight(for font: UIFont) -> CGFloat {
        (lineHeight * font.pointSize) / size
    }

    /// The scaled line height with the provided font for the current style.
    /// - Parameter font: The font for which we want the line height.
    /// - Returns: The adjusted line height value.
    public func scaledRatio() -> CGFloat {
        scaledFont.pointSize / size
    }

    /// All attributes for the current style.
    /// `.foregroundColor`: The text color.
    /// `.font`: The font for the current style.
    /// `.paragraphStyle`: The paragraph style for the current style.
    /// `.baselineOffset`: The baselineOffset for the current style.
    @available(*, deprecated, renamed: "customAttributes()")
    public var attributes: [NSAttributedString.Key: Any] {
        customAttributes()
    }

    /// Customize and get all attributes for the current style.
    /// - Parameters:
    ///   - textColor: The color for the text. Optional. Default: `VitaminColor.Core.Content.primary`.
    ///   - lineBreakMode: The line break mode. Optional. Default: `NSLineBreakMode.byTruncatingTail`.
    /// - Returns: A dictionary of `NSAttributedString` attributes.
    ///     `.foregroundColor`: The text color.
    ///     `.font`: The font for the current style.
    ///     `.paragraphStyle`: The paragraph style for the current style.
    ///     `.baselineOffset`: The baselineOffset for the current style.
    public func customAttributes(
        textColor: UIColor? = nil,
        lineBreakMode: NSLineBreakMode? = nil
    ) -> [NSAttributedString.Key: Any] {
        let adjustedFont = scaledFont
        let adjustedSize = adjustedFont.pointSize
        let adjustedLineHeight = scaledLineHeight(for: adjustedFont)
        let paragraphStyle = paragraphStyle(lineHeight: adjustedLineHeight,
                                            lineBreakMode: lineBreakMode ?? .byTruncatingTail)
        let baselineOffset = baselineOffset(lineHeight: adjustedLineHeight, size: adjustedSize)
        return [
            .foregroundColor: textColor ?? VitaminColor.Core.Content.primary,
            .font: adjustedFont,
            .paragraphStyle: paragraphStyle,
            .baselineOffset: baselineOffset
        ]
    }
}

// MARK: - Public String extension

extension String {
    /// Get the `NSAttributedString` to render provided style.
    /// - Parameters:
    ///   - textStyle: The style that we want to apply.
    ///   - textColor: The color for the text. Optional. Default: `VitaminColor.Core.Content.primary`.
    ///   - lineBreakMode: The line break mode. Optional. Default: `NSLineBreakMode.byTruncatingTail`.
    /// - Returns: A `NSAttributedString` with all attributes.
    public func styled(
        as textStyle: VitaminTextStyle,
        with textColor: UIColor? = nil,
        lineBreakMode: NSLineBreakMode? = nil
    ) -> NSAttributedString {
        let attributes = textStyle.customAttributes(textColor: textColor, lineBreakMode: lineBreakMode)
        return NSAttributedString(string: self, attributes: attributes)
    }
}
