//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class ButtonsViewController: UITableViewController {
    private var showEnabledState = true

    convenience init() {
        self.init(style: .plain)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Button"
        tableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "button")
    }

    var styles: [VitaminButton.Style] = [
        .primary,
        .primaryReversed,
        .secondary,
        .tertiary,
        .conversion,
        .ghost,
        .ghostReversed
    ]
}

extension ButtonsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        styles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "button") as? ButtonTableViewCell else {
                    let cell = ButtonTableViewCell(style: .default, reuseIdentifier: "button")
                    return cell
                }
        cell.selectionStyle = .none
        cell.update(for: styles[indexPath.row], isEnabled: showEnabledState)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        52
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        makeSwitchButtonStateView()
    }
}

extension ButtonsViewController {
    private func makeSwitchButtonStateView() -> UIView {
        let contentView = UIView()
        contentView.backgroundColor = VitaminColor.Core.Background.secondary

        let textLabel = UILabel()
        textLabel.text = "Show enabled state"
        contentView.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true

        let stateSwitch = UISwitch()
        stateSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        stateSwitch.isOn = showEnabledState
        contentView.addSubview(stateSwitch)
        stateSwitch.translatesAutoresizingMaskIntoConstraints = false
        stateSwitch.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 16).isActive = true
        stateSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        stateSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true

        return contentView
    }

    @objc private func switchValueChanged(_ sender: UISwitch) {
        showEnabledState = sender.isOn
        tableView.reloadData()
    }
}
