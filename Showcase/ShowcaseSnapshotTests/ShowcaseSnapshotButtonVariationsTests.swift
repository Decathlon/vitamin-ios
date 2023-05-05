//
//  Vitamin iOS
//  Apache License 2.0
//

import XCTest
import SnapshotTesting
import SwiftUI
import PreviewSnapshotsTesting

@testable import Showcase
@testable import VitaminSwiftUI
@testable import VitaminCore

@available(iOS 13, *)
final class ShowcaseSnapshotButtonVariationsTests: XCTestCase {

  func testButtonsView() throws {
    let sections: [IconsModel.Section] = IconsModel.sections

    for section in sections {
      for item in section.items {
        let button = VitaminButton(
          text: "Vitamin Plus",
          style: .conversion,
          size: .medium,
          fullWidth: false,
          iconType: .trailing(image: UIImage(asset: item)!, renderingMode: .template)
        ) {}
        assertSnapshot(
          matching: button.frame(width: 250, height: 50),
          as: .image, named: "conversion-medium-\(section.name)-\(item.label)"
        )
      }
    }
  }
}
