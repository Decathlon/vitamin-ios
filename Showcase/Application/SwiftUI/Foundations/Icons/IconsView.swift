//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
struct IconsView: View {
    var body: some View {
        List {
            let sections = IconsModel.sections
            ForEach(sections) { section in
                makeAssetSection(section.name,
                                 assets: section.items,
                                 iconSize: 24)
            }
        }
        .customNavigationTitle("Icons", displayMode: .inline)
    }
}
#endif
