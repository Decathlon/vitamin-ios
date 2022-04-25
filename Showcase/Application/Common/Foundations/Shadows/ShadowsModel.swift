//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCommon

enum ShadowsModel {
    struct Item: Identifiable {
        var id: String {
            name
        }
        let name: String
        let value: VitaminShadow
    }

    static let items = [
        ShadowsModel.Item(name: "Shadow 100", value: .shadow100),
        ShadowsModel.Item(name: "Shadow 200", value: .shadow200),
        ShadowsModel.Item(name: "Shadow 300", value: .shadow300),
        ShadowsModel.Item(name: "Shadow 400", value: .shadow400),
        ShadowsModel.Item(name: "None", value: .none)
    ]
}
