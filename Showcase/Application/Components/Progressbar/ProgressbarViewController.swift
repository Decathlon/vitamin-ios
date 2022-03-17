//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class ProgressbarViewController: UITableViewController {
    convenience init() {
        self.init(style: .grouped)
    }

    private var exampleImage: UIImage {
        UIImage(named: "flag") ?? UIImage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Progressbar"
        tableView.register(
            UINib(
                nibName: "CircularProgressbarTableViewCell",
                bundle: nil),
            forCellReuseIdentifier: "circularProgressbarCell")
        tableView.register(
            UINib(
                nibName: "LinearProgressbarTableViewCell",
                bundle: nil),
            forCellReuseIdentifier: "linearProgressbarCell" )
    }

    private lazy var datasourceCircular: [ProgressbarDemoConfig] = [
        ProgressbarDemoConfig(
            variant: .circular(
                size: .small,
                style: .percentage),
            withTrack: true,
            progress: 0.30,
            accessibilityLabel: "Chargement en cours"),
        ProgressbarDemoConfig(variant: .circular(size: .small, style: .percentage), withTrack: false, progress: 0.40),
        ProgressbarDemoConfig(variant: .circular(size: .small, style: .empty), withTrack: true, progress: 0.50),
        ProgressbarDemoConfig(variant: .circular(size: .small, style: .empty), withTrack: false, progress: 0.60),
        ProgressbarDemoConfig(
            variant: .circular(
                size: .small,
                style: .image(exampleImage)),
            withTrack: true,
            progress: 0.50),
        ProgressbarDemoConfig(
            variant: .circular(
                size: .small,
                style: .image(exampleImage)),
            withTrack: false,
            progress: 0.60),
        ProgressbarDemoConfig(
            variant: .circular(size: .small, style: .empty),
            progressType: .indeterminate,
            withTrack: true),
        ProgressbarDemoConfig(
            variant: .circular(
                size: .small,
                style: .empty),
            progressType: .indeterminate,
            withTrack: false),
        ProgressbarDemoConfig(
            variant: .circular(
                size: .small,
                style: .image(exampleImage)),
            progressType: .indeterminate,
            withTrack: true),
        ProgressbarDemoConfig(
            variant: .circular(
                size: .small,
                style: .image(exampleImage)),
            progressType: .indeterminate,
            withTrack: false),
        ProgressbarDemoConfig(variant: .circular(size: .medium, style: .percentage), withTrack: true, progress: 0.70),
        ProgressbarDemoConfig(variant: .circular(size: .medium, style: .percentage), withTrack: false, progress: 0.80),
        ProgressbarDemoConfig(variant: .circular(size: .medium, style: .empty), withTrack: true, progress: 0.90),
        ProgressbarDemoConfig(variant: .circular(size: .medium, style: .empty), withTrack: false, progress: 0.80),
        ProgressbarDemoConfig(
            variant: .circular(
                size: .medium,
                style: .image(exampleImage)),
            withTrack: true,
            progress: 0.90),
        ProgressbarDemoConfig(
            variant: .circular(
                size: .medium,
                style: .image(exampleImage)),
            withTrack: false,
            progress: 0.80),
        ProgressbarDemoConfig(
            variant: .circular(
                size: .medium,
                style: .empty),
            progressType: .indeterminate,
            withTrack: true),
        ProgressbarDemoConfig(
            variant: .circular(
                size: .medium,
                style: .empty),
            progressType: .indeterminate,
            withTrack: false),
        ProgressbarDemoConfig(
            variant: .circular(size: .medium, style: .image(exampleImage)),
            progressType: .indeterminate,
            withTrack: true),
        ProgressbarDemoConfig(
            variant: .circular(size: .medium, style: .image(exampleImage)),
            progressType: .indeterminate,
            withTrack: false)
    ]

    private var datasourceLinear: [ProgressbarDemoConfig] = [
        ProgressbarDemoConfig(
            variant: .linear(
                size: .small,
                style: .percentage),
            withTrack: true,
            progress: 0.30,
            leftLabelText: "Example 1S"),
        ProgressbarDemoConfig(
            variant: .linear(
                size: .small,
                style: .percentage),
            withTrack: false,
            progress: 0.40,
            leftLabelText: "Example 2S"),
        ProgressbarDemoConfig(variant: .linear(size: .small, style: .empty), withTrack: true, progress: 0.50),
        ProgressbarDemoConfig(variant: .linear(size: .small, style: .empty), withTrack: false, progress: 0.60),
        ProgressbarDemoConfig(
            variant: .linear(size: .small, style: .empty),
            progressType: .indeterminate,
            withTrack: true),
        ProgressbarDemoConfig(
            variant: .linear(size: .small, style: .empty),
            progressType: .indeterminate,
            withTrack: false),
        ProgressbarDemoConfig(
            variant: .linear(
                size: .medium,
                style: .percentage),
            withTrack: true,
            progress: 0.70,
            leftLabelText: "Example 1M"),
        ProgressbarDemoConfig(
            variant: .linear(
                size: .medium,
                style: .percentage),
            withTrack: false,
            progress: 0.80,
            leftLabelText: "Example 2M"),
        ProgressbarDemoConfig(variant: .linear(size: .medium, style: .empty), withTrack: true, progress: 0.90),
        ProgressbarDemoConfig(variant: .linear(size: .medium, style: .empty), withTrack: false, progress: 0.80),
        ProgressbarDemoConfig(
            variant: .linear(size: .medium, style: .empty),
            progressType: .indeterminate,
            withTrack: true),
        ProgressbarDemoConfig(
            variant: .linear(size: .medium, style: .empty),
            progressType: .indeterminate,
            withTrack: false),
        ProgressbarDemoConfig(
            variant: .linear(
                size: .large,
                style: .percentage),
            withTrack: true,
            progress: 0.30,
            leftLabelText: "Example 1L"),
        ProgressbarDemoConfig(
            variant: .linear(
                size: .large,
                style: .percentage),
            withTrack: false,
            progress: 0.40,
            leftLabelText: "Example 2L"),
        ProgressbarDemoConfig(variant: .linear(size: .large, style: .empty), withTrack: true, progress: 0.50),
        ProgressbarDemoConfig(variant: .linear(size: .large, style: .empty), withTrack: false, progress: 0.60),
        ProgressbarDemoConfig(
            variant: .linear(size: .large, style: .empty),
            progressType: .indeterminate,
            withTrack: true),
        ProgressbarDemoConfig(
            variant: .linear(size: .large, style: .empty),
            progressType: .indeterminate,
            withTrack: false)
    ]

    private static let sectionTitles = ["Circular Progress Bars", "Linear Progress Bars"]

    private lazy var datasource: [String: [ProgressbarDemoConfig]] = [
        ProgressbarViewController.sectionTitles[0]: datasourceCircular,
        ProgressbarViewController.sectionTitles[1]: datasourceLinear
    ]
}

extension ProgressbarViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        datasource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = datasource[ProgressbarViewController.sectionTitles[section]] else {
            return 0
        }
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = ProgressbarTableViewCell()

        if indexPath.section == 0,
            let circularCell = tableView.dequeueReusableCell(
                withIdentifier: "circularProgressbarCell",
                for: indexPath) as? ProgressbarTableViewCell {
            cell = circularCell
        } else if let linearCell = tableView.dequeueReusableCell(
            withIdentifier: "linearProgressbarCell",
            for: indexPath) as? ProgressbarTableViewCell {
            cell = linearCell
        }

        guard let data = datasource[ProgressbarViewController.sectionTitles[indexPath.section]] else {
            return cell
        }
        let config = data[indexPath.row]
        cell.update(
            variant: config.variant,
            progressType: config.progressType,
            withTrack: config.withTrack,
            progress: config.progress,
            indexPath: indexPath,
            delegate: self,
            leftLabelText: config.leftLabelText,
            accessibilityLabel: config.accessibilityLabel)
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let data = datasource[ProgressbarViewController.sectionTitles[indexPath.section]] else {
            return 160
        }

        let config = data[indexPath.row]
        if case .circular(let size, _) = config.variant, size == .small {
            return 90
        } else if case .linear = config.variant {
            return 130
        }
        return 160
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        ProgressbarViewController.sectionTitles[section]
    }
}

private struct ProgressbarDemoConfig {
    var variant: VitaminProgressbarVariant = .circular(size: .medium, style: .percentage)
    var progressType: VitaminProgressbarProgressType = .determinate
    var withTrack = true
    var progress: CGFloat = 0
    weak var delegate: ProgressViewCellDelegate?
    var leftLabelText: String?
    var accessibilityLabel: String?
}

extension ProgressbarViewController: ProgressViewCellDelegate {
    func didUpdateProgressField(at indexPath: IndexPath, with value: CGFloat) {
        if indexPath.section == 0 {
            datasourceCircular[indexPath.row].progress = value
        } else {
            datasourceLinear[indexPath.row].progress = value
        }
    }
}
