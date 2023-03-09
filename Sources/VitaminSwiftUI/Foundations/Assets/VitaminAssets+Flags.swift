//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
extension VitaminAssets {
    /// Return the country flag using the country code.
    /// - Parameter countryCode: alpha-2 country code (ISO 3166-1).
    /// - Returns: The country flag in `VitaminAsset` object.
    public static func flag(countryCode: String) -> VitaminAsset? {
        let asset = VitaminAssets.flagAsset(countryCode: countryCode)
        guard asset?.optionalImage != nil else {
            return nil
        }
        return asset
    }
}
#endif
