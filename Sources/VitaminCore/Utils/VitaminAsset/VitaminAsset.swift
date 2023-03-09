//
//  Vitamin iOS
//  Apache License 2.0
//

import Foundation

public struct VitaminAsset {
    public private(set) var name: String

    init(name: String) {
        self.name = name
    }

    public var bundle: Bundle {
        BundleToken.bundle
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        return Bundle(for: BundleToken.self)
#endif
    }()
}
// swiftlint:enable convenience_type
