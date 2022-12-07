//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
public struct VitaminTextField: View {
    /// Style to use for the `VitaminTextField`.
    private var style: VitaminTextFieldStyle
    /// Text to display above the text field.
    private var label: String
    /// Text to display inside the text field.
    private var placeholder: String
    /// Text to display below the text field.
    private var helperText: String?
    /// Configuration object to setup a custom icon with an action.
    private var iconConfiguration: VitaminTextField.IconConfiguration?
    /// Configuration object to setup a character limit.
    private var characterLimitConfiguration: VitaminTextField.CharacterLimitConfiguration?
    /// State to use for the `VitaminTextField`.
    @Binding private var state: VitaminTextFieldState
    /// Text inside the text field.
    @Binding private var text: String

    /// Initialize a `VitaminTextField`.
    /// - Parameters:
    ///   - style: The `VitaminTextFieldStyle` that we want to use for the text field.
    ///   - text: Text configuration for text related content.
    ///   - state: State to apply.
    ///   - icon: Icon configuration to display a custom icon and to handle an action on the icon. Default: `nil`.
    ///   - characterLimit: Character limit configuration to add a maximum number of characters. Default: `nil`.
    /// - Returns: A `View` with the Vitamin style applied.
    public init(
        style: VitaminTextFieldStyle = .filled,
        text: TextConfiguration,
        state: Binding<VitaminTextFieldState>,
        icon: VitaminTextField.IconConfiguration? = nil,
        characterLimit: VitaminTextField.CharacterLimitConfiguration? = nil
    ) {
        self.style = style
        self.label = text.label
        self.placeholder = text.placeholder
        self.helperText = text.helperText
        self.iconConfiguration = icon
        self.characterLimitConfiguration = characterLimit
        self._state = state
        self._text = text.text
    }

    /// Main variable for `SwiftUI` view.
    public var body: some View {
        makeTextField()
    }

    /// Create a `TextField` with the `VitaminTextFieldStyle`.
    /// - Returns: The `TextField` with the `VitaminTextFieldStyle`.
    private func makeTextField() -> some View {
        TextField(placeholder, text: $text) { editing in
            state = VitaminTextField.updateActiveState(state: state, editing: editing)
        }
        .vitaminTextFieldStyle(style: style,
                               label: state.rawValue.capitalized,
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
        VitaminTextField(style: .filled,
                         text: .init(label: "Montant",
                                     placeholder: "Insérer un montant",
                                     helperText: "Veuillez insérer un montant exact",
                                     text: Binding.constant("")),
                         state: Binding.constant(.error),
                         icon: .init(icon: Image(systemName: "calendar")),
                         characterLimit: .init(text: Binding.constant(""), limit: 10))
    }
}

#endif
