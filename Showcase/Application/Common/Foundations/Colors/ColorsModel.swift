//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCommon

enum ColorsModel {
    struct Section: Identifiable {
        var id: String {
            name
        }
        let name: String
        let items: [Item]
    }

    struct Item: Identifiable {
        var id: String {
            "\(sectionName)\(name)"
        }
        let name: String
        let sectionName: String
        let color: UIColor
    }

    static let sections = [
        ColorsModel.Section(name: "Background", items: makeBackgroundItems(sectionName: "Background")),
        ColorsModel.Section(name: "Content", items: makeContentItems(sectionName: "Content")),
        ColorsModel.Section(name: "Border", items: makeBorderItems(sectionName: "Border")),
        ColorsModel.Section(name: "Hover", items: makeHoverItems(sectionName: "Hover")),
        ColorsModel.Section(name: "Active", items: makeActiveItems(sectionName: "Active")),
        ColorsModel.Section(name: "Decorative", items: makeDecorativeItems(sectionName: "Decorative")),
        ColorsModel.Section(name: "Shadow", items: makeShadowItems(sectionName: "Shadow")),
        ColorsModel.Section(name: "Base", items: makeBaseItems(sectionName: "Base"))
    ]
}
