//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

// MARK: - configuration structs

/// Protocol that can be implemented to be noticed of events on the text field icon
public protocol VitaminTextFieldIconActionDelegate: AnyObject {
    /// Method that is called when the user clicks on the icon in VitaminTextField
    func vitaminTextFieldDidClickOnIcon(_ vitaminTextField: VitaminTextField)
}

public extension VitaminTextField {
    /// Struct that can be provided to the initializer of `VitaminTextField`
    /// that groups all validation configuration
    struct ValidationConfiguration {
        public var liveValidation: VitaminTextFieldValidation?
        public var liveValidationTimeInterval: TimeInterval = 0.5
        public var endEditingValidation: VitaminTextFieldValidation?

        public init(
            liveValidation: VitaminTextFieldValidation? = nil,
            liveValidationTimeInterval: TimeInterval = 0.5,
            endEditingValidation: VitaminTextFieldValidation? = nil
        ) {
            self.liveValidation = liveValidation
            self.liveValidationTimeInterval = liveValidationTimeInterval
            self.endEditingValidation = endEditingValidation
        }
    }

    /// Struct that can be provided to the initializer of `VitaminTextField`
    /// that groups all text configuration
    struct TextConfiguration {
        public var labelText: String
        public var fieldValue: String?
        public var placeholderText: String?
        public var helperText: String?
        public var secureText: Bool? = false

        public init(
            labelText: String,
            fieldValue: String? = nil,
            placeholderText: String? = nil,
            helperText: String? = nil,
            secureText: Bool? = false
        ) {
            self.labelText = labelText
            self.fieldValue = fieldValue
            self.placeholderText = placeholderText
            self.helperText = helperText
            self.secureText = secureText
        }
    }

    /// Struct that can be provided to the initializer of `VitaminTextField`
    /// that groups all state configuration
    struct StateConfiguration {
        public var initialState: VitaminTextField.State
        public var activeOnEditing = false

        public init(
            initialState: VitaminTextField.State,
            activeOnEditing: Bool = false
        ) {
            self.initialState = initialState
            self.activeOnEditing = activeOnEditing
        }
    }

    /// Struct that can be provided to the initializer of `VitaminTextField`
    /// that groups all icon configuration
    struct IconConfiguration {
        public var initialIcon: UIImage?
        public var iconAction: VitaminTextFieldIconAction?
        public weak var iconActionDelegate: VitaminTextFieldIconActionDelegate?

        public init(
            initialIcon: UIImage?,
            iconAction: VitaminTextFieldIconAction? = nil,
            iconActionDelegate: VitaminTextFieldIconActionDelegate? = nil
        ) {
            self.initialIcon = initialIcon
            self.iconAction = iconAction
            self.iconActionDelegate = iconActionDelegate
        }
    }
}
