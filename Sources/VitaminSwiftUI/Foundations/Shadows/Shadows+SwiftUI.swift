//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

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
#endif
