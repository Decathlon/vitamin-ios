//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

public extension VitaminSnackbar {
    /// Struct that can be provided to the initializer of `VitaminSnackBar` that groups all content configuration
    struct ContentConfiguration {
        public var title: String
        public var message: String
        public var image: UIImage?

        public init(
            title: String,
            message: String,
            image: UIImage? = nil
        ) {
            self.title = title
            self.message = message
            self.image = image
        }
    }

    /// Struct that can be provided to the initializer of `VitaminSnackBar` that groups all configuration about dismissal
    struct DismissConfiguration {
        public var autoDismiss: Bool
        public var dismissDelay: TimeInterval
        public var dismissOnTap: Bool

        public init(
            autoDismiss: Bool = true,
            dismissDelay: TimeInterval = 5.0,
            dismissOnTap: Bool = true
        ) {
            self.autoDismiss = autoDismiss
            self.dismissDelay = dismissDelay
            self.dismissOnTap = dismissOnTap
        }
    }
}
