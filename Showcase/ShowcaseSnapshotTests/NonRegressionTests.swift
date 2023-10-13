//
//  Vitamin iOS
//  Apache License 2.0
//

import XCTest
import SnapshotTesting
import PreviewSnapshotsTesting
import UIKit
import SwiftUI

@testable import Vitamin
@testable import VitaminSwiftUI
@testable import Showcase

final class NonRegressionUIKitTests: VitaminTestCase {
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
    assertSnapshot(matching: restartButton, as: .image(perceptualPrecision: perceptualPrecision), named: "restartButton")
    
    let updateButton = VitaminButton()
    updateButton.style = .secondary
    updateButton.setIconType(.trailing(image: Vitamix.Line.Design.edit.image), for: .normal)
    updateButton.setTitle("", for: .normal) // For iOS 12
    updateButton.setTitle("Update Button", for: .normal)
    updateButton.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 80))
    assertSnapshot(matching: updateButton, as: .image(perceptualPrecision: perceptualPrecision))
    
    let deleteButton = VitaminButton()
    deleteButton.style = .ghost
    deleteButton.setIconType(.trailing(image: Vitamix.Line.System.deleteBin.image), for: .normal)
    deleteButton.setTitle("DeleteButton", for: .normal)
    deleteButton.tintColor = VitaminColor.Core.Content.negative
    deleteButton.setTitleColor(VitaminColor.Core.Content.negative, for: .normal)
    deleteButton.setTitleColor(VitaminColor.Core.Content.negative, for: .highlighted)
    deleteButton.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 80))
    assertSnapshot(matching: deleteButton, as: .image(perceptualPrecision: perceptualPrecision))
  }
  
  func testButtonAlignement() throws {
    @State var bt1: CGSize = .zero
    @State var bt2: CGSize = .zero

    let gear = UIImage(systemName: "gear")?.resize(CGSize(width: 24, height: 24))
    
    let container = HStack {
      VitaminButton(
        text: "Modifier le profil",
        style: .tertiary,
        size: .medium,
        iconType: .leading(image: UIImage(systemName: "person")!, renderingMode: .template),
        action: {})
      .fixedSize()
      .readSize(onChange: { bt1 = $0 })
      VitaminButton(
        style: .tertiary,
        size: .medium,
        iconType: .alone(image: gear!, renderingMode: .template),
        action: {})
      .fixedSize()
      .readSize(onChange: { bt2 = $0 })
    }.padding()
    assertSnapshot(matching: UIHostingController(rootView: container), as: .recursiveDescription(on: .iPhone12))
    assertSnapshot(matching: UIHostingController(rootView: container), as: .image(perceptualPrecision: perceptualPrecision))
  }
}

class VitaminTestCase: XCTestCase {
  // The percentage a pixel must match the source pixel to be considered a match. [98-99% mimics the precision of the human eye.](http://zschuessler.github.io/DeltaE/learn/#toc-defining-delta-e)
  var perceptualPrecision: Float = 0.99
  
  override class func setUp() {
    // Helix Visual Merge Tool (P4Merge) is a versatile tool for three-way merging and side-by-side file comparisons. It's useful for visualizing merges, accessing detailed file histories, and comparing a wide range of image and text files.
    // You can find more about it here: https://www.perforce.com/products/helix-core-apps/merge-diff-tool-p4merge
    // We're using this free tool to simplify the process of diffing two image or text files.
    // To use it effectively, make sure to have P4Merge installed on your system.
    SnapshotTesting.diffTool = "/Applications/p4merge.app/Contents/MacOS/p4merge"

    // In order to update the test fixture you just have to un comment the code below then recomment it before commit.
//    SnapshotTesting.isRecording = true
  }
}

