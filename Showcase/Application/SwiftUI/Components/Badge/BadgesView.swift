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
    @State var selectedSize: VitaminBadgeSize = .small

    var body: some View {
        VStack {
            Picker("Size", selection: $selectedSize) {
                Text("Small")
                    .tag(VitaminBadgeSize.small)
                Text("Medium")
                    .tag(VitaminBadgeSize.medium)
                Text("Large")
                    .tag(VitaminBadgeSize.large)
            }
            .padding()
            let items = BadgeModel.items
            List(items) { item in
                VitaminBadge(value: item.value,
                             variant: item.variant,
                             size: selectedSize)
            }
        }
        .frame(maxWidth: .infinity)
        .customNavigationTitle("Badges", displayMode: .inline)
    }
}

@available(iOS 13, *)
struct BadgesView_Previews: PreviewProvider {
    static var previews: some View {
        BadgesView()
    }
}
#endif
