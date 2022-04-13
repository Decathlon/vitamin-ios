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
    func makeSpacedSection<Content: View>(
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

@available(iOS 13, *)
protocol AssetProtocol: Hashable {
    var name: String { get }
    var label: String { get }
    var swiftUIImage: SwiftUI.Image { get }
}

@available(iOS 13, *)
extension AssetProtocol {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

@available(iOS 13, *)
extension View {
    func makeAssetSection<Asset: AssetProtocol>(
        _ title: String,
        assets: [Asset],
        iconSize: CGFloat = 44
    ) -> some View {
        makeSpacedSection(title) {
            let splitAssets = assets.chunked(into: 4)
            ForEach(splitAssets, id: \.self) { assetsLine in
                makeMultiRow(assets: assetsLine, iconSize: iconSize)
            }
        }
    }

    func makeRow<Asset: AssetProtocol>(
        asset: Asset
    ) -> some View {
        makeRow(asset.label) {
            asset.swiftUIImage
        }
    }

    func makeSmallRow<Asset: AssetProtocol>(
        asset: Asset,
        iconSize: CGFloat = 44
    ) -> some View {
        makeRow(asset.label) {
            asset.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: iconSize, height: iconSize)
        }
    }

    func makeMultiRow<Asset: AssetProtocol>(
        assets: [Asset],
        iconSize: CGFloat = 44
    ) -> some View {
        HStack {
            ForEach(assets, id: \.name) { asset in
                makeSmallRow(asset: asset, iconSize: iconSize)
            }
        }
    }
}
