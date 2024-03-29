//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI

@available(iOS 13, *)
extension VitaminTextField {
    public struct TextConfiguration {
        let label: String
        let placeholder: String
        let helperText: String?
        let text: Binding<String>

        /// Text configuration for text related content.
        /// - Parameters:
        ///   - label: Text to display above the text field.
        ///   - placeholder: Text to display inside the text field.
        ///   - helperText: Text to display below the text field. Optional.
        ///   - text: Text binding to use for the text field.
        public init(
            label: String,
            placeholder: String,
            helperText: String? = nil,
            text: Binding<String>
        ) {
            self.label = label
            self.placeholder = placeholder
            self.helperText = helperText
            self.text = text
        }
    }

    public struct IconConfiguration {
        let icon: Image
        let action: (() -> Void)?

        /// Icon configuration to display a custom icon and to handle an action on the icon.
        /// The icon must a square shape.
        /// - Parameters:
        ///   - icon: The icon to display.
        ///   - action: A closure to handle an action on the icon.
        public init(icon: Image, action: (() -> Void)? = nil) {
            self.icon = icon
            self.action = action
        }
    }

    public struct CharacterLimitConfiguration {
        let text: Binding<String>
        let limit: Int

        /// Character limit configuration to add a maximum number of characters.
        /// - Parameters:
        ///   - text: The text value used with the `TextField` component.
        ///   - limit: The maximum number of characters that you want to have.
        public init(text: Binding<String>, limit: Int) {
            self.text = text
            self.limit = limit
        }
    }
}

#endif
