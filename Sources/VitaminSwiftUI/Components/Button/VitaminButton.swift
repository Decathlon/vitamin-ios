//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
public struct VitaminButton: View {
    var text: String = ""
    let style: VitaminButtonStyle
    let size: VitaminButtonSize
    let iconType: VitaminButtonIconType
    let action: () -> Void

    public init(
        text: String = "",
        style: VitaminButtonStyle = .primary,
        size: VitaminButtonSize = .medium,
        iconType: VitaminButtonIconType = .none,
        action: @escaping () -> Void
    ) {
            self.text = text
            self.style = style
            self.size = size
            self.iconType = iconType
            self.action = action
    }

    public var body: some View {
        Button {
            self.action()
        } label: {
                makeLabel(text: text, iconType: iconType)
        }
        .buttonStyle(VitaminButtonUIStyle(style: style, size: size, iconType: iconType))
    }

    private func makeLabel(text: String, iconType: VitaminButtonIconType) -> some View {
        let defaultIconSize = size.defaultIconSize(iconType: iconType)

        switch iconType {
        case let .trailing(image, renderingMode):
            return AnyView(HStack {
                Text(text).vitaminTextStyle(size.textStyle)
                image.swiftUIImage
                    .renderingMode(renderingMode?.swiftUIRenderingMode)
                    .resizable()
                    .foregroundColor(style.foregroundColor.swiftUIColor)
                    .frame(
                        width: defaultIconSize,
                        height: defaultIconSize,
                        alignment: .center
                    )
            })
        case let .leading(image, renderingMode):
            return AnyView(HStack {
                image.swiftUIImage
                    .renderingMode(renderingMode?.swiftUIRenderingMode)
                    .resizable()
                    .foregroundColor(style.foregroundColor.swiftUIColor)
                    .frame(
                        width: defaultIconSize,
                        height: defaultIconSize,
                        alignment: .center
                    )
                Text(text).vitaminTextStyle(size.textStyle)
            })
        case let .alone(image, renderingMode):
            return AnyView(
                image.swiftUIImage
                    .renderingMode(renderingMode?.swiftUIRenderingMode)
                    .resizable()
                    .foregroundColor(style.foregroundColor.swiftUIColor)
                    .frame(
                        width: defaultIconSize,
                        height: defaultIconSize,
                        alignment: .center
                    )
            )
        case .none:
            return AnyView(Text(text).vitaminTextStyle(size.textStyle))
        }
    }
}

@available(iOS 13, *)
public struct VitaminButtonUIStyle: ButtonStyle {
    let style: VitaminButtonStyle
    let size: VitaminButtonSize
    let iconType: VitaminButtonIconType
    @Environment(\.isEnabled) private var isEnabled

    public init(
        style: VitaminButtonStyle = .primary,
        size: VitaminButtonSize = .medium,
        iconType: VitaminButtonIconType = .none
    ) {
        self.style = style
        self.size = size
        self.iconType = iconType
    }

    public func makeBody(configuration: Configuration) -> some View {
        let state: UIControl.State = convertToUIControlState(configuration: configuration)

        configuration
            .label
            .padding(EdgeInsets(
                top: size.verticalInset(iconType: self.iconType),
                leading: size.horizontalInset(iconType: self.iconType),
                bottom: size.verticalInset(iconType: self.iconType),
                trailing: size.horizontalInset(iconType: self.iconType)))
            .background(RoundedRectangle(
                cornerRadius: 5,
                style: .continuous)
                .strokeBorder(style.borderColor(for: state).swiftUIColor, lineWidth: 2)
                .background(RoundedRectangle(
                    cornerRadius: 5,
                    style: .continuous)
                    .fill(style.backgroundColor(for: state).swiftUIColor))
                )
            .opacity(style.opacity(for: state))
            .foregroundColor(style.foregroundColor.swiftUIColor)
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
#endif
