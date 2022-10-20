//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
public struct VitaminBadge: View {
    let value: Int?
    let variant: VitaminBadgeVariant
    let size: VitaminBadgeSize

    public init(
        value: Int? = nil,
        variant: VitaminBadgeVariant = .accent,
        size: VitaminBadgeSize = .small
    ) {
        self.value = value
        self.variant = variant
        self.size = size
    }

    public var body: some View {
        if value == nil {
            makeEmptyBadgeView()
        } else {
            makeTextBadgeView()
        }
    }

    private var badgeText: String {
        VitaminBadgeLogic.badgeText(for: value)
    }

    private func makeEmptyBadgeView() -> some View {
        Circle()
            .fill(variant.backgroundColor.swiftUIColor)
            .frame(width: emptySize, height: emptySize)
    }

    private func makeTextBadgeView() -> some View {
        Text(badgeText)
            .vitaminTextStyle(size.textStyle)
            .foregroundColor(variant.foregroundColor.swiftUIColor)
            .padding(.horizontal, horizontalPadding)
            .background(
                Capsule()
                    .fill(variant.backgroundColor.swiftUIColor,
                          strokeBorder: variant.borderColor.swiftUIColor,
                          lineWidth: variant.borderWidth)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
    }
}

// MARK: Helpers

@available(iOS 13, *)
extension VitaminBadge {
    private var emptySize: CGFloat {
        8 * size.textStyle.scaledRatio()
    }

    private var horizontalPadding: CGFloat {
        let ratio = size.textStyle.scaledRatio()
        switch size {
        case .small:
            return 4 * ratio
        case .medium:
            return 5 * ratio
        case .large:
            return 6 * ratio
        }
    }
}

@available(iOS 13, *)
struct VitaminBadge_Previews: PreviewProvider {
    static var previews: some View {
        VitaminBadge(value: 1)
    }
}
#endif
