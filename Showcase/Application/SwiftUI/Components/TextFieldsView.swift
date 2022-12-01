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
    @State var enabled = true
    @State var text = ""
    @State var state: VitaminTextFieldState = .standard
    @State var helperText: String = ""

    var body: some View {
        VStack {
            Form {
                makeTextField()
                makeTextFieldModifier()
            }
        }
        .frame(maxWidth: .infinity)
        .customNavigationTitle("TextField", displayMode: .inline)
    }
}

@available(iOS 13, *)
extension TextFieldsView {
    func makeTextField() -> some View {
        VitaminTextField(label: state.rawValue.capitalized,
                         placeholder: "Placeholder",
                         helperText: helperText,
                         text: $text,
                         state: $state,
                         icon: nil,
                         characterLimit: .init(text: $text, limit: 10))
        .compatibilityOnChange(of: text, perform: handleChanges(newValue:))
    }

    func makeTextFieldModifier() -> some View {
        TextField("Placeholder", text: $text) { editing in
            state = VitaminTextField.updateEditingState(state: state, editing: editing)
        }
        .vitaminTextFieldStyle(label: state.rawValue.capitalized,
                               helperText: helperText,
                               state: $state,
                               characterLimit: .init(text: $text, limit: 10))
        .compatibilityOnChange(of: text, perform: handleChanges(newValue:))
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
