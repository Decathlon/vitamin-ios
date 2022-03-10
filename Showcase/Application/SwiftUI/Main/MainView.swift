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
                makeSection("🌳 Foundations") {
                    NavigationLink("🎨 Colors", destination: EmptyView())
                    NavigationLink("🖼 Icons", destination: EmptyView())
                    NavigationLink("🌘 Shadows", destination: EmptyView())
                    NavigationLink("🖋 Typography", destination: EmptyView())
                }
                makeSection("🧩 Components") {
                    NavigationLink("🕹 Button", destination: EmptyView())
                    NavigationLink("🎚 Switch", destination: EmptyView())
                    NavigationLink("💬 TextField", destination: EmptyView())
                }
            }
            .customNavigationTitle("Vitamin Showcase", displayMode: .inline)
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
