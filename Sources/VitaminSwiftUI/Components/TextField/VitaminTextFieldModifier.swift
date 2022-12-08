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
    /// Style to use for the `VitaminTextField`.
    private var style: VitaminTextFieldStyle
    /// Text to display above the text field.
    private var label: String
    /// Text to display below the text field.
    private var helperText: String?
    /// Configuration object to setup a custom icon with an action.
    private var iconConfiguration: VitaminTextField.IconConfiguration?
    /// Configuration object to setup a character limit.
    private var characterLimitConfiguration: VitaminTextField.CharacterLimitConfiguration?
    /// State to use for the `VitaminTextField`.
    @Binding private var state: VitaminTextFieldState

    // Internal states
    /// Represent the text inside the text field if we want to have a charater limit.
    @Binding private var text: String
    /// Text to display the character count next to the helper text if we want to have a charater limit.
    @State private var counterText: String?
    /// Value for the icon size. Thansk to `@ScaledValue` the value auto scale with Dynamic Type value.
    @ScaledValue private var iconSize: CGFloat = 20
    /// Default padding to use.
    private var commonPadding: CGFloat {
        if style == .outlined {
            return 8
        } else {
            return 6
        }
    }
    /// Leading padding for the text field.
    private var textLeadingPadding: CGFloat {
        if style == .outlined {
            return 12
        } else {
            return 0
        }
    }
    /// Trailing padding for the text field.
    private var textTrailingPadding: CGFloat {
        commonPadding * 2 + iconSize
    }

    /// Modifier to apply the Vitamin TextField style to a `TextField`.
    /// - Parameters:
    ///   - style: The `VitaminTextFieldStyle` that we want to use for the text field. Default: `.outlined`.
    ///   - label: Text to display above the `TextField`.
    ///   - helperText: Text to display below the `TextField`. Optional. Default: `nil`.
    ///   - state: State to apply.
    ///   - icon: Icon configuration to display a custom icon and to handle an action on the icon. Optional. Default: `nil`.
    ///   - characterLimit: Character limit configuration to add a maximum number of characters. Optional. Default: `nil`.
    public init(
        style: VitaminTextFieldStyle = .outlined,
        label: String,
        helperText: String? = nil,
        state: Binding<VitaminTextFieldState>,
        icon: VitaminTextField.IconConfiguration? = nil,
        characterLimit: VitaminTextField.CharacterLimitConfiguration? = nil
    ) {
        self.style = style
        self.label = label
        self.helperText = helperText
        self._state = state
        self.iconConfiguration = icon
        self.characterLimitConfiguration = characterLimit
        self._text = characterLimitConfiguration?.text ?? Binding.constant("")
    }

    /// Main function for `SwiftUI` modifier.
    public func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            makeLabelView()
            ZStack {
                makeTextFieldView(content)
                makeIconView()
            }
            makeUnderTextView()
        }
        .disabled(state == .disabled)
    }

    /// Create the label view for the text on the top of the textfield.
    /// - Returns: The label view.
    private func makeLabelView() -> some View {
        Text(label)
            .vitaminTextStyle(.callout)
            .foregroundColor(state.labelColor(style: style).swiftUIColor)
    }

    @ViewBuilder
    /// Create the icon view to display on the right of the text field if needed.
    /// - Returns: The icon view.
    private func makeIconView() -> some View {
        if let icon = state.icon?.swiftUIImage ?? iconConfiguration?.icon {
            makeImageView(image: icon,
                          foregroundColor: state.iconColor.swiftUIColor)
        }
    }

    /// Create an image view with a button and aligned to the right.
    /// - Parameters:
    ///   - image: The image that we want to use.
    ///   - foregroundColor: The color to apply to the image.
    /// - Returns: The image view.
    private func makeImageView(
        image: Image,
        foregroundColor: Color
    ) -> some View {
        HStack {
            Spacer()
            Button {
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

    /// Add all the needed modifiers to the provided view.
    /// - Parameter content: A `TextField` or `SecureField` that we want to display as `VitaminTextField`.
    /// - Returns: The fian lview.
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
    /// Returns the overlay to use depending of the current style.
    /// - Returns: The view to use as overlay for the `VitaminTestFieldStyle`.
    private func makeStyleOverlay() -> some View {
        switch style {
        case .filled:
            makeFilledStyleOverlay()
        case .outlined:
            makeOutlineStyleOverlay()
        }
    }

    /// Create the overlay for the filled style.
    /// - Returns: The view to use as overlay.
    private func makeFilledStyleOverlay() -> some View {
        VStack {
            Spacer()
            Rectangle()
                .foregroundColor(state.borderColor.swiftUIColor)
                .frame(height: state.borderWidth)
        }
    }

    /// Create the overlay for the outlined style.
    /// - Returns: The view to use as overlay.
    private func makeOutlineStyleOverlay() -> some View {
        RoundedRectangle(cornerRadius: 4)
            .strokeBorder(state.borderColor.swiftUIColor,
                          lineWidth: state.borderWidth)
    }

    /// Create the view below the text field, with the helper text and the characters counter.
    /// - Returns: The view with the two texts.
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

    /// Returns the characters counter text string.
    /// - Parameter text: The current text.
    /// - Returns: A string with the current number of characters and the maximum number of characters.
    /// - Note: Returns nil if there is not character limit.
    private func makeCharactersCounterText(_ text: String) -> String? {
        guard let characterLimit = characterLimitConfiguration?.limit else {
            return nil
        }

        return "\(text.count)/\(characterLimit)"
    }

    /// Truncate the text with the configured character limit configuration object.
    /// - Parameter text: The current text inside the text field.
    /// - Returns: The truncated string.
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
    ///   - style: The `VitaminTextFieldStyle` that we want to use for the text field. Default: `.outlined`.
    ///   - label: Text to display above the `TextField`.
    ///   - helperText: Text to display below the `TextField`. Optional. Default: `nil`.
    ///   - state: State to apply.
    ///   - icon: Icon configuration to display a custom icon and to handle an action on the icon. Default: `nil`.
    ///   - characterLimit: Character limit configuration to add a maximum number of characters. Default: `nil`.
    /// - Returns: A `View` with the Vitamin style applied.
    public func vitaminTextFieldStyle(
        style: VitaminTextFieldStyle = .outlined,
        label: String,
        helperText: String? = nil,
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
    ///   - style: The `VitaminTextFieldStyle` that we want to use for the text field. Default: `.outlined`.
    ///   - label: Text to display above the `TextField`.
    ///   - helperText: Text to display below the `TextField`. Optional. Default: `nil`.
    ///   - state: State to apply.
    ///   - icon: Icon configuration to display a custom icon and to handle an action on the icon. Default: `nil`.
    ///   - characterLimit: Character limit configuration to add a maximum number of characters. Default: `nil`.
    /// - Returns: A `View` with the Vitamin style applied.
    public func vitaminTextFieldStyle(
        style: VitaminTextFieldStyle = .outlined,
        label: String,
        helperText: String? = nil,
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
