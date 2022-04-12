//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCommon
import VitaminSwiftUI

@available(iOS 13, *)
struct AssetsView: View {
    var body: some View {
        List {
            makeLogosSection()
            makeFlagsSection()
            makePaymentSection()
            makePlaceholdersSection()
        }
        .customNavigationTitle("Assets", displayMode: .inline)
    }
}

// MARK: - Content methods

@available(iOS 13, *)
extension AssetsView {
    @ViewBuilder
    private func makeLogosSection() -> some View {
        makeAssetSection("Logos") {
            makeRow(asset: VitaminAssets.Logo.logo)
            makeRow(asset: VitaminAssets.Logo.logoOutlined)
            HStack {
                makeSmallRow(asset: VitaminAssets.Logo.favicon)
                makeSmallRow(asset: VitaminAssets.Logo.faviconBlack)
            }
        }
    }

    @ViewBuilder
    private func makeFlagsSection() -> some View {
        makeAssetSection("Flags") {
            EmptyView()
        }
    }

    @ViewBuilder
    private func makePaymentSection() -> some View {
        makeAssetSection("Payment") {
            EmptyView()
        }
    }

    @ViewBuilder
    private func makePlaceholdersSection() -> some View {
        makeAssetSection("Placeholders") {
            makeSmallRow(asset: VitaminAssets.Placeholder.landscape)
        }
    }
}

// MARK: - Helpers methods

@available(iOS 13, *)
extension AssetsView {
    @ViewBuilder
    private func makeAssetSection<Content: View>(
        _ title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        makeSection(title) {
            VStack(spacing: 40) {
                content()
            }
            .padding(.vertical, 10)
        }
    }

    private func makeRow(asset: VitaminAsset) -> some View {
        makeRow(asset.name) {
            asset.swiftUIImage
        }
    }

    private func makeSmallRow(asset: VitaminAsset) -> some View {
        makeRow(asset.name) {
            asset.swiftUIImage
                .resizable()
                .frame(width: 44, height: 44)
        }
    }
}
