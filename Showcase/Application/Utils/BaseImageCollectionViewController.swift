//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

class BaseImageCollectionViewController: BaseHeaderedCollectionViewController {
    var sections: [BaseImageSection] = [] {
        didSet {
            sectionHeaders = fillBaseHeaderSections(namedSections: sections)
        }
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        UIPasteboard.general.string = sections[indexPath.section].items[indexPath.row].name
    }
}

protocol BaseImageSection: BaseNamedSection {
    var items: [BaseImageItem] { get }
}

protocol BaseImageItem {
    var name: String { get }
}
