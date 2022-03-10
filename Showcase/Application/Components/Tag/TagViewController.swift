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

        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = 150
    }


    private let datasourceBase: [VitaminTagDemoConfig] = [
        VitaminTagDemoConfig(
            variant: .brandPrimary,
            text: VitaminTagVariant.brandPrimary.name
        ),
        VitaminTagDemoConfig(
            variant: .brandAlert,
            text: VitaminTagVariant.brandAlert.name
        ),
        VitaminTagDemoConfig(
            variant: .brandAccent,
            text: VitaminTagVariant.brandAccent.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeAmethyst,
            text: VitaminTagVariant.decorativeAmethyst.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeBrick,
            text: VitaminTagVariant.decorativeBrick.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeCobalt,
            text: VitaminTagVariant.decorativeCobalt.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeEmerald,
            text: VitaminTagVariant.decorativeEmerald.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeGold,
            text: VitaminTagVariant.decorativeGold.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeGravel,
            text: VitaminTagVariant.decorativeGravel.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeJade,
            text: VitaminTagVariant.decorativeJade.name
        ),
        VitaminTagDemoConfig(
            variant: .decorativeSaffron,
            text: VitaminTagVariant.decorativeSaffron.name
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
                text: VitaminTagVariant.brandPrimary.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .brandAlert,
                text: VitaminTagVariant.brandAlert.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .brandAccent,
                text: VitaminTagVariant.brandAccent.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeAmethyst,
                text: VitaminTagVariant.decorativeAmethyst.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeBrick,
                text: VitaminTagVariant.decorativeBrick.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeCobalt,
                text: VitaminTagVariant.decorativeCobalt.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeEmerald,
                text: VitaminTagVariant.decorativeEmerald.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeGold,
                text: VitaminTagVariant.decorativeGold.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeGravel,
                text: VitaminTagVariant.decorativeGravel.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeJade,
                text: VitaminTagVariant.decorativeJade.name,
                image: Vitamix.Line.Finance.gift.image
            ),
            VitaminTagDemoConfig(
                variant: .decorativeSaffron,
                text: VitaminTagVariant.decorativeSaffron.name,
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
                cell.update(tagConfigs: config)
                cell.selectionStyle = .none
                return cell
            }
            cell.update(tagConfigs: config)
            cell.selectionStyle = .none
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section == 0  else {
            return UITableView.automaticDimension
        }
        return 150
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section == 0  else {
            return UITableView.automaticDimension
        }
        return 150
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Mono Tag usage"
        }
        return "Multiple Tag Usage"
    }
}

struct VitaminTagDemoConfig {
    var variant: VitaminTagVariant = .brandPrimary
    var text = "Tag"
    var image: UIImage?
}

private extension VitaminTagVariant {
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
