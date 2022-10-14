//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI

@available(iOS 13, *)
extension Shape {
    /// Fill and add a border.
    /// - Parameters:
    ///   - fillStyle: Fill color.
    ///   - strokeStyle: Stroke color.
    ///   - lineWidth: Border line width.
    /// - Returns: The modified view
    public func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(
        _ fillStyle: Fill,
        strokeBorder strokeStyle: Stroke,
        lineWidth: CGFloat = 1
    ) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}
#endif
