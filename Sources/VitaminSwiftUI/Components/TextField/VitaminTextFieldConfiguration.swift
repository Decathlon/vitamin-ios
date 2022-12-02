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
        let isSecure: Binding<Bool>

        /// Text configuration for text related content.
        /// - Parameters:
        ///   - label: Text to display above the `TextField`.
        ///   - placeholder: Text to display inside the `TextField`.
        ///   - helperText: Text to display below the `TextField`. Optional.
        ///   - text: Text binding to use for the `TextField`.
        ///   - isSecure: If we should display a `SecureField` instead. Default: `false`.
        public init(
            label: String,
            placeholder: String,
            helperText: String?,
            text: Binding<String>,
            isSecure: Binding<Bool> = .constant(false)
        ) {
            self.label = label
            self.placeholder = placeholder
            self.helperText = helperText
            self.text = text
            self.isSecure = isSecure
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
