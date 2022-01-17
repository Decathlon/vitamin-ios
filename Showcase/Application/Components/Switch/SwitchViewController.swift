//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

final class SwitchViewController: UITableViewController {
    convenience init() {
        self.init(style: .grouped)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Switch"
        tableView.register(UINib(nibName: "SwitchTableViewCell", bundle: nil), forCellReuseIdentifier: "switchCell")
    }

    private let datasource: [VitaminSwitchDemoConfig] = [
        VitaminSwitchDemoConfig(),
        VitaminSwitchDemoConfig(isOn: false),
        VitaminSwitchDemoConfig(enabled: false),
        VitaminSwitchDemoConfig(enabled: false, isOn: false)
    ]
}

extension SwitchViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datasource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let config = datasource[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell") as? SwitchTableViewCell else {
            let cell = SwitchTableViewCell(style: .default, reuseIdentifier: "switchCell")
            cell.update(enabled: config.enabled, isOn: config.isOn)
            cell.selectionStyle = .none
            return cell
        }
        cell.update(enabled: config.enabled, isOn: config.isOn)
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
}

private struct VitaminSwitchDemoConfig {
    var enabled = true
    var isOn = true
}
