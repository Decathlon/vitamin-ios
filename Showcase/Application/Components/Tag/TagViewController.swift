//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class TagViewController: UITableViewController {
    convenience init() {
        self.init(style: .grouped)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Tag"
        tableView.register(
            UINib(
                nibName: "MonoTagTableViewCell",
                bundle: nil),
            forCellReuseIdentifier: "tagCell")
        tableView.register(
            UINib(
                nibName: "MultipleTagTableViewCell",
                bundle: nil),
            forCellReuseIdentifier: "multiTagCell")
    }


    private let datasourceBase: [VitaminTagDemoConfig] = [
        VitaminTagDemoConfig(
            variant: .brandPrimary,
            text: VitaminTag.Variant.brandPrimary.name
        ),
        VitaminTagDemoConfig(
            variant: .brandAlert,
            text: VitaminTag.Variant.brandAlert.name
        ),
        VitaminTagDemoConfig(
            variant: .brandAccent,
            text: VitaminTag.Variant.brandAccent.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeAmethyst,
            text: VitaminTag.Variant.decorativeAmethyst.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeBrick,
            text: VitaminTag.Variant.decorativeBrick.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeCobalt,
            text: VitaminTag.Variant.decorativeCobalt.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeEmerald,
            text: VitaminTag.Variant.decorativeEmerald.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeGold,
            text: VitaminTag.Variant.decorativeGold.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeGravel,
            text: VitaminTag.Variant.decorativeGravel.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeJade,
            text: VitaminTag.Variant.decorativeJade.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeSaffron,
            text: VitaminTag.Variant.decorativeSaffron.name
        )
    ]

    private var datasourceMono: [VitaminTagDemoConfig] {
        var datasource = datasourceBase
        datasource[0].image = Vitamix.Line.Finance.gift.image
        datasource[4].image = Vitamix.Line.Finance.gift.image
        return datasource
    }

    private lazy var datasourceMulti: [[VitaminTagDemoConfig]] = [
        datasourceBase,
        [
            VitaminTagDemoConfig(
                variant: .brandPrimary,
                text: VitaminTag.Variant.brandPrimary.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .brandAlert,
                text: VitaminTag.Variant.brandAlert.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .brandAccent,
                text: VitaminTag.Variant.brandAccent.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeAmethyst,
                text: VitaminTag.Variant.decorativeAmethyst.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeBrick,
                text: VitaminTag.Variant.decorativeBrick.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeCobalt,
                text: VitaminTag.Variant.decorativeCobalt.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeEmerald,
                text: VitaminTag.Variant.decorativeEmerald.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeGold,
                text: VitaminTag.Variant.decorativeGold.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeGravel,
                text: VitaminTag.Variant.decorativeGravel.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeJade,
                text: VitaminTag.Variant.decorativeJade.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeSaffron,
                text: VitaminTag.Variant.decorativeSaffron.name,
                image: Vitamix.Line.Finance.gift.image
            )
        ]
    ]
}

extension TagViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return datasourceMono.count
        } else {
            return datasourceMulti.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let config = datasourceMono[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tagCell") as? MonoTagTableViewCell else {
                let cell = MonoTagTableViewCell(style: .default, reuseIdentifier: "tagCell")
                cell.update(variant: config.variant, text: config.text, icon: config.image)
                cell.selectionStyle = .none
                return cell
            }
            cell.update(variant: config.variant, text: config.text, icon: config.image)
            cell.selectionStyle = .none
            return cell
        } else {
            let config = datasourceMulti[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "multiTagCell"
            ) as? MultipleTagTableViewCell else {
                let cell = MultipleTagTableViewCell(style: .default, reuseIdentifier: "multiTagCell")
                cell.update(arrayOfTagConfig: config)
                cell.selectionStyle = .none
                return cell
            }
            cell.update(arrayOfTagConfig: config)
            cell.selectionStyle = .none
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }
        return 190
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Mono Tag usage"
        }
        return "Multiple Tag Usage"
    }
}

struct VitaminTagDemoConfig {
    var variant: VitaminTag.Variant = .brandPrimary
    var text = "Tag"
    var image: UIImage?
}

private extension VitaminTag.Variant {
    var name: String {
        switch self {
        case .brandPrimary:
            return "Brand primary"
        case .brandAccent:
            return "Brand accent"
        case .brandAlert:
            return "Brand alert"
        case .decorativeAmethyst:
            return "Amethyst"
        case .decorativeBrick:
            return "Brick"
        case .decorativeCobalt:
            return "Cobalt"
        case .decorativeEmerald:
            return "Emerald"
        case .decorativeGravel:
            return "Gravel"
        case .decorativeGold:
            return "Gold"
        case .decorativeJade:
            return "Jade"
        case .decorativeSaffron:
            return "Saffron"
        }
    }
}
