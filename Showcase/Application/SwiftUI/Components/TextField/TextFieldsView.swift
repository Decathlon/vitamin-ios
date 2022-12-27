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
struct TextFieldsView: View {
    @State var text = ""
    @State var state: VitaminTextFieldState = .standard
    @State var helperText: String = ""
    @State var isSecure = true

    var body: some View {
        VStack {
            Form {
                makeTextField()
                makeTextFieldWithModifier()
                makeTextFieldIcon()
            }
        }
        .frame(maxWidth: .infinity)
        .customNavigationTitle("TextField", displayMode: .inline)
    }
}

@available(iOS 13, *)
extension TextFieldsView {
    func makeTextField() -> some View {
        VitaminTextField(style: .filled,
                         text: .init(label: state.rawValue.capitalized,
                                     placeholder: "Placeholder",
                                     helperText: helperText,
                                     text: $text,
                                     isSecure: $isSecure),
                         state: $state,
                         icon: nil,
                         characterLimit: .init(text: $text, limit: 100))
        .compatibilityOnChange(of: text, perform: handleChanges(newValue:))
    }

    func makeTextFieldWithModifier() -> some View {
        TextField("Placeholder", text: $text) { editing in
            state = VitaminTextField.updateActiveState(state: state, editing: editing)
        }
        .vitaminTextFieldStyle(style: .outlined,
                               label: state.rawValue.capitalized,
                               helperText: helperText,
                               state: $state,
                               icon: nil,
                               characterLimit: .init(text: $text, limit: 100))
        .compatibilityOnChange(of: text, perform: handleChanges(newValue:))
    }

    func makeTextFieldIcon() -> some View {
        VitaminTextField(style: .filled,
                         text: .init(label: state.rawValue.capitalized,
                                     placeholder: "Placeholder",
                                     helperText: helperText,
                                     text: $text,
                                     isSecure: $isSecure),
                         state: $state,
                         icon: makeIconConfiguration())
    }

    private func updateEditingState(editing: Bool) {
        if editing {
            if state == .standard {
                state = .active
            }
        } else if state == .active {
            state = .standard
        }
    }

    private func handleChanges(newValue: String) {
        if !newValue.isEmpty {
            let isEmail = isEmailValid(value: newValue)
            if isEmail {
                state = .success
                helperText = "Perfect ✅"
            } else {
                state = .error
                helperText = "You need to enter an email address"
            }
        } else {
            state = .active
            helperText = ""
        }
    }

    private func makeIconConfiguration() -> VitaminTextField.IconConfiguration {
        VitaminTextField.IconConfiguration(icon: Image(systemName: "eye")) {
            isSecure.toggle()
        }
    }
}

@available(iOS 13, *)
struct TextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldsView()
    }
}

@available(iOS 13, *)
extension TextFieldsView {
    func isEmailValid(value: String) -> Bool {
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"  // 1
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)  // 2

        return emailValidationPredicate.evaluate(with: value)  // 3
    }
}

#endif
