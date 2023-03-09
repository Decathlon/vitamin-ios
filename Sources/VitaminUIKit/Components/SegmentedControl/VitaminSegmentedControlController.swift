//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

/// Generic view controller that allows to display different view controllers with a `VitaminSegmentedControl` to choose which controller is displayed
public class VitaminSegmentedControlController: UIViewController {
    /// List of viewControllers managed by the VitaminSegmentedControlController
    public var viewControllers: [UIViewController] = [] {
        didSet {
            segmentedControl.removeAllSegments()
            let titles = segmentTitles()
            for (index, title) in titles.enumerated() {
                segmentedControl.setTitle(title, forSegmentAt: index)
            }
        }
    }
    /// Margin between the top of the controller and the `VitaminSegmentedControl`
    /// Default value is 10
    public var segmentedControlTopMargin: CGFloat = 10.0 {
        didSet {
            segmentedControlTopMarginConstraint.constant = segmentedControlTopMargin
        }
    }
    /// Margin between the bottom of the `VitaminSegmentedControl` and the top of the view dsplaying the sub viewControllers
    /// Default value is 10
    public var segmentedControlBottomMargin: CGFloat = 10.0 {
        didSet {
            segmentedControlBottomMarginConstraint.constant = segmentedControlBottomMargin
        }
    }
    /// Boolean indicting if the `VitaminSegmentedControl`should take the full width of the screen
    /// or adapt to segment titles width
    public var fullWidthSegmentedControl = false {
        didSet {
            segmentedControlLeftConstraint.isActive = fullWidthSegmentedControl
            segmentedControlRightConstraint.isActive = fullWidthSegmentedControl
        }
    }

    // View displaying the sub viewControllers
    private lazy var segmentedControlView: UIView = {
        let segmentedControlView = UIView()
        segmentedControlView.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControlView
    }()
    // internal VitaminSegmentedControl
    private lazy var segmentedControl: VitaminSegmentedControl = {
        let segmentedControl = VitaminSegmentedControl(items: segmentTitles())
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentSelected), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    private var lastDisplayedViewControllerIndex: Int?

    private var defaultSegmentIndex = 0

    // Activable Layout Constraints
    lazy private var segmentedControlTopMarginConstraint: NSLayoutConstraint = {
        if #available(iOS 11.0, *) {
            return segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        }
        return segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 10)
    }()

    lazy private var segmentedControlBottomMarginConstraint: NSLayoutConstraint = {
        segmentedControlView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10)
    }()

    lazy private var segmentedControlLeftConstraint: NSLayoutConstraint = {
        segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
    }()

    lazy private var segmentedControlRightConstraint: NSLayoutConstraint = {
        segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
    }()

    public init(
        _ viewControllers: [UIViewController],
        defaultSegmentIndex: Int = 0,
        fullWidthSegmentedControl: Bool = false,
        segmentedControlTopMargin: CGFloat = 10,
        segmentedControlBottomMargin: CGFloat = 10
    ) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
        self.defaultSegmentIndex = defaultSegmentIndex
        self.fullWidthSegmentedControl = fullWidthSegmentedControl
        self.segmentedControlTopMargin = segmentedControlTopMargin
        self.segmentedControlBottomMargin = segmentedControlBottomMargin
    }

    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = VitaminColor.Core.Background.primary
        setupViews()
        displayViewController(at: defaultSegmentIndex)
    }

    // Computation of segment titles by extracting sub viewControllers titles
    private func segmentTitles() -> [String] {
        var segmentTitles: [String] = []
        for viewController in self.viewControllers {
            if let title = viewController.title {
                segmentTitles.append(title)
            }
        }
        return segmentTitles
    }

    // setup views at loading
    private func setupViews() {
        view.addSubview(segmentedControl)
        view.addSubview(segmentedControlView)
        if #available(iOS 11.0, *) {
            segmentedControlView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            segmentedControlView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
        }
        segmentedControlBottomMarginConstraint.isActive = true
        segmentedControlTopMarginConstraint.isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        segmentedControlView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        segmentedControlView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        segmentedControlLeftConstraint.isActive = fullWidthSegmentedControl
        segmentedControlRightConstraint.isActive = fullWidthSegmentedControl
    }

    // Selector called when a segment is selected
    @objc func segmentSelected(_ segmentControl: UISegmentedControl) {
        var lastDisplayedIndex: Int?

        if let lastDisplayedViewControllerIndex = self.lastDisplayedViewControllerIndex {
            lastDisplayedIndex = lastDisplayedViewControllerIndex
        }

        displayViewController(at: segmentControl.selectedSegmentIndex)

        if let lastDisplayedIndex = lastDisplayedIndex {
            hideViewController(at: lastDisplayedIndex)
        }
    }

    // Method that displays selected sub viewcontroller
    private func displayViewController(at viewControllerIndex: Int) {
        let viewController = self.viewControllers[viewControllerIndex]
        segmentedControl.selectedSegmentIndex = viewControllerIndex

        self.addChild(viewController)

        self.view.addSubview(viewController.view)

        viewController.view.translatesAutoresizingMaskIntoConstraints = false

        viewController.view.leftAnchor.constraint(equalTo: segmentedControlView.leftAnchor).isActive = true
        viewController.view.topAnchor.constraint(equalTo: segmentedControlView.topAnchor).isActive = true
        viewController.view.rightAnchor.constraint(equalTo: segmentedControlView.rightAnchor).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: segmentedControlView.bottomAnchor).isActive = true

        viewController.didMove(toParent: self)

        self.lastDisplayedViewControllerIndex = segmentedControl.selectedSegmentIndex
    }

    // Method that hides previously selected sub viewcontroller
    private func hideViewController(at viewControllerIndex: Int) {
        let viewController = self.viewControllers[viewControllerIndex]

        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
