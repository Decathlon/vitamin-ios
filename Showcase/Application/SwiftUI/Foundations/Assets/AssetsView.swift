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
        makeAssetSection("Flags", assets: AssetsModel.flags)
    }

    @ViewBuilder
    private func makePaymentSection() -> some View {
        makeAssetSection("Payment", assets: AssetsModel.payment)
    }

    @ViewBuilder
    private func makePlaceholdersSection() -> some View {
        makeAssetSection("Placeholders", assets: AssetsModel.placeholders)
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

    private func makeAssetSection(_ title: String, assets: [VitaminAsset]) -> some View {
        makeAssetSection(title) {
            let splitAssets = assets.chunked(into: 4)
            ForEach(splitAssets, id: \.self) { assetsLine in
                makeMultiRow(assets: assetsLine)
            }
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
                .aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44)
        }
    }

    private func makeMultiRow(assets: [VitaminAsset]) -> some View {
        HStack {
            ForEach(assets, id: \.name) { asset in
                makeSmallRow(asset: asset)
            }
        }
    }
}
