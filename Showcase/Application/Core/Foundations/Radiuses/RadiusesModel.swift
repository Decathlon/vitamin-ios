//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

enum RadiusesModel {
    struct Item: Identifiable {
        var id: String {
            name
        }
        let name: String
        let value: VitaminRadius
    }

    static let items = [
        RadiusesModel.Item(name: "Radius 100", value: .radius100),
        RadiusesModel.Item(name: "Radius 200", value: .radius200),
        RadiusesModel.Item(name: "Radius 300", value: .radius300),
        RadiusesModel.Item(name: "Radius 400", value: .radius400),
        RadiusesModel.Item(name: "Radius 500", value: .radius500),
        RadiusesModel.Item(name: "Radius 600", value: .radius600),
        RadiusesModel.Item(name: "Radius 700", value: .radius700),
        RadiusesModel.Item(name: "Radius 800", value: .radius800)
    ]
}
