//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class ColorsViewController: UITableViewController {
    private lazy var sections: [ColorSection] = makeSections()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Colors"
        tableView.register(UINib(nibName: "ColorTableViewCell", bundle: nil), forCellReuseIdentifier: "color")
    }
}

extension ColorsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "color") as? ColorTableViewCell else {
                    let cell = ColorTableViewCell(style: .default, reuseIdentifier: "color")
                    return cell
                }
        let item = sections[indexPath.section].items[indexPath.row]
        cell.setColor(item.name, color: item.color)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        76
    }
}

extension ColorsViewController {
    private struct ColorSection {
        let name: String
        let items: [ColorItem]
    }

    private struct ColorItem {
        let name: String
        let color: UIColor
    }

    private func makeSections() -> [ColorSection] {
        [
            ColorSection(name: "Background", items: makeBackgroundColorItems()),
            ColorSection(name: "Content", items: makeContentColorItems()),
            ColorSection(name: "Border", items: makeBorderColorItems()),
            ColorSection(name: "Hover", items: makeHoverColorItems()),
            ColorSection(name: "Active", items: makeActiveColorItems()),
            ColorSection(name: "Decorative", items: makeDecorativeColorItems()),
            ColorSection(name: "Shadow", items: makeShadowColorItems())
        ]
    }

    private func makeBackgroundColorItems() -> [ColorItem] {
        [
            ColorItem(name: "Primary",
                      color: VitaminColor.Core.Background.primary),
            ColorItem(name: "Secondary",
                      color: VitaminColor.Core.Background.secondary),
            ColorItem(name: "Tertiary",
                      color: VitaminColor.Core.Background.tertiary),
            ColorItem(name: "BrandPrimary",
                      color: VitaminColor.Core.Background.brandPrimary),
            ColorItem(name: "BrandSecondary",
                      color: VitaminColor.Core.Background.brandSecondary),
            ColorItem(name: "Accent",
                      color: VitaminColor.Core.Background.accent),
            ColorItem(name: "Alert",
                      color: VitaminColor.Core.Background.alert),
            ColorItem(name: "PrimaryReversed",
                      color: VitaminColor.Core.Background.primaryReversed),
            ColorItem(name: "BrandPrimaryReversed",
                      color: VitaminColor.Core.Background.brandPrimaryReversed)
        ]
    }

    private func makeContentColorItems() -> [ColorItem] {
        [
            ColorItem(name: "Primary",
                      color: VitaminColor.Core.Content.primary),
            ColorItem(name: "Secondary",
                      color: VitaminColor.Core.Content.secondary),
            ColorItem(name: "Tertiary",
                      color: VitaminColor.Core.Content.tertiary),
            ColorItem(name: "Action",
                      color: VitaminColor.Core.Content.action),
            ColorItem(name: "Active",
                      color: VitaminColor.Core.Content.active),
            ColorItem(name: "Inactive",
                      color: VitaminColor.Core.Content.inactive),
            ColorItem(name: "Negative",
                      color: VitaminColor.Core.Content.negative),
            ColorItem(name: "Warning",
                      color: VitaminColor.Core.Content.warning),
            ColorItem(name: "Positive",
                      color: VitaminColor.Core.Content.positive),
            ColorItem(name: "Information",
                      color: VitaminColor.Core.Content.information),
            ColorItem(name: "PrimaryReversed",
                      color: VitaminColor.Core.Content.primaryReversed),
            ColorItem(name: "ActionReversed",
                      color: VitaminColor.Core.Content.actionReversed)
        ]
    }

    private func makeBorderColorItems() -> [ColorItem] {
        [
            ColorItem(name: "Primary",
                      color: VitaminColor.Core.Border.primary),
            ColorItem(name: "Secondary",
                      color: VitaminColor.Core.Border.secondary),
            ColorItem(name: "Active",
                      color: VitaminColor.Core.Border.active),
            ColorItem(name: "Inactive",
                      color: VitaminColor.Core.Border.inactive),
            ColorItem(name: "Negative",
                      color: VitaminColor.Core.Border.negative),
            ColorItem(name: "Warning",
                      color: VitaminColor.Core.Border.warning),
            ColorItem(name: "Positive",
                      color: VitaminColor.Core.Border.positive),
            ColorItem(name: "Information",
                      color: VitaminColor.Core.Border.information),
            ColorItem(name: "PrimaryReversed",
                      color: VitaminColor.Core.Border.primaryReversed)
        ]
    }

    private func makeHoverColorItems() -> [ColorItem] {
        [
            ColorItem(name: "Primary",
                      color: VitaminColor.Core.Hover.primary),
            ColorItem(name: "PrimaryTransparent",
                      color: VitaminColor.Core.Hover.primaryTransparent),
            ColorItem(name: "SecondaryTransparent",
                      color: VitaminColor.Core.Hover.secondaryTransparent),
            ColorItem(name: "TertiaryTransparent",
                      color: VitaminColor.Core.Hover.tertiaryTransparent),
            ColorItem(name: "Tertiary",
                      color: VitaminColor.Core.Hover.tertiary),
            ColorItem(name: "Brand",
                      color: VitaminColor.Core.Hover.brand),
            ColorItem(name: "Accent",
                      color: VitaminColor.Core.Hover.accent),
            ColorItem(name: "PrimaryReversedTransparent",
                      color: VitaminColor.Core.Hover.primaryReversedTransparent),
            ColorItem(name: "SecondaryReversedTransparent",
                      color: VitaminColor.Core.Hover.secondaryReversedTransparent),
            ColorItem(name: "TertiaryReversedTransparent",
                      color: VitaminColor.Core.Hover.tertiaryReversedTransparent)
        ]
    }

    private func makeActiveColorItems() -> [ColorItem] {
        [
            ColorItem(name: "Primary",
                      color: VitaminColor.Core.Active.primary),
            ColorItem(name: "PrimaryTransparent",
                      color: VitaminColor.Core.Active.primaryTransparent),
            ColorItem(name: "SecondaryTransparent",
                      color: VitaminColor.Core.Active.secondaryTransparent),
            ColorItem(name: "Tertiary",
                      color: VitaminColor.Core.Active.tertiary),
            ColorItem(name: "TertiaryTransparent",
                      color: VitaminColor.Core.Active.tertiaryTransparent),
            ColorItem(name: "Brand",
                      color: VitaminColor.Core.Active.brand),
            ColorItem(name: "Accent",
                      color: VitaminColor.Core.Active.accent),
            ColorItem(name: "PrimaryReversedTransparent",
                      color: VitaminColor.Core.Active.primaryReversedTransparent),
            ColorItem(name: "SecondaryReversedTransparent",
                      color: VitaminColor.Core.Active.secondaryReversedTransparent),
            ColorItem(name: "TertiaryReversedTransparent",
                      color: VitaminColor.Core.Active.tertiaryReversedTransparent),
            ColorItem(name: "BrandReversedTransparent",
                      color: VitaminColor.Core.Active.brandReversedTransparent)
        ]
    }

    private func makeDecorativeColorItems() -> [ColorItem] {
        [
            ColorItem(name: "DecorativeGravel",
                      color: VitaminColor.Core.Decorative.gravel),
            ColorItem(name: "DecorativeBrick",
                      color: VitaminColor.Core.Decorative.brick),
            ColorItem(name: "DecorativeSaffron",
                      color: VitaminColor.Core.Decorative.saffron),
            ColorItem(name: "DecorativeGold",
                      color: VitaminColor.Core.Decorative.gold),
            ColorItem(name: "DecorativeJade",
                      color: VitaminColor.Core.Decorative.jade),
            ColorItem(name: "DecorativeEmerald",
                      color: VitaminColor.Core.Decorative.emerald),
            ColorItem(name: "DecorativeCobalt",
                      color: VitaminColor.Core.Decorative.cobalt),
            ColorItem(name: "DecorativeAmethyst",
                      color: VitaminColor.Core.Decorative.amethyst)
        ]
    }

    private func makeShadowColorItems() -> [ColorItem] {
        [
            ColorItem(name: "ShadowShadow",
                      color: VitaminColor.Core.Shadow.shadow)
        ]
    }
}
