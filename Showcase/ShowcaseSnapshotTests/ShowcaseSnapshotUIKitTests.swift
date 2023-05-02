import XCTest
import SnapshotTesting
import UIKit

@testable import Vitamin

final class ShowcaseSnapshotUIKitTests: XCTestCase {
  
  func testVitaminButton() throws {
    let button = VitaminButton(style: .primary)
    button.setTitle("Vitamin", for: .normal)
    button.frame = CGRect(origin: .zero, size: CGSize(width: 150, height: 60))
    button.setIconType(.trailing(image: .add), for: .normal)
    button.applyNewTextStyle()
    assertSnapshot(matching: button, as: .image)
  }
  
  func testTextInput() throws {
    let textField = VitaminTextField(state: .init(initialState: .active), texts: .init(labelText: "Vitamin"))
    textField.frame = CGRect(origin: .zero, size: CGSize(width: 150, height: 60))
  }
  
  
  func testVitaminBadge() throws {
    let badge1 = VitaminBadge(value: nil)
    let badge2 = VitaminBadge(value: 0)
    let badge3 = VitaminBadge(value: 5)
    let badge4 = VitaminBadge(value: 99)
    let badge5 = VitaminBadge(value: 150)
  }
  
  func testVitaminProgressbar() throws {
    let progress = VitaminProgressbar(progressType: .determinate)
  }
  
  func testVitaminTag() throws {
    let tag = VitaminTag()
  }
  
  func testVitaminSnackbar() throws {
    let tag = VitaminSnackbar()
  }
  
  func testVitaminChip() throws {
    let tag = VitaminChip()
  }
}
