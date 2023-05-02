import XCTest
import SnapshotTesting
import SwiftUI

@testable import VitaminSwiftUI

final class ShowcaseSnapshotSwiftUITests: XCTestCase {
  
  func testVitaminButton() throws {
    let button = VitaminButton(style: .primary, action: {})
      .frame(width: 150, height: 60)
  }
  
  func testTextInput() throws {
    let textField = VitaminTextField()
  }
  
  
  func testVitaminBadge() throws {
    let badge1 = VitaminBadge(value: nil)
    let badge2 = VitaminBadge(value: 0)
    let badge3 = VitaminBadge(value: 5)
    let badge4 = VitaminBadge(value: 99)
    let badge5 = VitaminBadge(value: 150)
  }
}
