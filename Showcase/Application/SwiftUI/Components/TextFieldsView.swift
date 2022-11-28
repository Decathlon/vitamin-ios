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

    var body: some View {
        VStack {
            Form {
//                makeTextFieldsRows()

                makeTextField()
            }
        }
        .frame(maxWidth: .infinity)
        .customNavigationTitle("Button", displayMode: .inline)
    }
}

@available(iOS 13, *)
extension TextFieldsView {
//    @ViewBuilder
//    func makeTextFieldsRows() -> some View {
//        makeTextFieldRow(.standard)
//        let textFieldStates = TextFieldModel.textFieldStates
//        ForEach(textFieldStates) { textFieldState in
//            self.makeTextFieldRow(textFieldState.state)
//        }
//    }
//
//    func makeTextFieldRow(_ state: VitaminTextFieldState) -> some View {
//        VStack {
//            makeTextField(state: state)
//        }
//        .frame(maxWidth: .infinity)
//        .padding()
//    }

    func makeTextField() -> some View {
        VitaminTextField(label: state.rawValue,
                         placeholder: "Placeholder",
                         helperText: "Helper",
                         characterLimit: 10,
                         text: $text,
                         state: state)
        .onReceive(Just(text)) { newValue in
                         state: $state)
            if !newValue.isEmpty {
                let isEmail = isEmailValid(value: newValue)
                if isEmail {
                    state = .success
                } else {
                    state = .error
                }
            }
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


