//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class ColorsViewController: UITableViewController {
    private lazy var sections: [ColorsModel.Section] = ColorsModel.sections

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
