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

    public init(
        label: String,
        placeholder: String,
        helperText: String,
        text: Binding<String>,
        state: Binding<VitaminTextFieldState>,
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
    }

    public var body: some View {
        TextField(placeholder, text: $text) { editing in
            state = VitaminTextField.updateEditingState(state: state, editing: editing)
        }
        .vitaminTextFieldStyle(label: state.rawValue.capitalized,
                               helperText: helperText,
                               state: $state,
                               characterLimit: .init(text: $text, limit: 10))
    }

    // TODO: Documentation
    public static func updateEditingState(
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
