import XCTest
import SnapshotTesting
import UIKit

@testable import Vitamin
@testable import Showcase

final class ShowcaseSnapshotUIKitTests: XCTestCase {
  
  func testVitaminButton() throws {
    let vc = UINavigationController(rootViewController: ButtonsViewController())
    assertSnapshot(matching: vc, as: .image)
  }
  
  func testTextFieldViewController() throws {
    let vc = UINavigationController(rootViewController: TextFieldViewController())
    assertSnapshot(matching: vc, as: .image)
  }
  
  func testBadgesViewController() throws {
    let vc = UINavigationController(rootViewController: BadgesViewController())
    assertSnapshot(matching: vc, as: .image)
  }
  
  func testProgressbarViewController() throws {
    let vc = UINavigationController(rootViewController: ProgressbarViewController())
    assertSnapshot(matching: vc, as: .image)
  }
  
  func testTagViewController() throws {
    let vc = UINavigationController(rootViewController: TagViewController())
    assertSnapshot(matching: vc, as: .image)
  }
  
  func testSnackbarViewController() throws {
    let vc = UINavigationController(rootViewController: SnackbarViewController())
    assertSnapshot(matching: vc, as: .image)
  }
  
  func testChipViewController() throws {
    let vc = UINavigationController(rootViewController: ChipViewController())
    assertSnapshot(matching: vc, as: .image)
  }
  
  func testSwitchViewController() throws {
    let vc = UINavigationController(rootViewController: SwitchViewController())
    assertSnapshot(matching: vc, as: .image)
  }
  
  func testSegmentedControlViewController() throws {
    let vc = UINavigationController(rootViewController: SegmentedControlViewController())
    assertSnapshot(matching: vc, as: .image)
  }
}
