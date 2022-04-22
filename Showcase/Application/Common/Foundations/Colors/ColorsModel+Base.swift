//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCommon

extension ColorsModel {
    static func makeBaseItems(sectionName: String) -> [ColorsModel.Item] {
        [
            makeBaseBlackItems(sectionName: sectionName),
            makeBaseBlueItems(sectionName: sectionName),
            makeBaseConiferItems(sectionName: sectionName),
            makeBaseGreenItems(sectionName: sectionName),
            makeBaseGreyItems(sectionName: sectionName),
            makeBaseOrangeItems(sectionName: sectionName),
            makeBasePurpleItems(sectionName: sectionName),
            makeBaseRedItems(sectionName: sectionName),
            makeBaseYellowItems(sectionName: sectionName),
            makeBaseWhiteItems(sectionName: sectionName)
        ]
        .flatMap { $0 }
    }

    static func makeBaseBlackItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Black",
                             sectionName: sectionName,
                             color: VitaminColor.Base.black.color)
        ]
    }

    static func makeBaseBlueItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Blue 50",
                             sectionName: sectionName,
                             color: VitaminColor.Base.blue50.color),
            ColorsModel.Item(name: "Blue 100",
                             sectionName: sectionName,
                             color: VitaminColor.Base.blue100.color),
            ColorsModel.Item(name: "Blue 200",
                             sectionName: sectionName,
                             color: VitaminColor.Base.blue200.color),
            ColorsModel.Item(name: "Blue 300",
                             sectionName: sectionName,
                             color: VitaminColor.Base.blue300.color),
            ColorsModel.Item(name: "Blue 400",
                             sectionName: sectionName,
                             color: VitaminColor.Base.blue400.color),
            ColorsModel.Item(name: "Blue 500",
                             sectionName: sectionName,
                             color: VitaminColor.Base.blue500.color),
            ColorsModel.Item(name: "Blue 600",
                             sectionName: sectionName,
                             color: VitaminColor.Base.blue600.color),
            ColorsModel.Item(name: "Blue 700",
                             sectionName: sectionName,
                             color: VitaminColor.Base.blue700.color)
        ]
    }

    static func makeBaseConiferItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Conifer 50",
                             sectionName: sectionName,
                             color: VitaminColor.Base.conifer50.color),
            ColorsModel.Item(name: "Conifer  100",
                             sectionName: sectionName,
                             color: VitaminColor.Base.conifer100.color),
            ColorsModel.Item(name: "Conifer 200",
                             sectionName: sectionName,
                             color: VitaminColor.Base.conifer200.color),
            ColorsModel.Item(name: "Conifer 300",
                             sectionName: sectionName,
                             color: VitaminColor.Base.conifer300.color),
            ColorsModel.Item(name: "Conifer 400",
                             sectionName: sectionName,
                             color: VitaminColor.Base.conifer400.color),
            ColorsModel.Item(name: "Conifer 500",
                             sectionName: sectionName,
                             color: VitaminColor.Base.conifer500.color),
            ColorsModel.Item(name: "Conifer 600",
                             sectionName: sectionName,
                             color: VitaminColor.Base.conifer600.color),
            ColorsModel.Item(name: "Conifer 700",
                             sectionName: sectionName,
                             color: VitaminColor.Base.conifer700.color)
        ]
    }

    static func makeBaseGreenItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Green 50",
                             sectionName: sectionName,
                             color: VitaminColor.Base.green50.color),
            ColorsModel.Item(name: "Green 100",
                             sectionName: sectionName,
                             color: VitaminColor.Base.green100.color),
            ColorsModel.Item(name: "Green 200",
                             sectionName: sectionName,
                             color: VitaminColor.Base.green200.color),
            ColorsModel.Item(name: "Green 300",
                             sectionName: sectionName,
                             color: VitaminColor.Base.green300.color),
            ColorsModel.Item(name: "Green 400",
                             sectionName: sectionName,
                             color: VitaminColor.Base.green400.color),
            ColorsModel.Item(name: "Green 500",
                             sectionName: sectionName,
                             color: VitaminColor.Base.green500.color),
            ColorsModel.Item(name: "Green 600",
                             sectionName: sectionName,
                             color: VitaminColor.Base.green600.color),
            ColorsModel.Item(name: "Green 700",
                             sectionName: sectionName,
                             color: VitaminColor.Base.green700.color)
        ]
    }

    static func makeBaseGreyItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Grey 50",
                             sectionName: sectionName,
                             color: VitaminColor.Base.grey50.color),
            ColorsModel.Item(name: "Grey 100",
                             sectionName: sectionName,
                             color: VitaminColor.Base.grey100.color),
            ColorsModel.Item(name: "Grey 200",
                             sectionName: sectionName,
                             color: VitaminColor.Base.grey200.color),
            ColorsModel.Item(name: "Grey 300",
                             sectionName: sectionName,
                             color: VitaminColor.Base.grey300.color),
            ColorsModel.Item(name: "Grey 400",
                             sectionName: sectionName,
                             color: VitaminColor.Base.grey400.color),
            ColorsModel.Item(name: "Grey 500",
                             sectionName: sectionName,
                             color: VitaminColor.Base.grey500.color),
            ColorsModel.Item(name: "Grey 600",
                             sectionName: sectionName,
                             color: VitaminColor.Base.grey600.color),
            ColorsModel.Item(name: "Grey 700",
                             sectionName: sectionName,
                             color: VitaminColor.Base.grey700.color),
            ColorsModel.Item(name: "Grey 800",
                             sectionName: sectionName,
                             color: VitaminColor.Base.grey800.color),
            ColorsModel.Item(name: "Grey 900",
                             sectionName: sectionName,
                             color: VitaminColor.Base.grey900.color)
        ]
    }

    static func makeBaseOrangeItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Orange 50",
                             sectionName: sectionName,
                             color: VitaminColor.Base.orange50.color),
            ColorsModel.Item(name: "Orange 100",
                             sectionName: sectionName,
                             color: VitaminColor.Base.orange100.color),
            ColorsModel.Item(name: "Orange 200",
                             sectionName: sectionName,
                             color: VitaminColor.Base.orange200.color),
            ColorsModel.Item(name: "Orange 300",
                             sectionName: sectionName,
                             color: VitaminColor.Base.orange300.color),
            ColorsModel.Item(name: "Orange 400",
                             sectionName: sectionName,
                             color: VitaminColor.Base.orange400.color),
            ColorsModel.Item(name: "Orange 500",
                             sectionName: sectionName,
                             color: VitaminColor.Base.orange500.color),
            ColorsModel.Item(name: "Orange 600",
                             sectionName: sectionName,
                             color: VitaminColor.Base.orange600.color),
            ColorsModel.Item(name: "Orange 700",
                             sectionName: sectionName,
                             color: VitaminColor.Base.orange700.color)
        ]
    }

    static func makeBasePurpleItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Purple 50",
                             sectionName: sectionName,
                             color: VitaminColor.Base.purple50.color),
            ColorsModel.Item(name: "Purple 100",
                             sectionName: sectionName,
                             color: VitaminColor.Base.purple100.color),
            ColorsModel.Item(name: "Purple 200",
                             sectionName: sectionName,
                             color: VitaminColor.Base.purple200.color),
            ColorsModel.Item(name: "Purple 300",
                             sectionName: sectionName,
                             color: VitaminColor.Base.purple300.color),
            ColorsModel.Item(name: "Purple 400",
                             sectionName: sectionName,
                             color: VitaminColor.Base.purple400.color),
            ColorsModel.Item(name: "Purple 500",
                             sectionName: sectionName,
                             color: VitaminColor.Base.purple500.color),
            ColorsModel.Item(name: "Purple 600",
                             sectionName: sectionName,
                             color: VitaminColor.Base.purple600.color),
            ColorsModel.Item(name: "Purple 700",
                             sectionName: sectionName,
                             color: VitaminColor.Base.purple700.color)
        ]
    }

    static func makeBaseRedItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Red 50",
                             sectionName: sectionName,
                             color: VitaminColor.Base.red50.color),
            ColorsModel.Item(name: "Red 100",
                             sectionName: sectionName,
                             color: VitaminColor.Base.red100.color),
            ColorsModel.Item(name: "Red 200",
                             sectionName: sectionName,
                             color: VitaminColor.Base.red200.color),
            ColorsModel.Item(name: "Red 300",
                             sectionName: sectionName,
                             color: VitaminColor.Base.red300.color),
            ColorsModel.Item(name: "Red 400",
                             sectionName: sectionName,
                             color: VitaminColor.Base.red400.color),
            ColorsModel.Item(name: "Red 500",
                             sectionName: sectionName,
                             color: VitaminColor.Base.red500.color),
            ColorsModel.Item(name: "Red 600",
                             sectionName: sectionName,
                             color: VitaminColor.Base.red600.color),
            ColorsModel.Item(name: "Red 700",
                             sectionName: sectionName,
                             color: VitaminColor.Base.red700.color)
        ]
    }

    static func makeBaseYellowItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "Yellow 50",
                             sectionName: sectionName,
                             color: VitaminColor.Base.yellow50.color),
            ColorsModel.Item(name: "Yellow 100",
                             sectionName: sectionName,
                             color: VitaminColor.Base.yellow100.color),
            ColorsModel.Item(name: "Yellow 200",
                             sectionName: sectionName,
                             color: VitaminColor.Base.yellow200.color),
            ColorsModel.Item(name: "Yellow 300",
                             sectionName: sectionName,
                             color: VitaminColor.Base.yellow300.color),
            ColorsModel.Item(name: "Yellow 400",
                             sectionName: sectionName,
                             color: VitaminColor.Base.yellow400.color),
            ColorsModel.Item(name: "Yellow 500",
                             sectionName: sectionName,
                             color: VitaminColor.Base.yellow500.color),
            ColorsModel.Item(name: "Yellow 600",
                             sectionName: sectionName,
                             color: VitaminColor.Base.yellow600.color),
            ColorsModel.Item(name: "Yellow 700",
                             sectionName: sectionName,
                             color: VitaminColor.Base.yellow700.color)
        ]
    }

    static func makeBaseWhiteItems(sectionName: String) -> [ColorsModel.Item] {
        [
            ColorsModel.Item(name: "White",
                             sectionName: sectionName,
                             color: VitaminColor.Base.white.color)
        ]
    }
}
