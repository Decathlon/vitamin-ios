//
//  Vitamin iOS
//  Apache License 2.0
//

import Foundation
import CoreGraphics
import UIKit.UIDevice

protocol SizeProvider {
    var size: CGFloat { get }
}

extension Int: SizeProvider {
    var size: CGFloat { CGFloat(self) }
}

struct DeviceRelativeSize: SizeProvider {
    private let padSize: CGFloat
    private let phoneSize: CGFloat
    private let macSize: CGFloat

    init (mac: CGFloat, pad: CGFloat, phone: CGFloat) {
        self.macSize = mac
        self.padSize = pad
        self.phoneSize = phone
    }

    var size: CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone: return phoneSize
        case .mac: return macSize
        default: return padSize
        }
    }
}
