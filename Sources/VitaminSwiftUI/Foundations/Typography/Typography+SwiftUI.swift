//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCore

@available(iOS 13, *)
struct TextStylesModifier: ViewModifier {
    let textStyle: VitaminTextStyle

    func body(content: Content) -> some View {
        let font = textStyle.scaledFont
        let lineSpacing = textStyle.lineHeight - textStyle.scaledLineHeight(for: font)
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
