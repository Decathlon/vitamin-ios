//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
public struct VitaminTextField: View {
    private var label: String
    private var placeholder: String
    private var helperText: String
    private var iconConfiguration: VitaminTextField.IconConfiguration?
    private var characterLimitConfiguration: VitaminTextField.CharacterLimitConfiguration?
    @Binding private var state: VitaminTextFieldState
    @Binding private var text: String
    @Binding private var isSecure: Bool

    /// Initialize a `VitaminTextField`.
    /// - Parameters:
    ///   - label: Text to display above the `TextField`.
    ///   - helperText: Text to display below the `TextField`.
    ///   - state: State to apply.
    ///   - isSecure: If we should display a `SecureField` instead. Default: `false`.
    ///   - icon: Icon configuration to display a custom icon and to handle an action on the icon. Default: `nil`.
    ///   - characterLimit: Character limit configuration to add a maximum number of characters. Default: `nil`.
    /// - Returns: A `View` with the Vitamin style applied.
    /// - Note: The active state is not working when the secure option is activated.
    public init(
        label: String,
        placeholder: String,
        helperText: String,
        text: Binding<String>,
        state: Binding<VitaminTextFieldState>,
        isSecure: Binding<Bool> = Binding.constant(false),
        icon: VitaminTextField.IconConfiguration? = nil,
        characterLimit: VitaminTextField.CharacterLimitConfiguration? = nil
    ) {
        self.label = label
        self.placeholder = placeholder
        self.helperText = helperText
        self.iconConfiguration = icon
        self.characterLimitConfiguration = characterLimit
        self._state = state
        self._text = text
        self._isSecure = isSecure
    }

    public var body: some View {
        if isSecure {
            makeSecureField()
        } else {
            makeTextField()
        }
    }

    private func makeTextField() -> some View {
        TextField(placeholder, text: $text) { editing in
            state = VitaminTextField.updateActiveState(state: state, editing: editing)
        }
        .vitaminTextFieldStyle(label: state.rawValue.capitalized,
                               helperText: helperText,
                               state: $state,
                               icon: iconConfiguration,
                               characterLimit: characterLimitConfiguration)
    }

    private func makeSecureField() -> some View {
        SecureField(placeholder, text: $text)
            .vitaminTextFieldStyle(label: state.rawValue.capitalized,
                                   helperText: helperText,
                                   state: $state,
                                   icon: iconConfiguration,
                                   characterLimit: characterLimitConfiguration)
    }
}

@available(iOS 13, *)
extension VitaminTextField {
    /// Calculate the correct state to use if you want to have the active state
    /// when you edit the text field.
    /// - Parameters:
    ///   - state: The current state of the text field.
    ///   - editing: If the text field is in editing mode.
    /// - Returns: The new state to use.
    public static func updateActiveState(
        state: VitaminTextFieldState,
        editing: Bool
    ) -> VitaminTextFieldState {
        if editing {
            if state == .standard {
                return .active
            }
        } else if state == .active {
            return .standard
        }
        return state
    }
}

@available(iOS 13, *)
struct VitaminTextField_Previews: PreviewProvider {
    static var previews: some View {
        VitaminTextField(label: "Montant",
                         placeholder: "Insérer un montant",
                         helperText: "Veuillez insérer un montant exact",
                         text: Binding.constant(""),
                         state: Binding.constant(.error),
                         icon: .init(icon: Image(systemName: "calendar")),
                         characterLimit: .init(text: Binding.constant(""), limit: 10))
    }
}

#endif
