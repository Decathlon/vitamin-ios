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

    var radiuses: [(String, VitaminRadius)] = [
        ("radius100", .radius100),
        ("radius200", .radius200),
        ("radius300", .radius300),
        ("radius400", .radius400),
        ("radius500", .radius500),
        ("radius600", .radius600),
        ("radius700", .radius700),
        ("radius800", .radius800)
    ]
}

extension RadiusViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        radiuses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "radius") as? RadiusTableViewCell else {
                    let cell = RadiusTableViewCell(style: .default, reuseIdentifier: "radius")
                    return cell
                }
        cell.selectionStyle = .none
        cell.update(for: radiuses[indexPath.row].1,
                    radiusName: radiuses[indexPath.row].0)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}
