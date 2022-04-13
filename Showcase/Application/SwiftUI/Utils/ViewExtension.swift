//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCommon

@available(iOS 13, *)
extension View {
    @ViewBuilder
    func makeSection<Content: View>(
        _ title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        if #available(iOS 15, *) {
            Section(title, content: content)
        } else {
            Section {
                content()
            } header: {
                Text(title)
            } footer: {
                EmptyView()
            }
        }
    }
}

@available(iOS 13, *)
extension View {
    @ViewBuilder
    func makeRow<Content: View>(
        _ title: String,
        textStyle: VitaminTextStyle = .caption2,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack {
            content()
            Text(title)
                .vitaminTextStyle(textStyle)
        }
        .frame(maxWidth: .infinity)
    }
}
