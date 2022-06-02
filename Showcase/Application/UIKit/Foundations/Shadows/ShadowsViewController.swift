//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class ShadowsViewController: UITableViewController {
    convenience init() {
        self.init(style: .grouped)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Shadows"

        tableView.register(UINib(nibName: "ShadowTableViewCell", bundle: nil), forCellReuseIdentifier: "shadow")
    }
}

extension ShadowsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ShadowsModel.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shadow") as? ShadowTableViewCell else {
                    let cell = ShadowTableViewCell(style: .default, reuseIdentifier: "shadow")
                    return cell
                }
        let item = ShadowsModel.items[indexPath.row]
        cell.selectionStyle = .none
        cell.update(for: item.value, shadowName: item.name)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
}
