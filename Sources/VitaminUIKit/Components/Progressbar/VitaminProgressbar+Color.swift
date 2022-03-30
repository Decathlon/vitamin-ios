//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCommon

extension VitaminProgressbar {
    /// Color used to display the track
    var trackColor: UIColor {
        if !self.showTrack {
            return UIColor.clear
        } else {
            return VitaminColor.Core.Background.tertiary
        }
    }

    /// Color used to display the achieved progress part of the progress bar
    var progressColor: UIColor {
        VitaminColor.Core.Content.active
    }

    /// Color used for the progressbar labels
    var labelColor: UIColor {
        VitaminColor.Core.Content.primary
    }

    /// Color for the background of the progressbar
    var viewBackgroundColor: UIColor {
        UIColor.clear
    }
}
