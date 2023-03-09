//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

public final class SegmentedControlViewController: UIViewController {
    lazy var scrollView = UIScrollView()

    lazy var fixedWithLabel = initLabel(text: "Fixed Width")
    lazy var twoSegments = initSegmentedControl(items: ["One", "Two"])
    lazy var threeSegments = initSegmentedControl(items: ["One", "Two", "Three"])
    lazy var fourSegments = initSegmentedControl(items: ["One", "Two", "Three", "Four"])

    lazy var compactWidthLabel = initLabel(text: "Automatic Width")
    lazy var compacTwoSegments = initSegmentedControl(items: ["One", "Two"])
    lazy var compactThreeSegments = initSegmentedControl(items: ["One", "Two", "Three"])
    lazy var compactFourSegments = initSegmentedControl(items: ["One", "Two", "Three", "Four"])

    lazy var controllerLabel = initLabel(text: "ViewControllers use case")
    lazy var buttonSCController: VitaminButton = {
        let button = VitaminButton(style: .primary)
        button.setTitle("Display VitaminSegmentedControlController sample", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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

        self.navigationItem.title = "SegmentedControl"

        buildBlockOfSegmentedControl(
            label: fixedWithLabel,
            segmentedControl: [twoSegments, threeSegments, fourSegments],
            topAnchor: scrollView.topAnchor
        )

        buildBlockOfSegmentedControl(
            label: compactWidthLabel,
            segmentedControl: [compacTwoSegments, compactThreeSegments, compactFourSegments],
            topAnchor: fourSegments.bottomAnchor,
            topMargin: 40.0,
            fullWidth: false
        )

        buildButtonBlock(topAnchor: compactFourSegments.bottomAnchor)
    }

    private func buildBlockOfSegmentedControl(
        label: UILabel,
        segmentedControl: [VitaminSegmentedControl],
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

        for (index, segment) in segmentedControl.enumerated() {
            scrollView.addSubview(segment)
            segment.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            if fullWidth {
                segment.widthAnchor.constraint(
                    equalTo: view.widthAnchor,
                    constant: -2 * Self.horizontalPadding
                ).isActive = true
            }
            if index == 0 {
                segment.topAnchor.constraint(
                    equalTo: label.bottomAnchor,
                    constant: Self.verticalPadding
                ).isActive = true
            } else {
                segment.topAnchor.constraint(
                    equalTo: segmentedControl[index - 1].bottomAnchor,
                    constant: Self.verticalPadding
                ).isActive = true
            }
        }
    }

    private func initSegmentedControl(items: [Any]) -> VitaminSegmentedControl {
        let segmentedControl = VitaminSegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }

    private func initLabel(text: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.attributedText = text.styled(as: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    private func buildButtonBlock(
        topAnchor: NSLayoutYAxisAnchor,
        verticalPadding: CGFloat = verticalPadding
    ) {
        scrollView.addSubview(buttonSCController)
        scrollView.addSubview(controllerLabel)
        controllerLabel.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: Self.horizontalPadding
        ).isActive = true
        controllerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        buttonSCController.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        buttonSCController.topAnchor.constraint(
            equalTo: controllerLabel.bottomAnchor,
            constant: verticalPadding
        ).isActive = true
        buttonSCController.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        let vc1 = SampleLabelViewController()
        vc1.sampleText = "First ViewController"
        vc1.title = "First"

        let vc2 = SampleLabelViewController()
        vc2.sampleText = "Second ViewController"
        vc2.title = "Second"

        let vc3 = SampleLabelViewController()
        vc3.sampleText = "Third ViewController"
        vc3.title = "Third"

        let segmentedControlVc = VitaminSegmentedControlController([vc1, vc2, vc3], defaultSegmentIndex: 1)
        segmentedControlVc.title = "VitaminSegmentedControlController"
        segmentedControlVc.fullWidthSegmentedControl = true

        self.navigationController?.pushViewController(segmentedControlVc, animated: true)
    }
}
