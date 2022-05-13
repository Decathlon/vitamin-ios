//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
struct TypographyView: View {
    var body: some View {
        List {
            let items = TypographyModel.items
            ForEach(items) { item in
                makeTypographyRow(item)
            }
        }
        .customNavigationTitle("Typography", displayMode: .inline)
    }
}

@available(iOS 13, *)
extension TypographyView {
    private func makeTypographyRow(_ textStyle: TypographyModel.Item) -> some View {
        makeSection(textStyle.name) {
            HStack {
                Text(textStyle.text)
                    .vitaminTextStyle(textStyle.value)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
        }
    }
}
#endif
