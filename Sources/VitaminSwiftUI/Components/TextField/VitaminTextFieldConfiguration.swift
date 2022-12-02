//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI

@available(iOS 13, *)
extension VitaminTextField {
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
