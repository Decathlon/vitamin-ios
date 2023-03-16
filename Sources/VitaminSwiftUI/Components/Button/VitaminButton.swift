//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
public struct VitaminButton: View {
    var text: String?
    let style: VitaminButtonStyle
    let size: VitaminButtonSize
    let fullWidth: Bool
    let iconType: IconType
    let action: () -> Void

    public init(
        text: String? = nil,
        style: VitaminButtonStyle = .primary,
        size: VitaminButtonSize = .medium,
        fullWidth: Bool = false,
        iconType: IconType = .none,
        action: @escaping () -> Void
    ) {
            self.text = text
            self.style = style
            self.size = size
            self.fullWidth = fullWidth
            self.iconType = iconType
            self.action = action
    }

    public var body: some View {
        Button {
            self.action()
        } label: {
            makeLabel()
        }
        .buttonStyle(VitaminButtonUIStyle(style: style,
                                          size: size,
                                          fullWidth: fullWidth,
                                          iconType: iconType.underlyingUIKitIconType))
    }

    @ViewBuilder
    private func makeLabel() -> some View {
        switch iconType {
        case let .trailing(image, renderingMode):
            makeTrailingIconButtonLabel(image: image, renderingMode: renderingMode)
        case let .leading(image, renderingMode):
            makeLeadingIconButtonLabel(image: image, renderingMode: renderingMode)
        case let .alone(image, renderingMode):
            makeIcon(image: image, renderingMode: renderingMode)
        case .none:
            if let text = text {
                makeButtonText(text: text)
            }
        }
    }

    @ViewBuilder
    private func makeIcon(image: UIImage, renderingMode: Image.TemplateRenderingMode) -> some View {
        let defaultIconSize = size.defaultIconSize(iconType: iconType.underlyingUIKitIconType)

        image.swiftUIImage
                .renderingMode(renderingMode)
                .resizable()
                .foregroundColor(style.foregroundColor.swiftUIColor)
                .frame(
                    width: defaultIconSize,
                    height: defaultIconSize
                )
                .padding(iconType.underlyingUIKitIconType.imageEdgeInsets.swiftUIEdgeInsets)
    }

    private func makeButtonText(text: String) -> some View {
        Text(text).vitaminTextStyle(size.textStyle)
    }

    @ViewBuilder
    private func makeTrailingIconButtonLabel(image: UIImage, renderingMode: Image.TemplateRenderingMode) -> some View {
        if let text = text {
            HStack(spacing: 0) {
                makeButtonText(text: text)
                makeIcon(image: image, renderingMode: renderingMode)
            }
        } else {
            makeIcon(image: image, renderingMode: renderingMode)
        }
    }

    @ViewBuilder
    private func makeLeadingIconButtonLabel(image: UIImage, renderingMode: Image.TemplateRenderingMode) -> some View {
        if let text = text {
            HStack(spacing: 0) {
                makeIcon(image: image, renderingMode: renderingMode)
                makeButtonText(text: text)
            }
        } else {
            makeIcon(image: image, renderingMode: renderingMode)
        }
    }
}

@available(iOS 13, *)
public struct VitaminButtonUIStyle: ButtonStyle {
    let style: VitaminButtonStyle
    let size: VitaminButtonSize
    let fullWidth: Bool
    let iconType: VitaminButtonIconType
    @Environment(\.isEnabled) private var isEnabled

    public init(
        style: VitaminButtonStyle = .primary,
        size: VitaminButtonSize = .medium,
        fullWidth: Bool = false,
        iconType: VitaminButtonIconType = .none
    ) {
        self.style = style
        self.size = size
        self.fullWidth = fullWidth
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
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .background(RoundedRectangle(
                cornerRadius: size.cornerRadius,
                style: .continuous)
                .strokeBorder(style.borderColor(for: state).swiftUIColor, lineWidth: size.bordeWith)
                .background(RoundedRectangle(
                    cornerRadius: size.cornerRadius,
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

@available(iOS 13, *)
extension VitaminButton {
    public enum IconType {
        case leading(image: UIImage, renderingMode: Image.TemplateRenderingMode)
        case trailing(image: UIImage, renderingMode: Image.TemplateRenderingMode)
        case alone(image: UIImage, renderingMode: Image.TemplateRenderingMode)
        case none
    }
}

@available(iOS 13, *)
extension VitaminButton.IconType {
    var underlyingUIKitIconType: VitaminButtonIconType {
        switch self {
        case let .trailing(image, renderingmode):
            return VitaminButtonIconType.trailing(image: image, renderingMode: renderingmode.uiRenderingMode)
        case let .leading(image, renderingmode):
            return VitaminButtonIconType.leading(image: image, renderingMode: renderingmode.uiRenderingMode)
        case let .alone(image, renderingmode):
            return VitaminButtonIconType.alone(image: image, renderingMode: renderingmode.uiRenderingMode)
        case .none:
            return VitaminButtonIconType.none
        }
    }
}
#endif
