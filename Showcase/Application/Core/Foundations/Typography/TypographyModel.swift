//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

enum TypographyModel {
    struct Item: Identifiable {
        private static let text = "Sphinx of black quartz, judge my vow."

        var id: String {
            name
        }
        let name: String
        let value: VitaminTextStyle

        var text: String {
            guard value == .display ||
                    value == .largeTitle1 ||
                    value == .largeTitle2 else {
                return Self.text
            }
            return Self.text.uppercased()
        }
    }

    static let items = [
        TypographyModel.Item(name: "Display", value: .display),
        TypographyModel.Item(name: "Large Title 1", value: .largeTitle1),
        TypographyModel.Item(name: "Large Title 2", value: .largeTitle2),
        TypographyModel.Item(name: "Title 1", value: .title1),
        TypographyModel.Item(name: "Title 2", value: .title2),
        TypographyModel.Item(name: "Title 3", value: .title3),
        TypographyModel.Item(name: "Headline", value: .headline),
        TypographyModel.Item(name: "Body", value: .body),
        TypographyModel.Item(name: "Body Bold", value: .bodyBold),
        TypographyModel.Item(name: "Callout", value: .callout),
        TypographyModel.Item(name: "Callout Bold", value: .calloutBold),
        TypographyModel.Item(name: "Subhead", value: .subhead),
        TypographyModel.Item(name: "Footnote", value: .footnote),
        TypographyModel.Item(name: "Footnote Bold", value: .footnoteBold),
        TypographyModel.Item(name: "Caption 1", value: .caption1),
        TypographyModel.Item(name: "Caption 2", value: .caption2),
        TypographyModel.Item(name: "Button", value: .button)
    ]
}
