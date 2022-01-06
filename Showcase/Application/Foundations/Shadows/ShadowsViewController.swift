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

        navigationItem.title = "Button"
        tableView.register(UINib(nibName: "ShadowTableViewCell", bundle: nil), forCellReuseIdentifier: "shadow")
    }

    var shadows: [VitaminShadowType] = [
        .shadow100,
        .shadow200,
        .shadow300,
        .shadow400
    ]
}

extension ShadowsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shadows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shadow") as? ShadowTableViewCell else {
                    let cell = ShadowTableViewCell(style: .default, reuseIdentifier: "shadow")
                    return cell
                }
        cell.selectionStyle = .none
        cell.update(for: shadows[indexPath.row])
        return cell
    }
}
