//
//  Vitamin iOS
//  Apache License 2.0
//

import VitaminCore

enum ButtonModel {
    struct ButtonStyle: Identifiable {
        var id: String {
            style.rawValue
        }
        let style: VitaminButtonStyle
    }

    static let buttonStyles = [
        ButtonModel.ButtonStyle(style: .primary),
        ButtonModel.ButtonStyle(style: .primaryReversed),
        ButtonModel.ButtonStyle(style: .secondary),
        ButtonModel.ButtonStyle(style: .tertiary),
        ButtonModel.ButtonStyle(style: .conversion),
        ButtonModel.ButtonStyle(style: .ghost),
        ButtonModel.ButtonStyle(style: .ghostReversed)
    ]
}

extension VitaminButtonStyle {
    var needsReversedBackground: Bool {
        self == .primaryReversed || self == .ghostReversed
    }
}
