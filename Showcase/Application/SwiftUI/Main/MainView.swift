//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
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
        .navigationViewStyle(.stack)
    }

    private func makeFoundationsSection() -> some View {
        makeSection("🌳 Foundations") {
            NavigationLink("🎇 Assets", destination: AssetsView())
            NavigationLink("🎨 Colors", destination: ColorsView())
            NavigationLink("🖼 Icons", destination: IconsView())
            NavigationLink("⭕️ Radius", destination: RadiusesView())
            NavigationLink("🌘 Shadows", destination: ShadowsView())
            NavigationLink("🖋 Typography", destination: TypographyView())
        }
    }

    private func makeComponentsSection() -> some View {
        makeSection("🧩 Components") {
            NavigationLink("🥇 Badge", destination: BadgesView())
            NavigationLink("🕹 Button", destination: ButtonsView())
            NavigationLink("🔏 TextField", destination: TextFieldsView())
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
#endif
