//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCommon

@available(iOS 13, *)
struct ShadowsModifier: ViewModifier {
    let shadow: VitaminShadow

    func body(content: Content) -> some View {
        content
            .shadow(color: shadow.color.swiftUIColor,
                    radius: shadow.blur,
                    x: shadow.size.width,
                    y: shadow.size.height)
    }
}

@available(iOS 13, *)
extension View {
    public func vitaminShadow(_ shadow: VitaminShadow) -> some View {
        modifier(ShadowsModifier(shadow: shadow))
    }
}
