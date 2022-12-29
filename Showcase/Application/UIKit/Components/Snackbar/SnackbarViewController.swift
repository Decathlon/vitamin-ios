//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

public class SnackbarViewController: UIViewController {
    lazy var titleTF: VitaminTextField = buildTextField(label: "Snackbar Title", defaultValue: "A short title is best")

    lazy var messageTF: VitaminTextField = buildTextField(
        label: "Snackbar title",
        defaultValue: "A message should be short"
    )

    lazy var dismissalTF: VitaminTextField = buildTextField(
        label: "Auto dimiss delay",
        defaultValue: "5"
    )

    lazy var autoDismissSwitch: VitaminSwitch = buildSwitch()

    lazy var withImageSwitch: VitaminSwitch = buildSwitch(active: false)

    lazy var dismissOnTapSwitch: VitaminSwitch = buildSwitch()

    lazy var pushButton: VitaminButton = {
        let pushButton = VitaminButton(style: .primary)
        pushButton.setTitle("Push Snackbar", for: .normal)
        pushButton.setContentHuggingPriority(.required, for: .vertical)
        pushButton.setContentCompressionResistancePriority(.required, for: .vertical)
        return pushButton
    }()

    private var titleOk = true {
        didSet {
            pushButton.isEnabled = buttonEnabled
        }
    }
    private var messageOk = true {
        didSet {
            pushButton.isEnabled = buttonEnabled
        }
    }
    private var dismissDelayOk = true {
        didSet {
            pushButton.isEnabled = buttonEnabled
        }
    }

    private var buttonEnabled: Bool {
        titleOk && messageOk && dismissDelayOk
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Snackbar"
        self.accessibilityNavigationStyle = .automatic
        self.edgesForExtendedLayout = []

        view.backgroundColor = VitaminColor.Core.Background.primary

        buildFormStackView()

        let notEmptyTitleFieldValidation: VitaminTextFieldValidation = { fieldValue, completion in
            guard let fieldValue = fieldValue else { return }

            if fieldValue.isEmpty {
                completion(
                    .failure(
                        .errorWithMessage("Value must be at least 1 character"))
                )
                self.titleOk = false
            } else {
                self.titleOk = true
                completion(.success(()))
            }
        }

        let notEmptyMessageFieldValidation: VitaminTextFieldValidation = { fieldValue, completion in
            guard let fieldValue = fieldValue else { return }

            if fieldValue.isEmpty {
                completion(
                    .failure(
                        .errorWithMessage("Value must be at least 1 character"))
                )
                self.messageOk = false
            } else {
                self.messageOk = true
                completion(.success(()))
            }
        }

        let numericFieldValidation: VitaminTextFieldValidation = { fieldValue, completion in
            guard let fieldValue = fieldValue else { return }

            if Double(fieldValue) != nil {
                self.dismissDelayOk = true
                completion(.success(()))
            } else {
                completion(
                    .failure(
                        .errorWithMessage("Value must be an integer or a Double"))
                )
                self.dismissDelayOk = false
            }
        }

        titleTF.liveValidation = notEmptyTitleFieldValidation
        messageTF.liveValidation = notEmptyMessageFieldValidation
        dismissalTF.liveValidation = numericFieldValidation

        pushButton.addTarget(self, action: #selector(self.pushButtonTapped), for: .touchUpInside)
        pushButton.isEnabled = buttonEnabled
    }

    @objc private func pushButtonTapped(sender: UIButton) {
        let image = self.withImageSwitch.isOn ? VitaminAssets.Placeholder.landscape.image : nil
        var dismissDelay = 5.0

        if let delayStr = dismissalTF.fieldValue, let delay = Double(delayStr) {
            dismissDelay = delay
        }


        self.present(
            VitaminSnackbar(
                contentConfiguration: VitaminSnackbar.ContentConfiguration(
                    title: titleTF.fieldValue ?? "",
                    message: messageTF.fieldValue ?? "",
                    image: image
                ),
                dismissConfiguration: VitaminSnackbar.DismissConfiguration(
                    autoDismiss: autoDismissSwitch.isOn,
                    dismissDelay: dismissDelay,
                    dismissOnTap: dismissOnTapSwitch.isOn
                )
            )
        )
    }
}

// MARK: utility method to build the form
extension SnackbarViewController {
    private func buildFormStackView() {
        let formStackView = UIStackView()
        view.addSubview(formStackView)

        formStackView.axis = .vertical
        formStackView.distribution = .equalSpacing
        formStackView.spacing = 10

        formStackView.translatesAutoresizingMaskIntoConstraints = false
        formStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 4).isActive = true
        formStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
        formStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        let switchDismissStackView = buildSwitchLine(label: "Auto Dismiss ?", vitaminSwitch: autoDismissSwitch)
        let switchImageStackView = buildSwitchLine(label: "With image ?", vitaminSwitch: withImageSwitch)
        let switchDismissOnTapStackView = buildSwitchLine(label: "Dismiss on tap ?", vitaminSwitch: dismissOnTapSwitch)

        autoDismissSwitch.addTarget(self, action: #selector(self.switchChanged), for: .valueChanged)


        formStackView.addArrangedSubview(titleTF)
        formStackView.addArrangedSubview(messageTF)
        formStackView.addArrangedSubview(switchDismissStackView)
        formStackView.addArrangedSubview(dismissalTF)
        formStackView.addArrangedSubview(switchDismissOnTapStackView)
        formStackView.addArrangedSubview(switchImageStackView)
        formStackView.addArrangedSubview(pushButton)
    }

    private func buildSwitchLine(label: String, vitaminSwitch: VitaminSwitch) -> UIStackView {
        let switchStackView = UIStackView()
        switchStackView.axis = .horizontal
        switchStackView.distribution = .fill
        switchStackView.spacing = 10

        let switchLabel = UILabel()
        switchLabel.attributedText = label.styled(as: .body)
        switchStackView.addArrangedSubview(switchLabel)
        switchStackView.addArrangedSubview(vitaminSwitch)

        switchStackView.setContentHuggingPriority(.required, for: .vertical)
        switchStackView.setContentCompressionResistancePriority(.required, for: .vertical)

        return switchStackView
    }

    private func buildSwitch(active: Bool = true) -> VitaminSwitch {
        let aSwitch = VitaminSwitch()
        aSwitch.setContentHuggingPriority(.required, for: .vertical)
        aSwitch.setContentCompressionResistancePriority(.required, for: .vertical)
        aSwitch.setOn(active, animated: false)
        return aSwitch
    }

    private func buildTextField(label: String, defaultValue: String) -> VitaminTextField {
        let aTextField = VitaminTextField()
        aTextField.labelText = label
        aTextField.setContentHuggingPriority(.required, for: .vertical)
        aTextField.setContentCompressionResistancePriority(.required, for: .vertical)
        aTextField.horizontalPadding = false
        aTextField.fieldValue = defaultValue
        return aTextField
    }

    @objc private func switchChanged(sender: UISwitch) {
        if !sender.isOn {
            dismissalTF.isHidden = true
            dismissDelayOk = true
        } else {
            dismissalTF.isHidden = false
            if let fieldValue = dismissalTF.fieldValue, Double(fieldValue) != nil {
                dismissDelayOk = true
            } else {
                dismissDelayOk = false
            }
        }
    }
}
