//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

class BaseImageCollectionViewController: UICollectionViewController {
    var sections: [BaseImageSection] = []

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
            headerLabel.text = self.sections[indexPath.section].name.uppercased()
            headerLabel.font = UIFont.systemFont(ofSize: 13)
            headerLabel.textColor = VitaminColor.Core.Content.tertiary
            headerLabel.textAlignment = .left
        }

        return headerView
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        UIPasteboard.general.string = sections[indexPath.section].items[indexPath.row].name
    }
}

protocol BaseImageSection {
    var name: String { get }
    var items: [BaseImageItem] { get }
}

protocol BaseImageItem {
    var name: String { get }
}
