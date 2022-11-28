//
//  Vitamin iOS
//  Apache License 2.0
//

import VitaminCore

enum TextFieldModel {
    struct TextFieldState: Identifiable {
        var id: String {
            state.rawValue
        }
        let state: VitaminTextFieldState
    }

    static let textFieldStates = [
        TextFieldModel.TextFieldState(state: .error),
        TextFieldModel.TextFieldState(state: .success),
        TextFieldModel.TextFieldState(state: .standard),
        TextFieldModel.TextFieldState(state: .active),
        TextFieldModel.TextFieldState(state: .disabled)
    ]
}
