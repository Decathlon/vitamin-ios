//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
struct BadgeModifier: ViewModifier {
    let value: Int?
    let variant: VitaminBadgeVariant
    let size: VitaminBadgeSize
    @State private var badgeSize: CGSize = .zero

    func body(content: Content) -> some View {
        content.overlay(makeBadgeView(),
                        alignment: .topTrailing)
    }

    private func makeBadgeView() -> some View {
        VitaminBadge(value: value, variant: variant, size: size)
            .onSizeChange { size in
                self.badgeSize = size
            }
            .padding(.trailing, -badgeSize.width / 2)
            .padding(.top, -badgeSize.height / 2)
    }
}

@available(iOS 13, *)
extension View {
    public func vitaminBadge(
        _ value: Int? = nil,
        variant: VitaminBadgeVariant = .standard,
        size: VitaminBadgeSize = .small
    ) -> some View {
        modifier(BadgeModifier(value: value, variant: variant, size: size))
    }
}
#endif
