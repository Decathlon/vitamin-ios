//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class TypographyViewController: UITableViewController {
    private lazy var items: [TypographyItem] = makeItems()

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

extension TypographyViewController {
    private struct TypographyItem {
        let name: String
        let attributedText: NSAttributedString

        init(name: String, style: VitaminTextStyle) {
            self.name = name
            var text = "Sphinx of black quartz, judge my vow."
            if style == .display ||
                style == .largeTitle1 ||
                style == .largeTitle2 {
                text = text.uppercased()
            }
            self.attributedText = text.styled(as: style)
        }
    }

    private func makeItems() -> [TypographyItem] {
        [
            TypographyItem(name: "Display",
                           style: .display),
            TypographyItem(name: "Large Title 1",
                           style: .largeTitle1),
            TypographyItem(name: "Large Title 2",
                           style: .largeTitle2),
            TypographyItem(name: "Title 1",
                           style: .title1),
            TypographyItem(name: "Title 2",
                           style: .title2),
            TypographyItem(name: "Title 3",
                           style: .title3),
            TypographyItem(name: "Headline",
                           style: .headline),
            TypographyItem(name: "Body",
                           style: .body),
            TypographyItem(name: "Callout",
                           style: .callout),
            TypographyItem(name: "Subhead",
                           style: .subhead),
            TypographyItem(name: "Footnote",
                           style: .footnote),
            TypographyItem(name: "Caption 1",
                           style: .caption1),
            TypographyItem(name: "Caption 2",
                           style: .caption2),
            TypographyItem(name: "Button",
                           style: .button)
        ]
    }
}
