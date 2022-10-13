//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
struct TextStylesModifier: ViewModifier {
    let textStyle: VitaminTextStyle

    func body(content: Content) -> some View {
        let font = textStyle.scaledFont
        let lineSpacing = textStyle.scaledLineHeight(for: font) - font.pointSize
        content
            .font(font.swiftUIFont)
            .lineSpacing(lineSpacing)
            .padding(.vertical, lineSpacing / 2)
    }
}

@available(iOS 13, *)
extension Text {
    public func vitaminTextStyle(_ textStyle: VitaminTextStyle) -> some View {
        modifier(TextStylesModifier(textStyle: textStyle))
    }
}
#endif
