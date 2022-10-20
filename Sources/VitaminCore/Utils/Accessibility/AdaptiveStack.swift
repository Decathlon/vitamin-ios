//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI

@available(iOS 13, *)
/// Stack that switch from `HStack` to `VStack` when the `ContentSizeCategory` is more than `.extraExtraLarge`.
public struct AdaptiveStack<Content: View>: View {
    @Environment(\.sizeCategory) private var sizeCategory: ContentSizeCategory

    private let largeSizeCategories: [ContentSizeCategory] = [
        .extraExtraLarge,
        .extraExtraExtraLarge,
        .accessibilityMedium,
        .accessibilityLarge,
        .accessibilityExtraLarge,
        .accessibilityExtraExtraLarge,
        .accessibilityExtraExtraExtraLarge
    ]

    public let spacing: CGFloat
    public let vStackAlignment: HorizontalAlignment
    public let hStackAlignment: VerticalAlignment
    public let content: () -> Content

    /// Stack that switch from `HStack` to `VStack` when the `ContentSizeCategory` is more than `.extraExtraLarge`.
    /// - Parameters:
    ///   - spacing: Spacing for the stack.
    ///   - vStackAlignment: Alignment for `VStack`.
    ///   - hStackAlignment: Alignment for `HStack`.
    ///   - content: Content that need to be inside the stack.
    public init(
        spacing: CGFloat = 10,
        vStackAlignment: HorizontalAlignment = .center,
        hStackAlignment: VerticalAlignment = .center,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.spacing = spacing
        self.vStackAlignment = vStackAlignment
        self.hStackAlignment = hStackAlignment
        self.content = content
    }

    public var body: some View {
        if largeSizeCategories.contains(sizeCategory) {
            VStack(alignment: vStackAlignment, spacing: spacing) {
                content()
            }
        } else {
            HStack(alignment: hStackAlignment, spacing: spacing) {
                content()
            }
        }
    }
}

@available(iOS 13, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveStack {
            Text("Hello")
            Text("World")
        }
    }
}
#endif
