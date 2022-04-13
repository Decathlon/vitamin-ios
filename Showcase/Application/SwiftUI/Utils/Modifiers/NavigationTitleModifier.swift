//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI

@available(iOS 14, *)
struct NavigationTitleViewModifier: ViewModifier {
    let title: String
    let displayMode: NavigationBarItem.TitleDisplayMode

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(displayMode)
    }
}

@available(iOS 13, *)
struct NavigationBarTitleViewModifier: ViewModifier {
    let title: String
    let displayMode: NavigationBarItem.TitleDisplayMode

    func body(content: Content) -> some View {
        content
            .navigationBarTitle(Text(title), displayMode: displayMode)
    }
}

@available(iOS 13, *)
extension View {
    @ViewBuilder
    func customNavigationTitle(_ title: String, displayMode: NavigationBarItem.TitleDisplayMode) -> some View {
        if #available(iOS 14, *) {
            self.modifier(NavigationTitleViewModifier(title: title, displayMode: displayMode))
        } else {
            self.modifier(NavigationBarTitleViewModifier(title: title, displayMode: displayMode))
        }
    }
}
