//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

class BaseHeaderedCollectionViewController: UICollectionViewController, UICollectionViewControllerWithHeader {
    var sectionHeaders: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header")

        if let flow = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.headerReferenceSize = CGSize(width: view.frame.width, height: 55)
        }
    }

    override func collectionView(
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

        headerView.backgroundColor = VitaminColor.Core.Background.secondary
        if headerView.subviews.isEmpty {
            headerView.addSubview(
                UILabel(
                    frame: CGRect(
                        x: 15,
                        y: 25,
                        width: (view.frame.width - 15),
                        height: 30)))
        }

        if let headerLabel = headerView.subviews[0] as? UILabel {
            headerLabel.backgroundColor = .clear
            headerLabel.text = self.sectionHeaders[indexPath.section].uppercased()
            headerLabel.font = UIFont.systemFont(ofSize: 13)
            headerLabel.textColor = VitaminColor.Core.Content.tertiary
            headerLabel.textAlignment = .left
        }

        return headerView
    }
}

protocol BaseNamedSection {
    var name: String { get }
}

struct NamedSection: BaseNamedSection {
    let name: String
}

protocol UICollectionViewControllerWithHeader {
    func fillBaseHeaderSections(namedSections: [BaseNamedSection]) -> [String]
}

extension UICollectionViewControllerWithHeader {
    func fillBaseHeaderSections(namedSections: [BaseNamedSection]) -> [String] {
        var localSectionsHeaders: [String] = []
        namedSections.forEach {
            localSectionsHeaders.append($0.name)
        }
        return localSectionsHeaders
    }
}
