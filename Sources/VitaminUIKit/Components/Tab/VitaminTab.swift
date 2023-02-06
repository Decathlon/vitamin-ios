//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

@IBDesignable
public class VitaminTab: UISegmentedControl {
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    override public required init(items: [Any]?) {
        super.init(items: items)
        commonInit()
    }

    @available(iOS 14.0, *)
    public convenience init(frame: CGRect, actions: [UIAction]) {
        self.init(frame: frame, actions: actions)
        commonInit()
    }

    func commonInit() {
        var selectedAttributes = VitaminTextStyle.footnoteBold.customAttributes()
        selectedAttributes[.foregroundColor] = VitaminColor.Core.Content.active

        var unselectedAttributes = VitaminTextStyle.footnote.customAttributes()
        unselectedAttributes[.foregroundColor] = VitaminColor.Core.Content.secondary

        self.setTitleTextAttributes(selectedAttributes, for: .selected)
        self.setTitleTextAttributes(unselectedAttributes, for: .normal)

        self.dropShadow(shadowType: .shadow100)
    }
}
