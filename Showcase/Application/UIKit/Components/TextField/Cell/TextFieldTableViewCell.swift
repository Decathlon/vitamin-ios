//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

final class TextFieldTableViewCell: UITableViewCell {
    @IBOutlet weak var vitaminTextField: VitaminTextField!

    /// Method used to update the `VitamineTextField`object of the cell after it has been dequeued
    func updateVitaminTextField(
        style: VitaminTextField.Style = .outline,
        stateConfiguration: VitaminTextField.StateConfiguration,
        texts: VitaminTextField.TextConfiguration,
        validation: VitaminTextField.ValidationConfiguration? = nil,
        maxLength: Int? = nil,
        icon: VitaminTextField.IconConfiguration? = nil,
        textFieldTag: Int = 0
    ) {
        vitaminTextField.labelText = texts.labelText
        vitaminTextField.helperText = texts.helperText
        vitaminTextField.placeholderText = texts.placeholderText
        vitaminTextField.fieldValue = texts.fieldValue
        vitaminTextField.isSecureTextEntry = texts.secureText ?? false
        vitaminTextField.maxLength = maxLength
        vitaminTextField.state = stateConfiguration.initialState
        vitaminTextField.icon = icon?.initialIcon
        vitaminTextField.iconAction = icon?.iconAction
        vitaminTextField.iconActionDelegate = icon?.iconActionDelegate
        vitaminTextField.style = style
        vitaminTextField.liveValidation = validation?.liveValidation
        vitaminTextField.endEditingValidation = validation?.endEditingValidation
        vitaminTextField.liveValidationTimeInterval = validation?.liveValidationTimeInterval ?? 0.5
        vitaminTextField.activeOnEditing = stateConfiguration.activeOnEditing
        vitaminTextField.textFieldTag = textFieldTag
    }
}
