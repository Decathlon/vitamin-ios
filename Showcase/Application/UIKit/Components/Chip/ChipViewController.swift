//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class ChipViewController: UITableViewController {
    convenience init() {
        self.init(style: .grouped)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Chip"
        tableView.register(
            UINib(
                nibName: "ChipTableViewCell",
                bundle: nil),
            forCellReuseIdentifier: "chipCell")
    }

    private static let sectionTitles = ["Filter", "Input", "Single Choice", "Action"]

    private lazy var datasource: [String: [VitaminChipDemoConfig]] = {
        var datasource: [String: [VitaminChipDemoConfig]] = [:]
        var filterChips = ChipViewController.buildFilterChipsModel()
        filterChips.append(contentsOf: ChipViewController.buildFilterChipsModel(enabled: false))

        var inputChips = ChipViewController.buildInputChipsModel()
        inputChips.append(contentsOf: ChipViewController.buildInputChipsModel(enabled: false))

        var singleChoiceChips = ChipViewController.buildSingleChoiceChipsModel()
        singleChoiceChips.append(contentsOf: ChipViewController.buildSingleChoiceChipsModel(enabled: false))

        var actionChips = ChipViewController.buildActionChipsModel()
        actionChips.append(contentsOf: ChipViewController.buildActionChipsModel(enabled: false))

        datasource[ChipViewController.sectionTitles[0]] = filterChips
        datasource[ChipViewController.sectionTitles[1]] = inputChips
        datasource[ChipViewController.sectionTitles[2]] = singleChoiceChips
        datasource[ChipViewController.sectionTitles[3]] = actionChips

        return datasource
    }()
}

extension ChipViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        datasource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = datasource[Self.sectionTitles[section]] else {
            return 0
        }
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = datasource[ChipViewController.sectionTitles[indexPath.section]] else {
            return ChipTableViewCell(style: .default, reuseIdentifier: "chipCell")
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "chipCell") as? ChipTableViewCell else {
            let cell = ChipTableViewCell(style: .default, reuseIdentifier: "chipCell")
            cell.update(config: data[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        let config = data[indexPath.row]
        cell.update(config: config)
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        ChipViewController.sectionTitles[section]
    }
}

struct VitaminChipDemoConfig {
    var text: String
    var variant: VitaminChipVariant
    var enabled: Bool
}

extension ChipViewController {
    private static func buildFilterChipsModel(enabled: Bool = true) -> [VitaminChipDemoConfig] {
        var chips: [VitaminChipDemoConfig] = []

        chips.append(
            VitaminChipDemoConfig(text: "filter1", variant: .filter(state: .selected, badge: nil), enabled: enabled)
        )
        chips.append(
            VitaminChipDemoConfig(text: "filter2", variant: .filter(state: .unselected, badge: nil), enabled: enabled)
        )
        chips.append(
            VitaminChipDemoConfig(text: "filter3", variant: .filter(state: .selected, badge: 59), enabled: enabled)
        )
        chips.append(
            VitaminChipDemoConfig(text: "filter4", variant: .filter(state: .unselected, badge: 59), enabled: enabled)
        )
        return chips
    }

    private static func buildInputChipsModel(enabled: Bool = true) -> [VitaminChipDemoConfig] {
        var chips: [VitaminChipDemoConfig] = []
        chips.append(
            VitaminChipDemoConfig(
                text: "input1",
                variant: .input(),
                enabled: enabled)
        )
        chips.append(
            VitaminChipDemoConfig(
                text: "input1",
                variant: .input(image: VitaminAssets.Placeholder.landscape.image),
                enabled: enabled)
        )
        chips.append(
            VitaminChipDemoConfig(
                text: "input2",
                variant: .input(icon: Vitamix.Line.Map.mapPin.image),
                enabled: enabled)
        )

        return chips
    }

    private static func buildSingleChoiceChipsModel(enabled: Bool = true) -> [VitaminChipDemoConfig] {
        var chips: [VitaminChipDemoConfig] = []
        chips.append(
            VitaminChipDemoConfig(
                text: "single1",
                variant: .singleChoice(state: .selected),
                enabled: enabled)
        )
        chips.append(
            VitaminChipDemoConfig(
                text: "single2",
                variant: .singleChoice(state: .unselected),
                enabled: enabled)
        )

        return chips
    }

    private static func buildActionChipsModel(enabled: Bool = true) -> [VitaminChipDemoConfig] {
        var chips: [VitaminChipDemoConfig] = []
        chips.append(
            VitaminChipDemoConfig(
                text: "action1",
                variant: .action(icon: Vitamix.Line.System.settings.image),
                enabled: enabled)
        )

        return chips
    }
}
