//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class AssetsViewController: BaseImageCollectionViewController {
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = false
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.estimatedItemSize = .zero
        self.init(collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sections = makeSections()

        view.backgroundColor = VitaminColor.Core.Background.primary
        collectionView.backgroundColor = VitaminColor.Core.Background.primary

        navigationItem.title = "Assets"
        collectionView.register(
            UINib(
                nibName: "AssetCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "asset")
        collectionView.register(
            UINib(
                nibName: "LargeAssetCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "largeAsset")

        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header")

        if let flow = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.headerReferenceSize = CGSize(width: view.frame.width, height: 55)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AssetsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let defaultSize = CGSize(width: view.frame.width / 5, height: 90)
        guard
            let assetItem = sections[indexPath.section].items[indexPath.row] as? AssetItem
        else {
            return defaultSize
        }
        switch assetItem.type {
        case .large:
            return CGSize(width: view.frame.width, height: 110)
        case.medium:
            return CGSize(width: view.frame.width / 2.1, height: 90)
        case .standard:
            return defaultSize
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}

// MARK: - UICollectionViewDataSource
extension AssetsViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        sections[section].items.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let assetItem = sections[indexPath.section].items[indexPath.row] as? AssetItem else {
            return AssetCollectionViewCell()
        }
        let reuseId = (assetItem.type == .large ? "largeAsset" : "asset")
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseId,
            for: indexPath) as? AssetCollectionViewCell else {
                    return AssetCollectionViewCell()
                }

        cell.setImage(assetItem.image,
                      name: assetItem.shortName,
                      textColor: VitaminColor.Core.Content.primary)
        return cell
    }
}

// MARK: - private structs and functions
extension AssetsViewController {
    private struct AssetSection: BaseImageSection {
        let name: String
        let items: [BaseImageItem]
    }

    private struct AssetItem: BaseImageItem {
        let name: String
        let image: UIImage
        var type: AssetItemType = .standard

        var shortName: String {
            let components = name.components(separatedBy: ".")
            if components.count >= 3 {
                return components[2]
            }
            return name
        }
    }

    private enum AssetItemType {
        case large, medium, standard
    }

    private func makeSections() -> [AssetSection] {
        var sections: [AssetSection] = []
        // Add logos
        sections.append(makeLogosSection())
        sections.append(contentsOf: AssetsModel.sections.map { section -> AssetSection in
            let assets: [AssetItem] = section.items.map { item in
                AssetItem(name: item.name, image: item.image)
            }
            return AssetSection(name: section.name, items: assets)
        })
        return sections
    }

    private func makeLogosSection() -> AssetSection {
        AssetSection(name: "Logos", items: [
            AssetItem(name: "VitaminAssets.Logo.logo.image",
                      image: VitaminAssets.Logo.logo.image,
                      type: .large),
            AssetItem(name: "VitaminAssets.Logo.logoOutlined.image",
                      image: VitaminAssets.Logo.logoOutlined.image,
                      type: .large),
            AssetItem(name: "VitaminAssets.Logo.favicon.image",
                      image: VitaminAssets.Logo.favicon.image,
                      type: .medium),
            AssetItem(name: "VitaminAssets.Logo.faviconBlack.image",
                      image: VitaminAssets.Logo.faviconBlack.image,
                      type: .medium)
        ])
    }
}
