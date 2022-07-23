//
//  Vitamin iOS
//  Apache License 2.0
//

import VitaminCore

enum ButtonModel {
    struct Item: Identifiable {
        var id: String {
            style.rawValue
        }
        let style: VitaminButtonStyle
    }

    static let items = [
        ButtonModel.Item(style: .primary),
        ButtonModel.Item(style: .primaryReversed),
        ButtonModel.Item(style: .secondary),
        ButtonModel.Item(style: .tertiary),
        ButtonModel.Item(style: .conversion),
        ButtonModel.Item(style: .ghost),
        ButtonModel.Item(style: .ghost)
    ]
}
