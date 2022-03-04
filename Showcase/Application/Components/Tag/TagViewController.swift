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

    private let datasourceMono: [VitaminTagDemoConfig] = [
        VitaminTagDemoConfig(
            variant: .brandPrimary,
            text: "Brand primary",
            image: Vitamix.Line.Finance.gift.image),
        VitaminTagDemoConfig(variant: .brandAlert, text: "Brand alert"),
        VitaminTagDemoConfig(variant: .brandAccent, text: "Brand Accent"),
        VitaminTagDemoConfig(variant: .decorativeAmethyst, text: "Amethyst"),
        VitaminTagDemoConfig(
            variant: .decorativeBrick,
            text: "Brick",
            image: Vitamix.Line.Finance.gift.image),
        VitaminTagDemoConfig(variant: .decorativeCobalt, text: "Cobalt"),
        VitaminTagDemoConfig(variant: .decorativeEmerald, text: "Emerald"),
        VitaminTagDemoConfig(variant: .decorativeGold, text: "Gold"),
        VitaminTagDemoConfig(variant: .decorativeGravel, text: "Gravel"),
        VitaminTagDemoConfig(variant: .decorativeJade, text: "Jade"),
        VitaminTagDemoConfig(variant: .decorativeSaffron, text: "Saffron")
    ]

    private let datasourceMulti: [[VitaminTagDemoConfig]] = [
        [
            VitaminTagDemoConfig(variant: .brandPrimary, text: "Brand primary"),
            VitaminTagDemoConfig(variant: .brandAlert, text: "Brand alert"),
            VitaminTagDemoConfig(variant: .brandAccent, text: "Brand Accent"),
            VitaminTagDemoConfig(variant: .decorativeAmethyst, text: "Amethyst"),
            VitaminTagDemoConfig(variant: .decorativeBrick, text: "Brick"),
            VitaminTagDemoConfig(variant: .decorativeCobalt, text: "Cobalt"),
            VitaminTagDemoConfig(variant: .decorativeEmerald, text: "Emerald"),
            VitaminTagDemoConfig(variant: .decorativeGold, text: "Gold"),
            VitaminTagDemoConfig(variant: .decorativeGravel, text: "Gravel"),
            VitaminTagDemoConfig(variant: .decorativeJade, text: "Jade"),
            VitaminTagDemoConfig(variant: .decorativeSaffron, text: "Saffron")
        ],
        [
            VitaminTagDemoConfig(
                variant: .brandPrimary,
                text: "Brand primary",
                image: Vitamix.Line.Finance.gift.image),
            VitaminTagDemoConfig(
                variant: .brandAlert,
                text: "Brand alert",
                image: Vitamix.Line.Finance.gift.image),
            VitaminTagDemoConfig(
                variant: .brandAccent,
                text: "Brand Accent",
                image: Vitamix.Line.Finance.gift.image),
            VitaminTagDemoConfig(
                variant: .decorativeAmethyst,
                text: "Amethyst",
                image: Vitamix.Line.Finance.gift.image),
            VitaminTagDemoConfig(
                variant: .decorativeBrick,
                text: "Brick",
                image: Vitamix.Line.Finance.gift.image),
            VitaminTagDemoConfig(
                variant: .decorativeCobalt,
                text: "Cobalt",
                image: Vitamix.Line.Finance.gift.image),
            VitaminTagDemoConfig(
                variant: .decorativeEmerald,
                text: "Emerald",
                image: Vitamix.Line.Finance.gift.image),
            VitaminTagDemoConfig(
                variant: .decorativeGold,
                text: "Gold",
                image: Vitamix.Line.Finance.gift.image),
            VitaminTagDemoConfig(
                variant: .decorativeGravel,
                text: "Gravel",
                image: Vitamix.Line.Finance.gift.image),
            VitaminTagDemoConfig(
                variant: .decorativeJade,
                text: "Jade",
                image: Vitamix.Line.Finance.gift.image),
            VitaminTagDemoConfig(
                variant: .decorativeSaffron,
                text: "Saffron",
                image: Vitamix.Line.Finance.gift.image)
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
