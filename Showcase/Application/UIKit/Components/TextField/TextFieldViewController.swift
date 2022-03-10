//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class TextFieldViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "TextField"

        tableView.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: "textField")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80

        addObservers()
    }

    static let placeholderOutline: String = "placeholder outline"
    static let placeholderFilled: String = "placeholder filled"
    static let helperTextOutline: String = "Helper Text Outline"
    static let helperTextFilled: String = "Helper Text Filled"
    private static let sectionTitles = ["Static VitaminTextFields", "Dynamic VitaminTextFields"]
    private lazy var datasource: [String: [TextFieldDemoConfig]] = [
        TextFieldViewController.sectionTitles[0]: staticTextFields,
        TextFieldViewController.sectionTitles[1]: dynamicTextFields
    ]

    private let staticTextFields: [TextFieldDemoConfig] = [
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 1 Outline",
                placeholderText: placeholderOutline,
                helperText: helperTextOutline),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(initialState: .standard),
            style: VitaminTextField.Style.outline,
            maxLength: nil,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 2 Outline",
                placeholderText: placeholderOutline,
                helperText: helperTextOutline
            ),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard),
            style: VitaminTextField.Style.outline,
            maxLength: nil,
            icon: VitaminTextField.IconConfiguration(initialIcon: Vitamix.Line.Health.heart.image)
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 3 Outline",
                placeholderText: placeholderOutline,
                helperText: helperTextOutline),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .disabled),
            style: VitaminTextField.Style.outline,
            maxLength: 20,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 4 Outline",
                placeholderText: nil,
                helperText: nil),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .disabled),
            style: VitaminTextField.Style.outline,
            maxLength: 20,
            icon: VitaminTextField.IconConfiguration(initialIcon: Vitamix.Line.Health.heart.image)
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 5 Outline",
                placeholderText: placeholderOutline,
                helperText: helperTextOutline),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .error),
            style: VitaminTextField.Style.outline,
            maxLength: 20,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 6 Outline",
                placeholderText: placeholderOutline,
                helperText: nil),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .success),
            style: VitaminTextField.Style.outline,
            maxLength: 20,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 7 Outline",
                placeholderText: placeholderOutline,
                helperText: nil),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .active),
            style: VitaminTextField.Style.outline,
            maxLength: nil,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 1 Filled",
                placeholderText: placeholderFilled,
                helperText: helperTextFilled),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard),
            style: VitaminTextField.Style.filled,
            maxLength: nil,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 2 Filled",
                placeholderText: placeholderFilled,
                helperText: helperTextFilled),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard),
            style: VitaminTextField.Style.filled,
            maxLength: nil,
            icon: VitaminTextField.IconConfiguration(initialIcon: Vitamix.Line.Health.heart.image)
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 3 Filled",
                placeholderText: placeholderFilled,
                helperText: helperTextFilled),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .disabled),
            style: VitaminTextField.Style.filled,
            maxLength: 20,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 4 Filled",
                placeholderText: nil,
                helperText: nil),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .disabled),
            style: VitaminTextField.Style.filled,
            maxLength: 20,
            icon: VitaminTextField.IconConfiguration(initialIcon: Vitamix.Line.Health.heart.image)
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 5 Filled",
                placeholderText: placeholderFilled,
                helperText: helperTextFilled),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .error),
            style: VitaminTextField.Style.filled,
            maxLength: 20,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 6 Filled",
                placeholderText: placeholderFilled,
                helperText: nil),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .success),
            style: VitaminTextField.Style.filled,
            maxLength: 20,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Example 7 Filled",
                placeholderText: placeholderFilled,
                helperText: nil),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .active),
            style: VitaminTextField.Style.filled,
            maxLength: nil,
            icon: nil
        )
    ]
    private lazy var dynamicTextFields: [TextFieldDemoConfig] = [
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Live Validation Outline",
                placeholderText: TextFieldViewController.placeholderOutline,
                helperText: TextFieldViewController.helperTextOutline),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: atLeastThreeCharValidationExample,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard),
            style: VitaminTextField.Style.outline,
            maxLength: nil,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "End editing validation Outline",
                placeholderText: TextFieldViewController.placeholderOutline,
                helperText: TextFieldViewController.helperTextOutline),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: atLeastThreeCharValidationExample),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard),
            style: VitaminTextField.Style.outline,
            maxLength: nil,
            icon: VitaminTextField.IconConfiguration(initialIcon: Vitamix.Line.Health.heart.image)
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Active on Edit Outline",
                placeholderText: TextFieldViewController.placeholderOutline,
                helperText: TextFieldViewController.helperTextOutline),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard,
                activeOnEditing: true),
            style: VitaminTextField.Style.outline,
            maxLength: 20,
            icon: VitaminTextField.IconConfiguration(initialIcon: Vitamix.Line.Health.heart.image)
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Password Outline",
                placeholderText: TextFieldViewController.placeholderOutline,
                helperText: TextFieldViewController.helperTextOutline,
                secureText: true),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard,
                activeOnEditing: true),
            style: VitaminTextField.Style.outline,
            maxLength: 20,
            icon: VitaminTextField.IconConfiguration(
                initialIcon: Vitamix.Line.System.eye.image,
                iconAction: iconActionPasswordShowHide)
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Alert on icon click Outline",
                placeholderText: TextFieldViewController.placeholderOutline,
                helperText: TextFieldViewController.helperTextOutline),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard,
                activeOnEditing: true),
            style: VitaminTextField.Style.outline,
            maxLength: 20,
            icon: VitaminTextField.IconConfiguration(
                initialIcon: Vitamix.Line.Health.heart.image,
                iconActionDelegate: self)
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Live Validation Filled",
                placeholderText: TextFieldViewController.placeholderFilled,
                helperText: TextFieldViewController.helperTextFilled),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: atLeastThreeCharValidationExample,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard),
            style: VitaminTextField.Style.filled,
            maxLength: nil,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "End editing validation Filled",
                placeholderText: TextFieldViewController.placeholderFilled,
                helperText: TextFieldViewController.helperTextFilled),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: atLeastThreeCharValidationExample),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard),
            style: VitaminTextField.Style.filled,
            maxLength: nil,
            icon: VitaminTextField.IconConfiguration(initialIcon: Vitamix.Line.Health.heart.image)
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Active on Edit Filled",
                placeholderText: TextFieldViewController.placeholderOutline,
                helperText: TextFieldViewController.helperTextOutline),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard,
                activeOnEditing: true),
            style: VitaminTextField.Style.filled,
            maxLength: 20,
            icon: nil
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Password Filled",
                placeholderText: TextFieldViewController.placeholderFilled,
                helperText: TextFieldViewController.helperTextFilled,
                secureText: true),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard,
                activeOnEditing: true),
            style: VitaminTextField.Style.filled,
            maxLength: 20,
            icon: VitaminTextField.IconConfiguration(
                initialIcon: Vitamix.Line.System.eye.image,
                iconAction: iconActionPasswordShowHide)
        ),
        TextFieldDemoConfig(
            textsConfiguration: VitaminTextField.TextConfiguration(
                labelText: "Alert on icon click Filled",
                placeholderText: TextFieldViewController.placeholderFilled,
                helperText: TextFieldViewController.helperTextFilled
            ),
            validationConfiguration: VitaminTextField.ValidationConfiguration(
                liveValidation: nil,
                liveValidationTimeInterval: 0.5,
                endEditingValidation: nil),
            stateConfiguration: VitaminTextField.StateConfiguration(
                initialState: .standard,
                activeOnEditing: true),
            style: VitaminTextField.Style.filled,
            maxLength: 20,
            icon: VitaminTextField.IconConfiguration(
                initialIcon: Vitamix.Line.Health.heart.image,
                iconActionDelegate: self
            )
        )
    ]

    let atLeastThreeCharValidationExample: VitaminTextFieldValidation = { fieldValue, completion in
        guard let fieldValue = fieldValue else { return }

        if fieldValue.count < 3 {
            completion(.failure(.errorWithMessage("Value must be at least 3 chatracters")))
        } else {
            completion(.success(()))
        }
    }

    let iconActionPasswordShowHide: VitaminTextFieldIconAction = { vitaminTextField in
        vitaminTextField.isSecureTextEntry.toggle()
        vitaminTextField.icon = vitaminTextField.isSecureTextEntry ?
            Vitamix.Line.System.eye.image : Vitamix.Line.System.eyeOff.image
    }
}

extension TextFieldViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        datasource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let datasource = datasource[TextFieldViewController.sectionTitles[section]] else {
            return 0
        }
        return datasource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "textField") as? TextFieldTableViewCell else {
            let cell = TextFieldTableViewCell(style: .default, reuseIdentifier: "textField")
            return cell
        }
        cell.vitaminTextField.delegate = self
        cell.selectionStyle = .none

        if indexPath.section == 0 {
            cell.updateVitaminTextField(
                style: staticTextFields[indexPath.row].style,
                stateConfiguration: staticTextFields[indexPath.row].stateConfiguration,
                texts: staticTextFields[indexPath.row].textsConfiguration,
                maxLength: staticTextFields[indexPath.row].maxLength,
                icon: staticTextFields[indexPath.row].icon
            )
        } else if indexPath.section == 1 {
            cell.updateVitaminTextField(
                style: dynamicTextFields[indexPath.row].style,
                stateConfiguration: dynamicTextFields[indexPath.row].stateConfiguration,
                texts: dynamicTextFields[indexPath.row].textsConfiguration,
                validation: dynamicTextFields[indexPath.row].validationConfiguration,
                maxLength: dynamicTextFields[indexPath.row].maxLength,
                icon: dynamicTextFields[indexPath.row].icon
            )
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        TextFieldViewController.sectionTitles[section]
    }
}

// MARK: - VitaminTextField Delegate

extension TextFieldViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Keybord handling

extension TextFieldViewController {
    func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
        let value = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }

        var keyboardFrame: CGRect = value.cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset: UIEdgeInsets = tableView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 15
        tableView.contentInset = contentInset
    }

    @objc func keyboardWillHide() {
        let contentInset: UIEdgeInsets = .zero
        tableView.contentInset = contentInset
    }
}

extension TextFieldViewController: VitaminTextFieldIconActionDelegate {
    func vitaminTextFieldDidClickOnIcon(_ vitaminTextField: VitaminTextField) {
        let alert = UIAlertController(
            title: "Icon Action triggered",
            message: "you clicked on the icon",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: false)
    }
}

private struct TextFieldDemoConfig {
    let textsConfiguration: VitaminTextField.TextConfiguration
    let validationConfiguration: VitaminTextField.ValidationConfiguration
    let stateConfiguration: VitaminTextField.StateConfiguration
    let style: VitaminTextField.Style
    let maxLength: Int?
    let icon: VitaminTextField.IconConfiguration?
}
