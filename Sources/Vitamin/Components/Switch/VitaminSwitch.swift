//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

@IBDesignable
public class VitaminSwitch: UISwitch {
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init() {
        super.init(frame: .zero)
        commonInit()
    }

    public override var isEnabled: Bool {
        didSet {
            if !self.isEnabled {
                self.layer.opacity = Float(VitaminOpacity.disabled)
            } else {
                self.layer.opacity = Float(VitaminOpacity.enabled)
            }
        }
    }

    // private func that will be called by initializers to set the colors for on and off state
    private func commonInit() {
        applyColors()
        self.layer.cornerRadius = self.frame.height / 2
    }

    // method that apply colors for on and off state
    private func applyColors() {
        self.tintColor = VitaminColor.Core.Content.inactive
        self.backgroundColor = VitaminColor.Core.Content.inactive
        self.onTintColor = VitaminColor.Core.Content.active
        self.thumbTintColor = VitaminColor.Core.Content.primaryReversed
    }
}
