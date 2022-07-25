//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCore

@available(iOS 13, *)
public struct VitaminButton: View {
    var text: String = ""
    var style: VitaminButtonStyle
    var size: VitaminButtonSize

    public init(text: String = "", style: VitaminButtonStyle = .primary, size: VitaminButtonSize = .medium) {
        self.text = text
        self.style = style
        self.size = size
    }

    public var body: some View {
        Button(text) {}
            .buttonStyle(VitaminButtonUIStyle(style: style, size: size))
    }
}

@available(iOS 13, *)
public struct VitaminButtonUIStyle: ButtonStyle {
    let style: VitaminButtonStyle
    let size: VitaminButtonSize
    @Environment(\.isEnabled) private var isEnabled

    public init(style: VitaminButtonStyle = .primary, size: VitaminButtonSize = .medium) {
        self.style = style
        self.size = size
    }

    public func makeBody(configuration: Configuration) -> some View {
        let state: UIControl.State = convertToUIControlState(configuration: configuration)

        configuration
            .label
            .padding(EdgeInsets(
                top: size.verticalInset(iconType: .none),
                leading: size.horizontalInset(iconType: .none),
                bottom: size.verticalInset(iconType: .none),
                trailing: size.horizontalInset(iconType: .none)))
            .foregroundColor(style.foregroundColor.swiftUIColor)
            .background(RoundedRectangle(
                cornerRadius: VitaminRadius.radius100.rawValue,
                style: .continuous)
                .fill(style.backgroundColor(for: state).swiftUIColor))
            .border(style.borderColor(for: state).swiftUIColor, width: 1)
            .contentShape(Rectangle())
    }

    private func convertToUIControlState(configuration: Configuration) -> UIControl.State {
        if !isEnabled {
            return .disabled
        } else if configuration.isPressed {
            return .highlighted
        }
        return .normal
    }
}
