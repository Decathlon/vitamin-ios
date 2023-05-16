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
    var body: some View {
        List {
            let sections = BadgeModel.sections
            ForEach(sections) { section in
                makeBadgeSection(section)
            }
        }
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
        AdaptiveStack(spacing: 20) {
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
    }

    private func makeNotificationIcon(
        variant: VitaminBadgeVariant,
        size: VitaminBadgeSize
    ) -> some View {
        iconImage(for: variant)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .foregroundColor(iconColor(for: variant))
            .dynamicFrame(width: iconSize(for: size), height: iconSize(for: size))
    }

    private func iconSize(for size: VitaminBadgeSize) -> CGFloat {
        switch size {
        case .small:
            return 20
        case .medium:
            return 25
        case .large:
            return 30
        }
    }

    private func iconImage(for variant: VitaminBadgeVariant) -> Image {
        if case .accent = variant {
            return Image.Vitamix.shoppingCartFill
        }
        return Image.Vitamix.notificationFill
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

import PreviewSnapshots

@available(iOS 13, *)
struct BadgesView_Previews: PreviewProvider {
    static var previews: some View {
      snapshots.previews.previewLayout(.sizeThatFits)
    }
  
  static var snapshots: PreviewSnapshots<Void> {
    PreviewSnapshots(
      configurations: [
        .init(name: "Badges", state: ())
      ],
      configure: { _ in
        VStack {
          BadgesView()
            .frame(width: 390, height: 1500)
            .padding()
        }
      }
    )
  }
}
#endif
