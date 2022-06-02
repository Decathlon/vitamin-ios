//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class RadiusViewController: UITableViewController {
    convenience init() {
        self.init(style: .grouped)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Radiuses"

        tableView.register(UINib(nibName: "RadiusTableViewCell", bundle: nil), forCellReuseIdentifier: "radius")
    }
}

extension RadiusViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RadiusesModel.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "radius") as? RadiusTableViewCell else {
            let cell = RadiusTableViewCell(style: .default, reuseIdentifier: "radius")
            return cell
        }
        let item = RadiusesModel.items[indexPath.row]
        cell.selectionStyle = .none
        cell.update(for: item.value, radiusName: item.name)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}
