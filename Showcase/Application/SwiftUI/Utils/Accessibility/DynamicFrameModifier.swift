//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI

@available(iOS 13, *)
/// Modifier to set a frame and scale the size depending of the dynamic type value.
public struct DynamicFrameModifier: ViewModifier {
    let width: CGFloat?
    let height: CGFloat?

    public init(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.width = width
        self.height = height
    }

    public func body(content: Content) -> some View {
        content
            .frame(width: scaledValue(width),
                   height: scaledValue(height))
    }

    private func scaledValue(_ value: CGFloat?) -> CGFloat? {
        guard let unwrappedvalue = value else {
            return nil
        }
        let value = UIFontMetrics.default.scaledValue(for: unwrappedvalue)
        return value
    }
}

@available(iOS 13, *)
extension View {
    /// Set a frame and scale the size depending of the dynamic type value.
    /// - Parameters:
    ///   - width: Wanted width.
    ///   - height: Wanted height.
    /// - Returns: A `View` with the frame setted.
    public func dynamicFrame(width: CGFloat? = nil, height: CGFloat? = nil) -> some View {
        modifier(DynamicFrameModifier(width: width, height: height))
    }
}
#endif
