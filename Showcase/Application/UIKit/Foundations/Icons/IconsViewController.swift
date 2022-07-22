//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class IconsViewController: BaseImageCollectionViewController {
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

        navigationItem.title = "Icons"
        collectionView.register(
            UINib(
                nibName: "IconCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "icon")

        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header")

        if let flow = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.headerReferenceSize = CGSize(width: view.frame.width, height: 55)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension IconsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: view.frame.width / 5, height: 80)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}

extension IconsViewController {
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
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "icon",
            for: indexPath) as? IconCollectionViewCell,
              let iconItem = sections[indexPath.section].items[indexPath.row] as? IconItem else {
                    return IconCollectionViewCell()
                }
        cell.setImage(iconItem.image,
                      name: iconItem.shortName,
                      color: VitaminColor.Core.Content.primary)
        return cell
    }
}

extension IconsViewController {
    private struct IconSection: BaseImageSection {
        let name: String
        let items: [BaseImageItem]
    }

    private struct IconItem: BaseImageItem {
        let name: String
        let image: UIImage

        var shortName: String {
            name.components(separatedBy: "/").last ?? name
        }
    }

    private func makeSections() -> [IconSection] {
        IconsModel.sections.map { section -> IconSection in
            let icons: [IconItem] = section.items.map { item in
                IconItem(name: item.name, image: item.image)
            }
            return IconSection(name: section.name, items: icons)
        }
    }
}
