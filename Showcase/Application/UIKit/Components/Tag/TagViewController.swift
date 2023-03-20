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
        datasource[0].image = UIImage.Vitamix.giftLine
        datasource[4].image = UIImage.Vitamix.giftLine
        return datasource
    }

    private var datasourceMonoInteractive: [VitaminTagDemoConfig] {
        var datasource = datasourceBase
        for i in 0..<datasource.count {
            datasource[i].interactive = true
        }
        return datasource
    }

    private lazy var datasourceMulti: [[VitaminTagDemoConfig]] = [
        datasourceBase,
        [
            VitaminTagDemoConfig(
                variant: .brandPrimary,
                text: VitaminTagVariant.brandPrimary.name,
                image: UIImage.Vitamix.giftLine
            ),
            VitaminTagDemoConfig(
                variant: .brandAlert,
                text: VitaminTagVariant.brandAlert.name,
                image: UIImage.Vitamix.giftLine
            ),
            VitaminTagDemoConfig(
                variant: .brandAccent,
                text: VitaminTagVariant.brandAccent.name,
                image: UIImage.Vitamix.giftLine
            ),
            VitaminTagDemoConfig(
                variant: .decorativeAmethyst,
                text: VitaminTagVariant.decorativeAmethyst.name,
                image: UIImage.Vitamix.giftLine
            ),
            VitaminTagDemoConfig(
                variant: .decorativeBrick,
                text: VitaminTagVariant.decorativeBrick.name,
                image: UIImage.Vitamix.giftLine
            ),
            VitaminTagDemoConfig(
                variant: .decorativeCobalt,
                text: VitaminTagVariant.decorativeCobalt.name,
                image: UIImage.Vitamix.giftLine
            ),
            VitaminTagDemoConfig(
                variant: .decorativeEmerald,
                text: VitaminTagVariant.decorativeEmerald.name,
                image: UIImage.Vitamix.giftLine
            ),
            VitaminTagDemoConfig(
                variant: .decorativeGold,
                text: VitaminTagVariant.decorativeGold.name,
                image: UIImage.Vitamix.giftLine
            ),
            VitaminTagDemoConfig(
                variant: .decorativeGravel,
                text: VitaminTagVariant.decorativeGravel.name,
                image: UIImage.Vitamix.giftLine
            ),
            VitaminTagDemoConfig(
                variant: .decorativeJade,
                text: VitaminTagVariant.decorativeJade.name,
                image: UIImage.Vitamix.giftLine
            ),
            VitaminTagDemoConfig(
                variant: .decorativeSaffron,
                text: VitaminTagVariant.decorativeSaffron.name,
                image: UIImage.Vitamix.giftLine
            )
        ]
    ]
}

extension TagViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return datasourceMono.count
        case 1:
            return datasourceMonoInteractive.count
        default:
            return datasourceMulti.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 || indexPath.section == 1 {
            let config = indexPath.section == 0 ?
                datasourceMono[indexPath.row] :
                datasourceMonoInteractive[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tagCell") as? MonoTagTableViewCell else {
                let cell = MonoTagTableViewCell(style: .default, reuseIdentifier: "tagCell")
                cell.update(
                    variant: config.variant,
                    text: config.text,
                    icon: config.image,
                    interactive: config.interactive,
                    delegate: self
                )
                cell.selectionStyle = .none
                return cell
            }
            cell.update(
                variant: config.variant,
                text: config.text,
                icon: config.image,
                interactive: config.interactive,
                delegate: self
            )
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
        guard indexPath.section > 1   else {
            return 150
        }
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section > 1   else {
            return 150
        }
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Mono Tag usage"
        case 1:
            return "Mono Interactive Tag usage"
        default:
            return "Multi Tag usage"
        }
    }
}

extension TagViewController: VitaminTagInteractiveDelegate {
    func vitaminTagWasClicked(_ vitaminTag: VitaminTag) {
        let alert = UIAlertController(
            title: "Interactive tag triggering",
            message: "you clicked on the \(vitaminTag.variant.name) interactive tag",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: false)
    }
}

struct VitaminTagDemoConfig {
    var variant: VitaminTagVariant = .brandPrimary
    var text = "Tag"
    var image: UIImage?
    var interactive = false
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
