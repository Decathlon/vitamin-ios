//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

public final class TabsViewController: UIViewController {
    lazy var scrollView = UIScrollView()

    lazy var fixedWithLabel = initLabel(text: "Fixed Width")
    lazy var twoTabs = initTabs(items: ["One", "Two"])
    lazy var threeTabs = initTabs(items: ["One", "Two", "Three"])
    lazy var fourTabs = initTabs(items: ["One", "Two", "Three", "Four"])

    lazy var compactWidthLabel = initLabel(text: "Automatic Width")
    lazy var compacTwoTabs = initTabs(items: ["One", "Two"])
    lazy var compactThreeTabs = initTabs(items: ["One", "Two", "Three"])
    lazy var compactFourTabs = initTabs(items: ["One", "Two", "Three", "Four"])

    private static let verticalPadding = 20.0
    private static let horizontalPadding = 10.0

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        self.view.backgroundColor = VitaminColor.Core.Background.primary
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = false

        self.navigationItem.title = "Tabs"

        buildBlockOfTabs(
            label: fixedWithLabel,
            tabs: [twoTabs, threeTabs, fourTabs],
            topAnchor: scrollView.topAnchor
        )

        buildBlockOfTabs(
            label: compactWidthLabel,
            tabs: [compacTwoTabs, compactThreeTabs, compactFourTabs],
            topAnchor: fourTabs.bottomAnchor,
            topMargin: 40.0,
            fullWidth: false
        )
    }

    private func buildBlockOfTabs(
        label: UILabel,
        tabs: [VitaminTabs],
        topAnchor: NSLayoutYAxisAnchor,
        topMargin: CGFloat = 10.0,
        fullWidth: Bool = true
    ) {
        scrollView.addSubview(label)
        label.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: Self.horizontalPadding
        ).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: topMargin).isActive = true

        for (index, tab) in tabs.enumerated() {
            scrollView.addSubview(tab)
            tab.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            if fullWidth {
                tab.widthAnchor.constraint(
                    equalTo: view.widthAnchor,
                    constant: -2 * Self.horizontalPadding
                ).isActive = true
            }
            if index == 0 {
                tab.topAnchor.constraint(
                    equalTo: label.bottomAnchor,
                    constant: Self.verticalPadding
                ).isActive = true
            } else {
                tab.topAnchor.constraint(
                    equalTo: tabs[index - 1].bottomAnchor,
                    constant: Self.verticalPadding
                ).isActive = true
            }
        }
    }

    private func initTabs(items: [Any]) -> VitaminTabs {
        let tabs = VitaminTabs(items: items)
        tabs.selectedSegmentIndex = 0
        tabs.translatesAutoresizingMaskIntoConstraints = false
        return tabs
    }

    private func initLabel(text: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.attributedText = text.styled(as: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
