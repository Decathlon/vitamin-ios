//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension UIApplication {
    func forceResignFirstResponder() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
