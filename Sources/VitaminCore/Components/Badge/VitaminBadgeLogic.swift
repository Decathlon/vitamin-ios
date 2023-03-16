//
//  Vitamin iOS
//  Apache License 2.0
//

import Foundation

public enum VitaminBadgeLogic {
    private static let maxValue = 99

    // overflow displayable value
    private static var maxDisplayableValue: String {
        "\(maxValue)+"
    }

    // instance displayable value
    public static func badgeText(for value: Int?) -> String {
        value.map {
            $0 > Self.maxValue ? Self.maxDisplayableValue : "\($0)"
        } ?? ""
    }
}
