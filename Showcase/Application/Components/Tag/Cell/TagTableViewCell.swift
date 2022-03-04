//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import Vitamin

class MonoTagTableViewCell: UITableViewCell {
    @IBOutlet weak var vitaminTag: VitaminTag!
    @IBOutlet weak var fakeView: UIView!
    @IBOutlet weak var fakeLabel: UILabel!

    func update(variant: VitaminTag.Variant = .brandPrimary, text: String = "Tag", icon: UIImage? = nil) {
        fakeView.backgroundColor = VitaminColor.Core.Background.brandSecondary
        fakeLabel.attributedText = "This is a \(text) tag \(icon != nil ? "with an": "without") icon"
            .styled(as: .callout)
        vitaminTag.label = text
        vitaminTag.variant = variant
        vitaminTag.icon = icon
    }
}

class MultipleTagTableViewCell: UITableViewCell {
    @IBOutlet weak var vitaminTag1: VitaminTag!
    @IBOutlet weak var vitaminTag2: VitaminTag!
    @IBOutlet weak var vitaminTag3: VitaminTag!
    @IBOutlet weak var vitaminTag4: VitaminTag!
    @IBOutlet weak var vitaminTag5: VitaminTag!
    @IBOutlet weak var vitaminTag6: VitaminTag!
    @IBOutlet weak var vitaminTag7: VitaminTag!
    @IBOutlet weak var vitaminTag8: VitaminTag!
    @IBOutlet weak var vitaminTag9: VitaminTag!
    @IBOutlet weak var vitaminTag10: VitaminTag!
    @IBOutlet weak var vitaminTag11: VitaminTag!

    lazy var arrayOfTag: [VitaminTag] = [
        vitaminTag1,
        vitaminTag2,
        vitaminTag3,
        vitaminTag4,
        vitaminTag5,
        vitaminTag6,
        vitaminTag7,
        vitaminTag8,
        vitaminTag9,
        vitaminTag10,
        vitaminTag11
    ]


    func update(arrayOfTagConfig: [VitaminTagDemoConfig]) {
        let min = min(arrayOfTagConfig.count - 1, arrayOfTag.count - 1)
        for i in 0...min {
            arrayOfTag[i].isHidden = false
            arrayOfTag[i].variant = arrayOfTagConfig[i].variant
            arrayOfTag[i].label = arrayOfTagConfig[i].text
            arrayOfTag[i].icon = arrayOfTagConfig[i].image
        }
        if (min + 1) <= (arrayOfTag.count - 1) {
            for i in (min + 1)...arrayOfTag.count - 1 {
                arrayOfTag[i].isHidden = true
                arrayOfTag[i].variant = .brandPrimary
                arrayOfTag[i].label = ""
                arrayOfTag[i].icon = nil
            }
        }
    }
}
