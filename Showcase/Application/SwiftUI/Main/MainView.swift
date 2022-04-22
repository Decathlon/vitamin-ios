//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI

@available(iOS 13, *)
struct MainView: View {
    var body: some View {
        NavigationView {
            List {
                makeFoundationsSection()
                makeComponentsSection()
            }
            .customNavigationTitle("Vitamin Showcase", displayMode: .inline)
        }
    }

    private func makeFoundationsSection() -> some View {
        makeSection("🌳 Foundations") {
            NavigationLink("🎇 Assets", destination: AssetsView())
            NavigationLink("🖼 Icons", destination: IconsView())
        }
    }

    private func makeComponentsSection() -> some View {
        makeSection("🧩 Components") {
            EmptyView()
        }
    }
}

// MARK: - Private methods

@available(iOS 13, *)
extension MainView {
    @ViewBuilder
    private func makeSection<Content: View>(
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
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}