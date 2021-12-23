//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class ButtonsViewController: UITableViewController {
    convenience init() {
        self.init(style: .grouped)
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
        cell.update(for: styles[indexPath.row])
        return cell
    }
}
