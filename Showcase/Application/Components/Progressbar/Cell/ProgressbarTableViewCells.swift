//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class ProgressbarTableViewCell: UITableViewCell {
    @IBOutlet weak var vitaminProgressbar: VitaminProgressbar!
    @IBOutlet weak var progressTextField: UITextField!
    @IBOutlet weak var startStopButton: UIButton!

    private var indexPath = IndexPath()
    public weak var delegate: ProgressViewCellDelegate?

    func update(
        variant: VitaminProgressbarVariant = .circular(
            size: .medium,
            style: .percentage),
        progressType: VitaminProgressbarProgressType,
        withTrack: Bool = true,
        progress: CGFloat = 0,
        indexPath: IndexPath,
        delegate: ProgressViewCellDelegate?,
        progressbarTexts: ProgressbarTexts?
    ) {
        vitaminProgressbar.variant = variant
        vitaminProgressbar.progressType = progressType
        vitaminProgressbar.showTrack = withTrack
        vitaminProgressbar.progress = progress
        vitaminProgressbar.leftLabelText = progressbarTexts?.leftLabelText
        vitaminProgressbar.accessibilityLabel = progressbarTexts?.accessibilityLabel
        progressTextField.text = "\(Int(progress * 100))"
        progressTextField.delegate = self
        self.delegate = delegate
        self.indexPath = indexPath

        startStopButton.isHidden = (vitaminProgressbar.progressType == .determinate)
        progressTextField.isHidden = (vitaminProgressbar.progressType == .indeterminate)

        vitaminProgressbar.stopAnimationForIndeterminate()

        self.startStopButton.setTitle("Start", for: .normal)
    }
}

// MARK: TextField delegate
extension ProgressbarTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let textInt = Int(text) {
            var finalInt = textInt
            if finalInt < 0 {
                finalInt = 0
            } else if finalInt > 100 {
                finalInt = 100
            }
            textField.text = "\(finalInt)"
            let progressFloat = CGFloat(Double(finalInt) / 100)
            self.vitaminProgressbar.progress = progressFloat
            self.delegate?.didUpdateProgressField(at: self.indexPath, with: progressFloat)
        } else {
            textField.text = "\(Int(vitaminProgressbar.progress * 100))"
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: ib actions
extension ProgressbarTableViewCell {
    @IBAction public func startStopButtonClicked() {
        if self.vitaminProgressbar.isCurrentlyAnimated {
            self.vitaminProgressbar.stopAnimationForIndeterminate()
            self.startStopButton.setTitle("Start", for: .normal)
        } else {
            self.vitaminProgressbar.startAnimationForIndeterminate()
            self.startStopButton.setTitle("Stop", for: .normal)
        }
    }
}

/// protocol for updating the datasource when a value is modified in a cell
protocol ProgressViewCellDelegate: AnyObject {
    func didUpdateProgressField(at index: IndexPath, with value: CGFloat)
}

struct ProgressbarTexts {
    let leftLabelText: String?
    let accessibilityLabel: String?
}
