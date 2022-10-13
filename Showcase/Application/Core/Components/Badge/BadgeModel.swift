//
//  Vitamin iOS
//  Apache License 2.0
//

import VitaminCore

enum BadgeModel {
    struct Item: Identifiable {
        var id: String {
            "\(value ?? 0)-\(variant.name)"
        }
        var value: Int?
        var variant: VitaminBadgeVariant = .standard
    }

    static let items = [
        BadgeModel.Item(value: nil, variant: .standard),
        BadgeModel.Item(value: 2, variant: .standard),
        BadgeModel.Item(value: 50, variant: .standard),
        BadgeModel.Item(value: 100, variant: .standard),
        BadgeModel.Item(value: nil, variant: .brand),
        BadgeModel.Item(value: 2, variant: .brand),
        BadgeModel.Item(value: 50, variant: .brand),
        BadgeModel.Item(value: 100, variant: .brand),
        BadgeModel.Item(value: nil, variant: .reversed),
        BadgeModel.Item(value: 2, variant: .reversed),
        BadgeModel.Item(value: 50, variant: .reversed),
        BadgeModel.Item(value: 100, variant: .reversed),
        BadgeModel.Item(value: nil, variant: .accent),
        BadgeModel.Item(value: 2, variant: .accent),
        BadgeModel.Item(value: 50, variant: .accent),
        BadgeModel.Item(value: 100, variant: .accent),
        BadgeModel.Item(value: nil, variant: .alert),
        BadgeModel.Item(value: 2, variant: .alert),
        BadgeModel.Item(value: 50, variant: .alert),
        BadgeModel.Item(value: 100, variant: .alert)
    ]
}
