//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminSwiftUI
import VitaminCore

@available(iOS 13, *)
struct BadgesView: View {
    @Environment(\.sizeCategory) var sizeCategory: ContentSizeCategory

    let largeSizeCategories: [ContentSizeCategory] = [
        .extraExtraLarge,
        .extraExtraExtraLarge,
        .accessibilityMedium,
        .accessibilityLarge,
        .accessibilityExtraLarge,
        .accessibilityExtraExtraLarge,
        .accessibilityExtraExtraExtraLarge
    ]

    var body: some View {
//        ScrollView {
//            VStack(spacing: 0) {
            List {
                let sections = BadgeModel.sections
                ForEach(sections) { section in
                    makeBadgeSection(section)
                }
            }
//            .frame(maxWidth: .infinity)
//        }
        .customNavigationTitle("Badges", displayMode: .inline)
    }

    private func makeBadgeSection(_ section: BadgeModel.Section) -> some View {
        makeSection(section.name) {
            ForEach(section.items) { item in
                makeBadgeRow(value: item.value, variant: item.variant)
            }
        }
    }

    @ViewBuilder
    private func makeBadgeRow(value: Int?, variant: VitaminBadgeVariant) -> some View {
        if largeSizeCategories.contains(sizeCategory) {
            VStack(spacing: 20) {
                ForEach(VitaminBadgeSize.allCases, id: \.self) { size in
                    Spacer()
                    makeNotificationIcon(variant: variant, size: size)
                        .vitaminBadge(value, variant: variant, size: size)
                }
                Spacer()
            }
            .padding(.top, 20)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .background(backgroundColor(for: variant))
        } else {
            HStack(spacing: 20) {
                ForEach(VitaminBadgeSize.allCases, id: \.self) { size in
                    Spacer()
                    makeNotificationIcon(variant: variant, size: size)
                        .vitaminBadge(value, variant: variant, size: size)
                }
                Spacer()
            }
            .padding(.top, 20)
            .padding(.bottom, 10)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .background(backgroundColor(for: variant))
        }
    }

    private func makeNotificationIcon(
        variant: VitaminBadgeVariant,
        size: VitaminBadgeSize
    ) -> some View {
        iconImage(for: variant)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .foregroundColor(iconColor(for: variant))
//            .imageScale(.small)
            .frame(width: iconSize(for: size), height: iconSize(for: size))
    }

    private func iconSize(for size: VitaminBadgeSize) -> CGFloat {
        var sizeValue: CGFloat = 0
        switch size {
        case .small:
            sizeValue = 20
        case .medium:
            sizeValue = 25
        case .large:
            sizeValue = 30
        }
        return UIFontMetrics.default.scaledValue(for: sizeValue)
    }

    private func iconImage(for variant: VitaminBadgeVariant) -> Image {
        switch variant {
        case .accent:
            return Vitamix.Fill.Finance.shoppingCart.swiftUIImage
        default:
            return Vitamix.Fill.Media.notification.swiftUIImage
        }
    }

    private func iconColor(for variant: VitaminBadgeVariant) -> Color {
        switch variant {
        case .standard, .reversed:
            return VitaminColor.Core.Content.primaryReversed.swiftUIColor
        default:
            return VitaminColor.Core.Content.primary.swiftUIColor
        }
    }

    private func backgroundColor(for variant: VitaminBadgeVariant) -> Color {
        switch variant {
        case .standard, .reversed:
            return VitaminColor.Core.Background.brandPrimary.swiftUIColor
        default:
            return VitaminColor.Core.Background.primary.swiftUIColor
        }
    }
}

@available(iOS 13, *)
struct BadgesView_Previews: PreviewProvider {
    static var previews: some View {
        BadgesView()
    }
}
#endif
