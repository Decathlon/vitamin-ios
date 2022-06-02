//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class TypographyViewController: UITableViewController {
    private lazy var items: [TypographyModel.Item] = TypographyModel.items

    convenience init() {
        self.init(style: .grouped)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Typography"

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "typography")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
}

extension TypographyViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "typography") else {
            return UITableViewCell(style: .default, reuseIdentifier: "typography")
        }
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.attributedText = items[indexPath.section].attributedText
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        items[section].name
    }
}

extension TypographyModel.Item {
    var attributedText: NSAttributedString {
        text.styled(as: value)
    }
}
