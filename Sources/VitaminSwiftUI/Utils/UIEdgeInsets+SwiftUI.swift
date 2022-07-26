//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI

@available(iOS 13, *)
extension UIEdgeInsets {
    public var swiftUIEdgeInsets: EdgeInsets {
        EdgeInsets(top: self.top, leading: self.left, bottom: self.bottom, trailing: self.right)
    }
}
#endif
