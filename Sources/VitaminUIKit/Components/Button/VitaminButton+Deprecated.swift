//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension VitaminButton {
    @available(*, deprecated, message: "Use setIconType(:for:) instead")
    public func setLeadingImage(_ image: UIImage, for state: UIControl.State) {
        setIconType(.leading(image: image, renderingMode: nil), for: state)
    }
    @available(*, deprecated, message: "Use setIconType(:for:) instead")
    public func setTrailingImage(_ image: UIImage, for state: UIControl.State) {
        setIconType(.trailing(image: image, renderingMode: nil), for: state)
    }
    @available(*, deprecated, message: "Use setIconType(:for:) instead")
    public func setLeadingImage(_ image: UIImage, for state: UIControl.State, renderingMode: UIImage.RenderingMode) {
        setIconType(.leading(image: image, renderingMode: renderingMode), for: state)
    }
    @available(*, deprecated, message: "Use setIconType(:for:) instead")
    public func setTrailingImage(_ image: UIImage, for state: UIControl.State, renderingMode: UIImage.RenderingMode) {
        setIconType(.trailing(image: image, renderingMode: renderingMode), for: state)
    }
}
