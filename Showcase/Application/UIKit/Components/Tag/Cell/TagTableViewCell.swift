//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

class MonoTagTableViewCell: UITableViewCell {
    @IBOutlet weak var vitaminTag: VitaminTag!
    @IBOutlet weak var fakeView: UIView!
    @IBOutlet weak var fakeLabel: UILabel!

    func update(
        variant: VitaminTagVariant = .brandPrimary,
        text: String = "Tag",
        icon: UIImage? = nil,
        interactive: Bool = false,
        delegate: VitaminTagInteractiveDelegate? = nil
    ) {
        fakeView.backgroundColor = VitaminColor.Core.Background.brandSecondary
        fakeLabel.attributedText = "This is a \(text) tag \(icon != nil ? "with an" : "without") icon"
            .styled(as: .callout)
        vitaminTag.label = text
        vitaminTag.variant = variant
        vitaminTag.icon = icon
        vitaminTag.interactive = interactive
        vitaminTag.interactiveDelegate = delegate
    }
}

class MultipleTagTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: LeftAlignedCollectionViewFlowLayout! {
        didSet {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 10.0
            flowLayout.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        }
    }
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!

    private var tagDatasource: [VitaminTagDemoConfig] = []

    private static let cellIdentifier = "Cell"

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(
            UINib(nibName: "TagCollectionViewCell", bundle: .main),
            forCellWithReuseIdentifier: Self.cellIdentifier
        )
        collectionView.isScrollEnabled = false
    }

    func update(tagConfigs: [VitaminTagDemoConfig]) {
        tagDatasource = tagConfigs

        collectionView.dataSource = self
        // layoutIfNeeded()
        collectionView.reloadData()
        collectionViewHeightConstraint.constant =
            collectionView.collectionViewLayout.collectionViewContentSize.height
    }
}

extension MultipleTagTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tagDatasource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Self.cellIdentifier,
            for: indexPath
        ) as? TagCollectionViewCell else {
            fatalError("unable to cast collection view cell")
        }

        guard indexPath.row < tagDatasource.count else {
            return cell
        }
        cell.update(config: tagDatasource[indexPath.row])

        return cell
    }
}

/// Subclass of UICollectionViewFlowLayout that aligns the cells on the left side
class  LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    let cellSpacing: CGFloat = 10

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin
            leftMargin += layoutAttribute.frame.width + cellSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
        return attributes
    }
}
