//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCommon

@available(iOS 13, *)
struct ShadowsView: View {
    var body: some View {
        List {
            let items = ShadowsModel.items
            ForEach(items) { item in
                makeShadowRow(item)
            }
        }
        .customNavigationTitle("Shadows", displayMode: .inline)
    }
}

@available(iOS 13, *)
extension ShadowsView {
    private func makeShadowRow(_ shadow: ShadowsModel.Item) -> some View {
        VStack {
            Text("Test with \(shadow.name)")
                .foregroundColor(VitaminColor.Core.Content.primary.swiftUIColor)
                .padding(20)
                .background(VitaminColor.Core.Background.primary.swiftUIColor)
                .vitaminShadow(shadow.value)
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 100 + shadow.value.blur)
        .padding()
        .clipped()
    }
}
