//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore
import Combine

@available(iOS 13, *)
/// Modifier to apply the Vitamin TextField UI to a TextField.
public struct VitaminTextFieldModifier: ViewModifier {
    private var style: VitaminTextFieldStyle
    private var label: String
    private var helperText: String?
    private var iconConfiguration: VitaminTextField.IconConfiguration?
    private var characterLimitConfiguration: VitaminTextField.CharacterLimitConfiguration?
    @Binding private var state: VitaminTextFieldState
    @Binding private var text: String

    // Internal states
    @State private var counterText: String?
    @ScaledValue private var iconSize: CGFloat = 20
    private var commonPadding: CGFloat = 8
    private var textLeadingPadding: CGFloat {
        if style == .outlined {
            return 12
        } else {
            return 0
        }
    }
    private var textTrailingPadding: CGFloat {
        commonPadding * 2 + iconSize
    }

    /// Modifier to apply the Vitamin TextField style to a `TextField`.
    /// - Parameters:
    ///   - style: The `VitaminTextFieldStyle` that we want to use for the text field.
    ///   - label: Text to display above the `TextField`.
    ///   - helperText: Text to display below the `TextField`.
    ///   - state: State to apply.
    ///   - icon: Icon configuration to display a custom icon and to handle an action on the icon.
    ///   - characterLimit: Character limit configuration to add a maximum number of characters.
    public init(
        style: VitaminTextFieldStyle,
        label: String,
        helperText: String?,
        state: Binding<VitaminTextFieldState>,
        icon: VitaminTextField.IconConfiguration?,
        characterLimit: VitaminTextField.CharacterLimitConfiguration?
    ) {
        self.style = style
        self.label = label
        self.helperText = helperText
        self._state = state
        self.iconConfiguration = icon
        self.characterLimitConfiguration = characterLimit
        self._text = characterLimitConfiguration?.text ?? Binding.constant("")
    }

    public func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            makeLabelView()
            ZStack {
                makeTextFieldView(content)
                makeIconView()
            }
            makeUnderTextView()
        }
        .padding()
    }

    private func makeLabelView() -> some View {
        Text(label)
            .vitaminTextStyle(.callout)
            .foregroundColor(state.labelColor(style: style).swiftUIColor)
    }

    @ViewBuilder
    private func makeIconView() -> some View {
        if let icon = state.icon?.swiftUIImage ?? iconConfiguration?.icon {
            makeImageView(image: icon,
                          foregroundColor: state.iconColor.swiftUIColor)
        }
    }

    private func makeImageView(
        image: Image,
        foregroundColor: Color
    ) -> some View {
        HStack {
            Spacer()
            Button {
                // If the icon action do update the text field UI, we could have a crash.
                // To prevent this crash we force resign first responder.
                UIApplication.shared.forceResignFirstResponder()
                iconConfiguration?.action?()
            } label: {
                image
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(foregroundColor)
                    .frame(width: iconSize, height: iconSize)
                    .padding(commonPadding)
                    .padding(.trailing, state.borderWidth)
            }
        }
    }

    private func makeTextFieldView(_ content: Content) -> some View {
        content
            .font(VitaminTextStyle.body.scaledFont.swiftUIFont)
            .onReceive(Just(text)) { newValue in
                text = truncateIfLimit(text: newValue)
                counterText = makeCharactersCounterText(newValue)
            }
            .contentShape(Rectangle())
            .padding(EdgeInsets(top: commonPadding,
                                leading: textLeadingPadding,
                                bottom: commonPadding,
                                trailing: textTrailingPadding))
            .overlay(makeStyleOverlay())
    }

    @ViewBuilder
    private func makeStyleOverlay() -> some View {
        switch style {
        case .filled:
            makeFilledStyleOverlay()
        case .outlined:
            makeOutlineStyleOverlay()
        }
    }

    private func makeFilledStyleOverlay() -> some View {
        VStack {
            Spacer()
            Rectangle()
                .foregroundColor(state.borderColor.swiftUIColor)
                .frame(height: state.borderWidth)
        }
    }

    private func makeOutlineStyleOverlay() -> some View {
        RoundedRectangle(cornerRadius: 4)
            .strokeBorder(state.borderColor.swiftUIColor,
                          lineWidth: state.borderWidth)
    }

    private func makeUnderTextView() -> some View {
        HStack {
            if let text = helperText {
                Text(text)
                    .vitaminTextStyle(.caption1)
            }
            Spacer()
            if let characterCounter = counterText {
                Text(characterCounter)
                    .vitaminTextStyle(.caption1)
            }
        }
        .foregroundColor(state.helperAndCounterColor.swiftUIColor)
    }

    private func makeCharactersCounterText(_ text: String) -> String? {
        guard let characterLimit = characterLimitConfiguration?.limit else {
            return nil
        }

        return "\(text.count)/\(characterLimit)"
    }

    private func truncateIfLimit(text: String) -> String {
        guard let characterLimit = characterLimitConfiguration?.limit else {
            return text
        }

        if text.count >= characterLimit {
            return String(text.prefix(characterLimit))
        } else {
            return text
        }
    }
}

// MARK: Public modifier

@available(iOS 13, *)
extension TextField {
    /// Apply the Vitamin TextField style to a `TextField`.
    /// - Parameters:
    ///   - style: The `VitaminTextFieldStyle` that we want to use for the text field. Default: .filled.
    ///   - label: Text to display above the `TextField`.
    ///   - helperText: Text to display below the `TextField`.
    ///   - state: State to apply.
    ///   - icon: Icon configuration to display a custom icon and to handle an action on the icon.
    ///   - characterLimit: Character limit configuration to add a maximum number of characters.
    /// - Returns: A `View` with the Vitamin style applied.
    public func vitaminTextFieldStyle(
        style: VitaminTextFieldStyle = .filled,
        label: String,
        helperText: String,
        state: Binding<VitaminTextFieldState>,
        icon: VitaminTextField.IconConfiguration? = nil,
        characterLimit: VitaminTextField.CharacterLimitConfiguration? = nil
    ) -> some View {
        modifier(VitaminTextFieldModifier(style: style,
                                          label: label,
                                          helperText: helperText,
                                          state: state,
                                          icon: icon,
                                          characterLimit: characterLimit))
    }
}

@available(iOS 13, *)
extension SecureField {
    /// Apply the Vitamin TextField style to a `SecureField`.
    /// - Parameters:
    ///   - style: The `VitaminTextFieldStyle` that we want to use for the text field. Default: .filled.
    ///   - label: Text to display above the `TextField`.
    ///   - helperText: Text to display below the `TextField`.
    ///   - state: State to apply.
    ///   - icon: Icon configuration to display a custom icon and to handle an action on the icon.
    ///   - characterLimit: Character limit configuration to add a maximum number of characters.
    /// - Returns: A `View` with the Vitamin style applied.
    public func vitaminTextFieldStyle(
        style: VitaminTextFieldStyle = .filled,
        label: String,
        helperText: String,
        state: Binding<VitaminTextFieldState>,
        icon: VitaminTextField.IconConfiguration? = nil,
        characterLimit: VitaminTextField.CharacterLimitConfiguration? = nil
    ) -> some View {
        modifier(VitaminTextFieldModifier(style: style,
                                          label: label,
                                          helperText: helperText,
                                          state: state,
                                          icon: icon,
                                          characterLimit: characterLimit))
    }
}
#endif
