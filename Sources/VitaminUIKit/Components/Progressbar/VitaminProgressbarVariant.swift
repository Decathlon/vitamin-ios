//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

public enum VitaminProgressbarVariant {
    case linear(size: VitaminProgressbarLinearSize, style: VitaminProgressbarLinearStyle)
    case circular(size: VitaminProgressbarCircularSize, style: VitaminProgressbarCircularStyle)
}

/// Size of the progress bar, that can be `.small`(64pt of diameter) or `.medium` (128pt of diameter)
public enum VitaminProgressbarLinearSize {
    case large
    /// The progress bar will be 128pt of diameter
    case medium
    /// The progress bar will be 64pt of diameter
    case small
}

/// Style of a progress bar
public enum VitaminProgressbarLinearStyle {
    /// Only the linear progress bar will be displayed
    case empty
    /// The progress percentage will be displayed in the center of the progress bar
    case percentage
    /// The left label will be displayed above the progress bar
    case labelOnly
}

/// Size of the progress bar, that can be `.small`(64pt of diameter) or `.medium` (128pt of diameter)
public enum VitaminProgressbarCircularSize {
    /// The progress bar will be 128pt of diameter
    case medium
    /// The progress bar will be 64pt of diameter
    case small
}

/// Style of a progress bar
public enum VitaminProgressbarCircularStyle {
    /// Only the cicular progress bar will be displayed
    case empty
    /// The progress percentage will be displayed in the center of the progress bar
    case percentage
    /// A checkered flag will be displayed in the center of the progress bar
    case image(UIImage)
}

/// Type of progress bar
public enum VitaminProgressbarProgressType {
    /// The progress has a detarmined length, its progress depends on the `progress`property value
    case determinate
    /// The progress has an undetermined length, it turns around until it is manually stopped
    case indeterminate
}

// MARK: sizing properties
extension VitaminProgressbarCircularSize {
    /// Diameter of the progress bar for a specific size
    var outerDiameter: CGFloat {
        if self == .medium {
            return 128
        } else {
            return 64
        }
    }

    /// Line width of the progressbar for a specific size
    var lineWidth: CGFloat {
        if self == .medium {
            return 8
        } else {
            return 4
        }
    }

    /// Text style to apply to the label for `.percentage`style for a specific size
    var textStyle: VitaminTextStyle {
        if self == .medium {
            return VitaminTextStyle.title1
        } else {
            return VitaminTextStyle.body
        }
    }

    /// Size of the image for `.image`style  for a specific size
    var imageSize: CGSize {
        let dimension = self.outerDiameter - 2 * (self.lineWidth + 3)
        return CGSize(width: dimension, height: dimension)
    }
}

extension VitaminProgressbarLinearSize {
    /// Line width of the progressbar for a specific size
    var lineWidth: CGFloat {
        switch self {
        case .small:
            return 4
        case .medium:
            return 8
        case .large:
            return 16
        }
    }

    /// Text style to apply to the label for `.percentage`style for a specific size
    var textStyle: VitaminTextStyle {
        if self == .small {
            return .footnote
        } else {
            return .callout
        }
    }

    /// Spacer between texts and progress bar
    var verticalSpacer: CGFloat {
        if self == .small {
            return 4
        } else {
            return 8
        }
    }

    var labelLineHeight: CGFloat {
        // extract lineHeight from text style
        let paragraphStyle = self.textStyle.customAttributes()[.paragraphStyle] as? NSParagraphStyle
        let lineHeight = paragraphStyle?.maximumLineHeight
        if let lineHeight = lineHeight {
            return lineHeight
        }
        return 0
    }
}
