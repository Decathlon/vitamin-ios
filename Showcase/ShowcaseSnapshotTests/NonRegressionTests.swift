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

extension Image {
  public init(asset: VitaminAsset) {
    self.init(asset.name, bundle: asset.bundle)
  }
}

final class NonRegressionUIKitTests: XCTestCase {
  
  func testIconsTemplateMode() throws {
    assertSnapshot(
      matching: Image(asset: Vitamix.searchLine)
        .frame(width: 100, height: 100)
        .foregroundStyle(.red),
      as: .image,
      named: "red"
    )
    assertSnapshot(
      matching: Image(asset: Vitamix.searchLine)
        .frame(width: 100, height: 100),
      as: .image,
      named: "black"
    )
  }
  
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
  
  func testButtonAlignement() throws {
    @State var bt1: CGSize = .zero
    @State var bt2: CGSize = .zero
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
        iconType: .alone(image: UIImage(systemName: "gear")!, renderingMode: .template),
        action: {})
      .fixedSize()
      .readSize(onChange: { bt2 = $0 })
    }.padding()
    assertSnapshot(matching: UIHostingController(rootView: container), as: .recursiveDescription(on: .iPhone12))
    assertSnapshot(matching: UIHostingController(rootView: container), as: .image)
  }
}
