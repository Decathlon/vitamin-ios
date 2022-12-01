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
    private var label: String
    private var helperText: String?
    private var iconConfiguration: VitaminTextField.IconConfiguration?
    private var characterLimitConfiguration: VitaminTextField.CharacterLimitConfiguration?
    @Binding private var state: VitaminTextFieldState
    @Binding private var text: String
    @State private var counterText: String?

    // TODO: Documentation
    public init(
        label: String,
        helperText: String?,
        state: Binding<VitaminTextFieldState>,
        icon: VitaminTextField.IconConfiguration?,
        characterLimit: VitaminTextField.CharacterLimitConfiguration?
    ) {
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
            .foregroundColor(state.textColor.swiftUIColor)
    }

    @ViewBuilder
    private func makeIconView() -> some View {
        if let stateIcon = state.icon?.swiftUIImage {
            makeImageView(image: stateIcon,
                          foregroundColor: state.standardIconColor.swiftUIColor)
        } else if let icon = iconConfiguration?.icon {
            makeImageView(image: icon,
                          foregroundColor: state.customIconColor.swiftUIColor)
        }
    }

    private func makeImageView(
        image: Image,
        foregroundColor: Color
    ) -> some View {
        HStack {
            Spacer()
            image
                .renderingMode(.template)
                .resizable()
                .foregroundColor(foregroundColor)
                .frame(width: 20, height: 20)
                .padding(8)
        }
    }

    private func makeTextFieldView(_ content: Content) -> some View {
        content
            .font(VitaminTextStyle.body.font.swiftUIFont)
            .onReceive(Just(text)) { newValue in
                text = truncateIfLimit(text: newValue)
                counterText = makeCharactersCounterText(newValue)
            }
            .contentShape(Rectangle())
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 36))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .strokeBorder(state.borderColor.swiftUIColor,
                                  lineWidth: state.borderWidth)
            )
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
    // TODO: Docs
    /// Apply the Vitamin TextField style to a `TextField`.
    /// - Parameters:
    ///   - todo: Wanted width.
    ///   - height: Wanted height.
    /// - Returns: A `View` with the frame setted.
    public func vitaminTextFieldStyle(
        label: String,
        helperText: String,
        state: Binding<VitaminTextFieldState>,
        icon: VitaminTextField.IconConfiguration? = nil,
        characterLimit: VitaminTextField.CharacterLimitConfiguration? = nil
    ) -> some View {
        modifier(VitaminTextFieldModifier(label: label,
                                          helperText: helperText,
                                          state: state,
                                          icon: icon,
                                          characterLimit: characterLimit))
    }
}
#endif
