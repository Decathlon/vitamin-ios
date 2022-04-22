//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCommon

@available(iOS 13, *)
struct RadiusesModifier: ViewModifier {
    let radius: VitaminRadius
    let antialiased: Bool

    func body(content: Content) -> some View {
        content
            .cornerRadius(radius.rawValue, antialiased: antialiased)
    }
}

@available(iOS 13, *)
extension View {
    public func vitaminRadius(_ radius: VitaminRadius, antialiased: Bool = true) -> some View {
        modifier(RadiusesModifier(radius: radius, antialiased: antialiased))
    }
}
