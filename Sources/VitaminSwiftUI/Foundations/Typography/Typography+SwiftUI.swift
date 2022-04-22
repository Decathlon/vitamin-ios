//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCommon

@available(iOS 13, *)
struct TextStylesModifier: ViewModifier {
    let textStyle: VitaminTextStyle

    func body(content: Content) -> some View {
        content
            .font(textStyle.scaledFont.swiftUIFont)
            .lineSpacing(textStyle.lineHeight)
    }
}

@available(iOS 13, *)
extension Text {
    public func vitaminTextStyle(_ textStyle: VitaminTextStyle) -> some View {
        modifier(TextStylesModifier(textStyle: textStyle))
    }
}
