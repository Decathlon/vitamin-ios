//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public class SampleLabelViewController: UIViewController {
    public var sampleText: String = "" {
        didSet {
            label.attributedText = sampleText.styled(as: .headline)
        }
    }
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
