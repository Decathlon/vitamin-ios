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

        // TODO: Documentation
        public init(icon: Image, action: (() -> Void)? = nil) {
            self.icon = icon
            self.action = action
        }
    }

    public struct CharacterLimitConfiguration {
        let text: Binding<String>
        let limit: Int

        // TODO: Documentation
        public init(text: Binding<String>, limit: Int) {
            self.text = text
            self.limit = limit
        }
    }
}

#endif
