//
//  Vitamin iOS
//  Apache License 2.0
//

import Foundation
import VitaminCore

enum IconsModel {
    struct Section: Identifiable {
        var id: String {
            name
        }
        let name: String
        let items: [VitaminAsset]
    }
}
