//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

final class MainTableViewController: UITableViewController {
    private lazy var sections: [MenuSection] = makeSections()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Vitamin Showcase"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = sections[indexPath.section].items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].name
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = sections[indexPath.section].items[indexPath.row]
        navigationController?.pushViewController(item.makeViewController(), animated: true)
    }
}

extension MainTableViewController {
    private struct MenuSection {
        let name: String
        let items: [MenuItem]
    }

    private struct MenuItem {
        let name: String
        let makeViewController: () -> UIViewController

        init(name: String, viewController: @autoclosure @escaping () -> UIViewController) {
            self.name = name
            self.makeViewController = viewController
        }
    }

    private func makeSections() -> [MenuSection] {
        [
            MenuSection(name: "🌳 Foundations", items: [
                MenuItem(name: "🎇 Assets", viewController: AssetsViewController()),
                MenuItem(name: "🎨 Colors", viewController: ColorsViewController()),
                MenuItem(name: "🖼 Icons", viewController: IconsViewController()),
                MenuItem(name: "🌘 Shadows", viewController: ShadowsViewController()),
                MenuItem(name: "🖋 Typography", viewController: TypographyViewController())
            ]),
            MenuSection(name: "🧩 Components", items: [
                MenuItem(name: "🕹 Button", viewController: ButtonsViewController()),
                MenuItem(name: "🎚 Switch", viewController: SwitchViewController()),
                MenuItem(name: "💬 TextField", viewController: TextFieldViewController())
            ])
        ]
    }
}
