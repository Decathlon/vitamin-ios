//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class BadgesViewController: BaseHeaderedCollectionViewController {
    private static let reuseId = "badge"
    private var sections: [VitaminBadgeSection] = [] {
        didSet {
            sectionHeaders = fillBaseHeaderSections(namedSections: sections)
        }
    }

    convenience init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = false
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 10
        layout.estimatedItemSize = .zero
        self.init(collectionViewLayout: layout)
    }

    private let datasource: [VitaminBadgeDemoConfig] = [
        VitaminBadgeDemoConfig(),
        VitaminBadgeDemoConfig(value: 2),
        VitaminBadgeDemoConfig(value: 50),
        VitaminBadgeDemoConfig(value: 100),
        VitaminBadgeDemoConfig(variant: .brand),
        VitaminBadgeDemoConfig(value: 2, variant: .brand),
        VitaminBadgeDemoConfig(value: 50, variant: .brand),
        VitaminBadgeDemoConfig(value: 100, variant: .brand),
        VitaminBadgeDemoConfig(variant: .reversed),
        VitaminBadgeDemoConfig(value: 2, variant: .reversed),
        VitaminBadgeDemoConfig(value: 50, variant: .reversed),
        VitaminBadgeDemoConfig(value: 100, variant: .reversed),
        VitaminBadgeDemoConfig(variant: .accent),
        VitaminBadgeDemoConfig(value: 2, variant: .accent),
        VitaminBadgeDemoConfig(value: 50, variant: .accent),
        VitaminBadgeDemoConfig(value: 100, variant: .accent),
        VitaminBadgeDemoConfig(variant: .alert),
        VitaminBadgeDemoConfig(value: 2, variant: .alert),
        VitaminBadgeDemoConfig(value: 50, variant: .alert),
        VitaminBadgeDemoConfig(value: 100, variant: .alert)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Badge"
        makeSections()
        collectionView.backgroundColor = VitaminColor.Core.Background.tertiary
        collectionView.register(
            UINib(
                nibName: "BadgeCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: Self.reuseId)
    }
}

// MARK: - UICollectionViewDataSource
extension BadgesViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        sections[section].configs.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard sections[indexPath.section].configs.count > indexPath.row else {
            fatalError("Unable to find a badge config to display")
        }
        let badgeItem = sections[indexPath.section].configs[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Self.reuseId,
            for: indexPath) as? BadgeCollectionViewCell else {
                    fatalError("unable to dequeue cell")
                }

        cell.update(with: badgeItem.value, variant: badgeItem.variant, automatic: indexPath.section == 1)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BadgesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        guard indexPath.section == 0 else {
            return CGSize(width: 165, height: 200)
        }
        return CGSize(width: 165, height: 150)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

extension BadgesViewController {
    private func makeSections() {
        sections = [
            VitaminBadgeSection(
                name: "Manually Added Badges",
                configs: datasource
            ),
            VitaminBadgeSection(
                name: "Automatically Added Badges",
                configs: datasource
            )
        ]
    }
}

private struct VitaminBadgeDemoConfig {
    var value: Int?
    var variant: VitaminBadgeVariant = .standard
}

private struct VitaminBadgeSection: BaseNamedSection {
    var name: String = ""
    var configs: [VitaminBadgeDemoConfig] = []
}
