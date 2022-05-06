//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCore
import VitaminSwiftUI

@available(iOS 13, *)
struct ColorsView: View {
    var body: some View {
        List {
            let sections = ColorsModel.sections
            ForEach(sections) { section in
                makeColorSection(section)
            }
        }
        .customNavigationTitle("Colors", displayMode: .inline)
    }
}

// MARK: - Helpers

@available(iOS 13, *)
extension ColorsView {
    func makeColorSection(_ section: ColorsModel.Section) -> some View {
        makeSection(section.name) {
            ForEach(section.items) { item in
                makeColorRow(item)
            }
        }
    }

    func makeColorRow(_ item: ColorsModel.Item) -> some View {
        HStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(item.color.swiftUIColor)
                .background(
                    Image("checkboard")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
                .frame(width: 60, height: 60)
            Text(item.name)
                .vitaminTextStyle(.body)
            Spacer()
        }
        .padding(.vertical, 4)
        .frame(maxWidth: .infinity)
    }
}
