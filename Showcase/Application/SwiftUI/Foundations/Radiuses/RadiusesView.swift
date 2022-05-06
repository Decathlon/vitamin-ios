//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCore

@available(iOS 13, *)
struct RadiusesView: View {
    var body: some View {
        List {
            let items = RadiusesModel.items
            ForEach(items) { item in
                makeRadiusRow(item)
                makeBorderRadiusRow(item)
                makeBorderStyleRadiusRow(item)
            }
        }
        .customNavigationTitle("Radiuses", displayMode: .inline)
    }
}

@available(iOS 13, *)
extension RadiusesView {
    private func makeRadiusRow(_ radius: RadiusesModel.Item) -> some View {
        HStack {
            Text("Test with \(radius.name)")
                .foregroundColor(VitaminColor.Core.Content.primaryReversed.swiftUIColor)
                .padding(20)
                .background(
                    Rectangle()
                        .foregroundColor(VitaminColor.Core.Background.brandPrimary.swiftUIColor)
                        .vitaminRadius(radius.value)
                )
        }
        .frame(maxWidth: .infinity)
        .padding()
    }

    private func makeBorderRadiusRow(_ radius: RadiusesModel.Item) -> some View {
        HStack {
            Text("Test with \(radius.name)")
                .foregroundColor(VitaminColor.Core.Content.active.swiftUIColor)
                .padding(20)
                .vitaminAddBorderRadius(radius.value,
                                        content: VitaminColor.Core.Border.active.swiftUIColor,
                                        lineWidth: 1)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }

    private func makeBorderStyleRadiusRow(_ radius: RadiusesModel.Item) -> some View {
        HStack {
            Text("Test with \(radius.name)")
                .foregroundColor(VitaminColor.Core.Content.active.swiftUIColor)
                .padding(20)
                .vitaminAddBorderRadius(radius.value,
                                        content: VitaminColor.Core.Border.active.swiftUIColor,
                                        style: StrokeStyle(lineWidth: 1, dash: [10]))
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}
