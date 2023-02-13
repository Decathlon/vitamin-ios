//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

/// Generic view controller that allows to display different view controllers with a tab
public class VitaminTabsController: UIViewController {
    /// List of viewControllers managed by the VitaminTabsController
    public var tabViewControllers: [UIViewController] = [] {
        didSet {
            tabs.removeAllSegments()
            let titles = tabsTitles()
            for (index, title) in titles.enumerated() {
                tabs.setTitle(title, forSegmentAt: index)
            }
        }
    }
    /// Margin between the top of the controller and the `VitaminTabs`
    /// Default value is 10
    public var tabsTopMargin: CGFloat = 10.0 {
        didSet {
            tabsTopMarginConstraint.constant = tabsTopMargin
        }
    }
    /// Margin between the bottom of the `VitaminTabs` and the top of the view dsplaying the sub viewControllers
    /// Default value is 10
    public var tabsBottomMargin: CGFloat = 10.0 {
        didSet {
            tabsBottomMarginConstraint.constant = tabsBottomMargin
        }
    }
    /// Boolean indicting if the `VitaminTabs`should take the full width of the screen
    /// or adapt to segment titles width
    public var fullWidthTabs = false {
        didSet {
            tabsLeftConstraint.isActive = fullWidthTabs
            tabsRightConstraint.isActive = fullWidthTabs
        }
    }

    // View displaying the sub viewControllers
    private lazy var tabView: UIView = {
        let tabView = UIView()
        tabView.translatesAutoresizingMaskIntoConstraints = false
        return tabView
    }()
    // internal VitaminTabs
    private lazy var tabs: VitaminTabs = {
        let tabs = VitaminTabs(items: tabsTitles())
        tabs.selectedSegmentIndex = 0
        tabs.addTarget(self, action: #selector(tabSelected), for: .valueChanged)
        tabs.translatesAutoresizingMaskIntoConstraints = false
        return tabs
    }()

    private var lastDisplayedTabViewControllerIndex: Int?

    private var defaultTabIndex = 0

    // Activable Layout Constraints
    lazy private var tabsTopMarginConstraint: NSLayoutConstraint = {
        if #available(iOS 11.0, *) {
            return tabs.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        }
        return tabs.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 10)
    }()

    lazy private var tabsBottomMarginConstraint: NSLayoutConstraint = {
        tabView.topAnchor.constraint(equalTo: tabs.bottomAnchor, constant: 10)
    }()

    lazy private var tabsLeftConstraint: NSLayoutConstraint = {
        tabs.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
    }()

    lazy private var tabsRightConstraint: NSLayoutConstraint = {
        tabs.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
    }()

    public init(
        _ viewControllers: [UIViewController],
        defaultTabIndex: Int = 0,
        fullWidthTabs: Bool = false,
        tabsTopMargin: CGFloat = 10,
        tabsBottomMargin: CGFloat = 10
    ) {
        super.init(nibName: nil, bundle: nil)
        self.tabViewControllers = viewControllers
        self.defaultTabIndex = defaultTabIndex
        self.fullWidthTabs = fullWidthTabs
        self.tabsTopMargin = tabsTopMargin
        self.tabsBottomMargin = tabsTopMargin
    }

    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = VitaminColor.Core.Background.primary
        setupViews()
        displayTabViewController(defaultTabIndex)
    }

    // Computation of tab titles by extracting sub viewControllers titles
    private func tabsTitles() -> [String] {
        var tabsTitles: [String] = []
        for viewController in self.tabViewControllers {
            if let title = viewController.title {
                tabsTitles.append(title)
            }
        }
        return tabsTitles
    }

    // setup views at loading
    private func setupViews() {
        view.addSubview(tabs)
        view.addSubview(tabView)
        if #available(iOS 11.0, *) {
            tabView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            tabView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
        }
        tabsBottomMarginConstraint.isActive = true
        tabsTopMarginConstraint.isActive = true
        tabs.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        tabView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tabView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        tabsLeftConstraint.isActive = fullWidthTabs
        tabsRightConstraint.isActive = fullWidthTabs
    }

    // Selector called when a tab is selected
    @objc func tabSelected(_ segmentControl: UISegmentedControl) {
        var lastDisplayedIndex: Int?

        if let lastDisplayedTabViewControllerIndex = self.lastDisplayedTabViewControllerIndex {
            lastDisplayedIndex = lastDisplayedTabViewControllerIndex
        }

        displayTabViewController(segmentControl.selectedSegmentIndex)

        if let lastDisplayedIndex = lastDisplayedIndex {
            hideTabViewController(lastDisplayedIndex)
        }
    }

    // Method that displays selected sub viewcontroller
    private func displayTabViewController(_ tabViewControllerIndex: Int) {
        let viewController = self.tabViewControllers[tabViewControllerIndex]
        tabs.selectedSegmentIndex = tabViewControllerIndex

        self.addChild(viewController)

        self.view.addSubview(viewController.view)

        viewController.view.translatesAutoresizingMaskIntoConstraints = false

        viewController.view.leftAnchor.constraint(equalTo: tabView.leftAnchor).isActive = true
        viewController.view.topAnchor.constraint(equalTo: tabView.topAnchor).isActive = true
        viewController.view.rightAnchor.constraint(equalTo: tabView.rightAnchor).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: tabView.bottomAnchor).isActive = true

        viewController.didMove(toParent: self)

        self.lastDisplayedTabViewControllerIndex = tabs.selectedSegmentIndex
    }

    // Method that hides previously selected sub viewcontroller
    private func hideTabViewController(_ tabViewControllerIndex: Int) {
        let viewController = self.tabViewControllers[tabViewControllerIndex]

        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
