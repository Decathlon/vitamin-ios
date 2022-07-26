//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI

@available(iOS 13, *)
extension UIImage {
    public var swiftUIImage: Image {
        Image(uiImage: self)
    }
}

@available(iOS 13, *)
extension UIImage.RenderingMode {
    public var swiftUIRenderingMode: Image.TemplateRenderingMode {
        switch self {
        case .alwaysTemplate:
            return .template
        case .alwaysOriginal:
            return .original
        default:
            return .original
        }
    }
}
#endif
