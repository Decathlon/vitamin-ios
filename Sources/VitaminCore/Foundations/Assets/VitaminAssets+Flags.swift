//
//  Vitamin iOS
//  Apache License 2.0
//

import Foundation

extension VitaminAssets {
    /// Return the country flag using the country code.
    /// - Parameter countryCode: alpha-2 country code (ISO 3166-1).
    /// - Returns: The country flag in `VitaminAsset` object.
    public static func flag(countryCode: String) -> VitaminAsset? {
        VitaminAsset(name: countryCode.uppercased())
    }
}

extension VitaminAssets.Flag {
    @available(*, deprecated, renamed: "do")
    public static let dom = VitaminAssets.Flag.do
    @available(*, deprecated, renamed: "in")
    public static let ind = VitaminAssets.Flag.in
    @available(*, deprecated, renamed: "is")
    public static let isl = VitaminAssets.Flag.is
}
