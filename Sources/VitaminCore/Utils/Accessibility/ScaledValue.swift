//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

@available(iOS 11, *)
@propertyWrapper
/// Update a value to fit the font scale.
public struct ScaledValue {
    var value: CGFloat

    public var wrappedValue: CGFloat {
        get {
            UIFontMetrics.default.scaledValue(for: value)
        }
        set {
            value = newValue
        }
    }

    public init(wrappedValue: CGFloat) {
        value = wrappedValue
    }
}
