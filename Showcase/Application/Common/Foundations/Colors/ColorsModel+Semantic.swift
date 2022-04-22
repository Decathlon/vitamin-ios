//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCommon

extension ColorsModel {
    static func makeBackgroundItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Primary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Background.primary),
            ColorsModel.Item(name: "Secondary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Background.secondary),
            ColorsModel.Item(name: "Tertiary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Background.tertiary),
            ColorsModel.Item(name: "BrandPrimary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Background.brandPrimary),
            ColorsModel.Item(name: "BrandSecondary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Background.brandSecondary),
            ColorsModel.Item(name: "Accent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Background.accent),
            ColorsModel.Item(name: "Alert",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Background.alert),
            ColorsModel.Item(name: "PrimaryReversed",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Background.primaryReversed),
            ColorsModel.Item(name: "BrandPrimaryReversed",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Background.brandPrimaryReversed)
        ]
    }

    static func makeContentItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Primary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.primary),
            ColorsModel.Item(name: "Secondary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.secondary),
            ColorsModel.Item(name: "Tertiary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.tertiary),
            ColorsModel.Item(name: "Action",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.action),
            ColorsModel.Item(name: "Active",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.active),
            ColorsModel.Item(name: "Inactive",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.inactive),
            ColorsModel.Item(name: "Negative",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.negative),
            ColorsModel.Item(name: "Warning",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.warning),
            ColorsModel.Item(name: "Positive",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.positive),
            ColorsModel.Item(name: "Information",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.information),
            ColorsModel.Item(name: "PrimaryReversed",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.primaryReversed),
            ColorsModel.Item(name: "ActionReversed",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Content.actionReversed)
        ]
    }

    static func makeBorderItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Primary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Border.primary),
            ColorsModel.Item(name: "Secondary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Border.secondary),
            ColorsModel.Item(name: "Active",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Border.active),
            ColorsModel.Item(name: "Inactive",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Border.inactive),
            ColorsModel.Item(name: "Negative",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Border.negative),
            ColorsModel.Item(name: "Warning",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Border.warning),
            ColorsModel.Item(name: "Positive",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Border.positive),
            ColorsModel.Item(name: "Information",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Border.information),
            ColorsModel.Item(name: "PrimaryReversed",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Border.primaryReversed)
        ]
    }

    static func makeHoverItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Primary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Hover.primary),
            ColorsModel.Item(name: "PrimaryTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Hover.primaryTransparent),
            ColorsModel.Item(name: "SecondaryTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Hover.secondaryTransparent),
            ColorsModel.Item(name: "TertiaryTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Hover.tertiaryTransparent),
            ColorsModel.Item(name: "Tertiary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Hover.tertiary),
            ColorsModel.Item(name: "Brand",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Hover.brand),
            ColorsModel.Item(name: "Accent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Hover.accent),
            ColorsModel.Item(name: "PrimaryReversedTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Hover.primaryReversedTransparent),
            ColorsModel.Item(name: "SecondaryReversedTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Hover.secondaryReversedTransparent),
            ColorsModel.Item(name: "TertiaryReversedTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Hover.tertiaryReversedTransparent)
        ]
    }

    static func makeActiveItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Primary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Active.primary),
            ColorsModel.Item(name: "PrimaryTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Active.primaryTransparent),
            ColorsModel.Item(name: "SecondaryTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Active.secondaryTransparent),
            ColorsModel.Item(name: "Tertiary",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Active.tertiary),
            ColorsModel.Item(name: "TertiaryTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Active.tertiaryTransparent),
            ColorsModel.Item(name: "Brand",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Active.brand),
            ColorsModel.Item(name: "Accent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Active.accent),
            ColorsModel.Item(name: "PrimaryReversedTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Active.primaryReversedTransparent),
            ColorsModel.Item(name: "SecondaryReversedTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Active.secondaryReversedTransparent),
            ColorsModel.Item(name: "TertiaryReversedTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Active.tertiaryReversedTransparent),
            ColorsModel.Item(name: "BrandReversedTransparent",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Active.brandReversedTransparent)
        ]
    }

    static func makeDecorativeItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "DecorativeGravel",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Decorative.gravel),
            ColorsModel.Item(name: "DecorativeBrick",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Decorative.brick),
            ColorsModel.Item(name: "DecorativeSaffron",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Decorative.saffron),
            ColorsModel.Item(name: "DecorativeGold",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Decorative.gold),
            ColorsModel.Item(name: "DecorativeJade",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Decorative.jade),
            ColorsModel.Item(name: "DecorativeEmerald",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Decorative.emerald),
            ColorsModel.Item(name: "DecorativeCobalt",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Decorative.cobalt),
            ColorsModel.Item(name: "DecorativeAmethyst",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Decorative.amethyst)
        ]
    }

    static func makeShadowItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "ShadowShadow",
                             sectionName: sectionName,
                             color: VitaminColor.Core.Shadow.shadow)
        ]
    }
}
