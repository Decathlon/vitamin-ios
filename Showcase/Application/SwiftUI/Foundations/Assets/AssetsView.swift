//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore
import VitaminSwiftUI

@available(iOS 13, *)
struct AssetsView: View {
    var body: some View {
        List {
            makeLogosSection()
            makeStandardSections()
        }
        .customNavigationTitle("Assets", displayMode: .inline)
    }
}

// MARK: - Content methods

@available(iOS 13, *)
extension AssetsView {
    private func makeLogosSection() -> some View {
        makeSpacedSection("Logos") {
            makeRow(asset: VitaminAssets.Logo.logo)
            makeRow(asset: VitaminAssets.Logo.logoWithOutline)
            HStack {
                makeSmallRow(asset: VitaminAssets.Logo.favicon)
                makeSmallRow(asset: VitaminAssets.Logo.faviconBlack)
            }
        }
    }

    @ViewBuilder
    private func makeStandardSections() -> some View {
        let sections = AssetsModel.sections
        ForEach(sections) { section in
            makeAssetSection(section.name, assets: section.items)
        }
    }
}

@available(iOS 13, *)
extension VitaminAsset: AssetProtocol {
    var label: String {
        name
    }

    var swiftUIImage: Image {
        image
    }
}
#endif
