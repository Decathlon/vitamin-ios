//
//  Vitamin iOS
//  Apache License 2.0
//

import XCTest
import SnapshotTesting
import PreviewSnapshotsTesting
import UIKit

@testable import Vitamin
@testable import Showcase

final class NonRegressionUIKitTests: XCTestCase {
  // https://decathlon.atlassian.net/browse/CNT-1085
  func testCNT1085() throws {
    let restartButton = VitaminButton()
    restartButton.style = .primary
    restartButton.setIconType(.trailing(image: Vitamix.Line.System.refresh.image, renderingMode: .alwaysTemplate), for: .normal)
    restartButton.setTitle("", for: .normal) // For iOS 12
    restartButton.setTitle("Restart Button", for: .normal)
    restartButton.setTitleColor(VitaminColor.Core.Content.primaryReversed, for: .normal)
    restartButton.setTitleColor(VitaminColor.Core.Content.primaryReversed, for: .highlighted)
    restartButton.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 80))
    assertSnapshot(matching: restartButton, as: .image, named: "restartButton")
    
    let updateButton = VitaminButton()
    updateButton.style = .secondary
    updateButton.setIconType(.trailing(image: Vitamix.Line.Design.edit.image), for: .normal)
    updateButton.setTitle("", for: .normal) // For iOS 12
    updateButton.setTitle("Update Button", for: .normal)
    updateButton.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 80))
    assertSnapshot(matching: updateButton, as: .image)
    
    let deleteButton = VitaminButton()
    deleteButton.style = .ghost
    deleteButton.setIconType(.trailing(image: Vitamix.Line.System.deleteBin.image), for: .normal)
    deleteButton.setTitle("DeleteButton", for: .normal)
    deleteButton.tintColor = VitaminColor.Core.Content.negative
    deleteButton.setTitleColor(VitaminColor.Core.Content.negative, for: .normal)
    deleteButton.setTitleColor(VitaminColor.Core.Content.negative, for: .highlighted)
    deleteButton.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 80))
    assertSnapshot(matching: deleteButton, as: .image)
  }
}
