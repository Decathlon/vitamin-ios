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

    struct TextFieldStyle: Identifiable {
        var id: String {
            style.rawValue
        }
        let style: VitaminTextFieldStyle
    }

    static let states = [
        TextFieldModel.TextFieldState(state: .standard),
        TextFieldModel.TextFieldState(state: .active),
        TextFieldModel.TextFieldState(state: .error),
        TextFieldModel.TextFieldState(state: .success),
        TextFieldModel.TextFieldState(state: .disabled)
    ]

    static let styles = [
        TextFieldModel.TextFieldStyle(style: .outlined),
        TextFieldModel.TextFieldStyle(style: .filled)
    ]
}
