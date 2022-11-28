//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import Combine

@available(iOS 13, *)
extension View {
    /// Adds a modifier for this view that fires an action when a specific
    /// value changes. Compatible with iOS 13.
    /// - Parameters:
    ///   - value: The value to check against when determining whether
    ///     to run the closure.
    ///   - action: A closure to run when the value changes.
    /// - Returns: A view that fires an action when the specified value changes.
    @ViewBuilder
    func compatibilityOnChange<V: Equatable>(
        of value: V,
        perform action: @escaping (V) -> Void
    ) -> some View where V: Equatable {
        if #available(iOS 14.0, *) {
            self.onChange(of: value, perform: action)
        } else {
            self.onReceive(Just(value), perform: action)
        }
    }
}
#endif
