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
final class ShowcaseSnapshotSwiftUITests: XCTestCase {
  
  func testButtonsView() throws {
    ButtonsView_Previews.snapshots.assertSnapshots()
  }
  
  func testTextFields() throws {
    TextFieldsView_Previews.snapshots.assertSnapshots()
  }
  
  
  func testBadgesView() throws {
    BadgesView_Previews.snapshots.assertSnapshots()
  }
}
