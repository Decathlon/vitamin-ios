//
//  Vitamin iOS
//  Apache License 2.0
//

import VitaminCore

enum BadgeModel {
    struct Section: Identifiable {
        var id: String {
            name
        }
        let name: String
        let items: [Item]
    }

    struct Item: Identifiable {
        var id: String {
            "\(value ?? 0)-\(variant.name)"
        }
        var value: Int?
        var variant: VitaminBadgeVariant = .standard
    }

    static let sections: [BadgeModel.Section] = {
        var varientSection: [BadgeModel.Section] = []
        for variant in VitaminBadgeVariant.allCases {
            let section = BadgeModel.Section(name: variant.name, items: [
                BadgeModel.Item(value: nil, variant: variant),
                BadgeModel.Item(value: 2, variant: variant),
                BadgeModel.Item(value: 50, variant: variant),
                BadgeModel.Item(value: 100, variant: variant)
            ])
            varientSection.append(section)
        }
        return varientSection
    }()
}
