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
struct BorderRadiusesModifier<S: ShapeStyle>: ViewModifier {
    let radius: VitaminRadius
    let shapeStyle: S
    let lineWidth: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: radius.rawValue)
                    .stroke(shapeStyle, lineWidth: lineWidth)
            )
    }
}

@available(iOS 13, *)
struct BorderStyleRadiusesModifier<S: ShapeStyle>: ViewModifier {
    let radius: VitaminRadius
    let shapeStyle: S
    let strokeStyle: StrokeStyle

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: radius.rawValue)
                    .stroke(shapeStyle, style: strokeStyle)
            )
    }
}

@available(iOS 13, *)
extension View {
    /// Apply a corner radius to the view.
    /// - Parameters:
    ///   - radius: The radius to apply.
    ///   - antialiased: A Boolean value that indicates whether the rendering system
    ///   applies smoothing to the edges of the clipping rectangle.
    /// - Returns: Return the view.
    public func vitaminRadius(_ radius: VitaminRadius, antialiased: Bool = true) -> some View {
        modifier(RadiusesModifier(radius: radius, antialiased: antialiased))
    }

    /// Add an overlay with border and corner radius to the view.
    /// - Parameters:
    ///   - radius: The radius to apply.
    ///   - content: The color or gradient with which to stroke this border.
    ///   - lineWidth: The width of the border.
    /// - Returns: Return the view.
    public func vitaminAddBorderRadius<S: ShapeStyle>(
        _ radius: VitaminRadius,
        content: S,
        lineWidth: CGFloat
    ) -> some View {
        modifier(BorderRadiusesModifier(radius: radius,
                                        shapeStyle: content,
                                        lineWidth: lineWidth))
    }

    /// Add an overlay with border and corner radius to the view.
    /// - Parameters:
    ///   - radius: The radius to apply.
    ///   - content: The color or gradient with which to stroke this border.
    ///   - style: The stroke characteristics --- such as the line's width and
    ///     whether the stroke is dashed --- that determine how to render the border.
    /// - Returns: Return the view.
    public func vitaminAddBorderRadius<S: ShapeStyle>(
        _ radius: VitaminRadius,
        content: S,
        style: StrokeStyle
    ) -> some View {
        modifier(BorderStyleRadiusesModifier(radius: radius,
                                             shapeStyle: content,
                                             strokeStyle: style))
    }
}
