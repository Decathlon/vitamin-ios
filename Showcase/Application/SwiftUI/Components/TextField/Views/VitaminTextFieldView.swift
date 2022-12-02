//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminSwiftUI
import VitaminCore
import Combine

@available(iOS 13, *)
struct VitaminTextFieldView: View {
    @State private var text = ""
    var style: VitaminTextFieldStyle
    @State var state: VitaminTextFieldState = .standard
    @State var helperText = "Helper text"
    @Binding var isSecure: Bool
    var showIcon = false
    var characterLimit: Int = 0
    @State var icon: Image
    var isDynamic = false

    init(
        style: VitaminTextFieldStyle,
        state: VitaminTextFieldState,
        isSecure: Binding<Bool> = .constant(false),
        showIcon: Bool = false,
        characterLimit: Int,
        icon: Image,
        isDynamic: Bool = false
    ) {
        self.text = ""
        self.style = style
        self.state = state
        self.helperText = "Helper text"
        self._isSecure = isSecure
        self.showIcon = showIcon
        self.characterLimit = characterLimit
        self.icon = icon
        self.isDynamic = isDynamic
    }

    var body: some View {
        VitaminTextField(style: style,
                         text: makeTextConfiguration(),
                         state: $state,
                         icon: makeIconConfiguration(),
                         characterLimit: makeCharacterLimitConfiguration())
        .compatibilityOnChange(of: text, perform: handleChanges(newValue:))
    }
}

@available(iOS 13, *)
extension VitaminTextFieldView {
    private func makeTextConfiguration() -> VitaminTextField.TextConfiguration {
        VitaminTextField.TextConfiguration(label: state.rawValue.capitalized,
                                           placeholder: "Placeholder",
                                           helperText: helperText,
                                           text: $text,
                                           isSecure: $isSecure)
    }

    private func makeIconConfiguration() -> VitaminTextField.IconConfiguration? {
        guard showIcon else {
            return nil
        }

        return VitaminTextField.IconConfiguration(icon: icon) {
            isSecure.toggle()
        }
    }

    private func makeCharacterLimitConfiguration() -> VitaminTextField.CharacterLimitConfiguration? {
        guard characterLimit > 0 else {
            return nil
        }

        return VitaminTextField.CharacterLimitConfiguration(text: $text, limit: characterLimit)
    }

    private func handleChanges(newValue: String) {
        guard isDynamic else {
            return
        }

        if !newValue.isEmpty {
            let isSuccess = newValue == "OK"
            if isSuccess {
                state = .success
                helperText = "Perfect ✅"
            } else {
                state = .error
                helperText = "You need to enter 'OK'"
            }
        } else {
            state = .active
            helperText = ""
        }
    }
}

#endif
