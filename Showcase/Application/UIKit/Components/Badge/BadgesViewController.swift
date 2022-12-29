//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class BadgesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var sectionHeaders: [String] = []
    private static let reuseId = "badge"
    var sections: [VitaminBadgeSection] = [] {
        didSet {
            sectionHeaders = fillBaseHeaderSections(namedSections: sections)
        }
    }

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = false
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 10
        layout.estimatedItemSize = .zero
        let frame = self.view.frame
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = VitaminColor.Core.Background.tertiary
        collectionView.register(
            UINib(
                nibName: "BadgeCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: Self.reuseId)

        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header")

        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["small", "medium", "large"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(self.segmentedControlChanged), for: .valueChanged)
        return segmentedControl
    }()

    lazy var container: UIView = {
        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = VitaminColor.Core.Background.tertiary
        return container
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = VitaminColor.Core.Background.primary
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = false

        view.addSubview(collectionView)
        view.addSubview(container)

        buildSegmentedControlContainer()
        buildCollectionView()

        if let flow = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.headerReferenceSize = CGSize(width: view.frame.width, height: 45)
        }

        navigationItem.title = "Badge"
        makeSections()

        collectionView.reloadData()
    }

    @objc func segmentedControlChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            makeSections(size: .small)
        case 1:
            makeSections(size: .medium)
        case 2:
            makeSections(size: .large)
        default:
            makeSections(size: .small)
        }
        collectionView.reloadData()
    }

    let datasource: [VitaminBadgeDemoConfig] = [
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
}

// MARK: - UICollectionViewDataSource
extension BadgesViewController {
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            fatalError("Only section header is handled")
        }
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header",
            for: indexPath)

        headerView.backgroundColor = VitaminColor.Core.Background.tertiary
        if headerView.subviews.isEmpty {
            headerView.addSubview(
                UILabel(
                    frame: CGRect(
                        x: 15,
                        y: 20,
                        width: (view.frame.width - 15),
                        height: 25)))
        }

        if let headerLabel = headerView.subviews[0] as? UILabel {
            headerLabel.backgroundColor = .clear
            headerLabel.attributedText = self
                .sectionHeaders[indexPath.section]
                .uppercased()
                .styled(as: .headline, with: VitaminColor.Core.Content.tertiary)
            headerLabel.textColor = VitaminColor.Core.Content.primary
            headerLabel.textAlignment = .left
        }

        return headerView
    }

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        sections[section].configs.count
    }

    public func collectionView(
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

        cell.update(
            with: badgeItem.value,
            variant: badgeItem.variant,
            size: badgeItem.size,
            automatic: indexPath.section == 1
        )
        return cell
    }

    func fillBaseHeaderSections(namedSections: [BaseNamedSection]) -> [String] {
        var localSectionsHeaders: [String] = []
        namedSections.forEach {
            localSectionsHeaders.append($0.name)
        }
        return localSectionsHeaders
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
            return CGSize(width: 88, height: 110)
        }
        return CGSize(width: 88, height: 90)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}

extension BadgesViewController {
    private func makeSections(size: VitaminBadgeSize = .small) {
        var datasourceBySize: [VitaminBadgeDemoConfig] = []
        for config in datasource {
            datasourceBySize.append(VitaminBadgeDemoConfig(value: config.value, variant: config.variant, size: size))
        }
        sections = [
            VitaminBadgeSection(
                name: "Manually Added Badges",
                configs: datasourceBySize
            ),
            VitaminBadgeSection(
                name: "Automatically Added Badges",
                configs: datasourceBySize
            )
        ]
    }

    private func buildSegmentedControlContainer() {
        container.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        container.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: 50).isActive = true
        container.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true

        container.addSubview(segmentedControl)


        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.centerXAnchor.constraint(
            equalTo: container.centerXAnchor
        ).isActive = true
        segmentedControl.topAnchor.constraint(
            equalTo: container.topAnchor,
            constant: 10
        ).isActive = true
        segmentedControl.bottomAnchor.constraint(
            equalTo: container.bottomAnchor,
            constant: -10
        ).isActive = true
    }

    private func buildCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

struct VitaminBadgeDemoConfig {
    var value: Int?
    var variant: VitaminBadgeVariant = .standard
    var size: VitaminBadgeSize = .small
}

struct VitaminBadgeSection: BaseNamedSection {
    var name: String = ""
    var configs: [VitaminBadgeDemoConfig] = []
}
