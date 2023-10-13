//
//  Vitamin iOS
//  Apache License 2.0
//

import XCTest
import SnapshotTesting
import UIKit

@testable import Vitamin
@testable import Showcase

final class ShowcaseSnapshotUIKitTests: VitaminTestCase {
  
  func testVitaminButton() throws {
    let vc = UINavigationController(rootViewController: ButtonsViewController())
    vc.view.frame = CGRect(origin: .zero, size: CGSize(width: 390, height: 1750))
    assertSnapshot(matching: vc, as: .image(perceptualPrecision: perceptualPrecision))
  }
  
  func testTextFieldViewController() throws {
    let vc = UINavigationController(rootViewController: TextFieldViewController())
    vc.view.frame = CGRect(origin: .zero, size: CGSize(width: 390, height: 2800))
    assertSnapshot(matching: vc, as: .image(perceptualPrecision: perceptualPrecision))
  }
  
  func testBadgesViewController() throws {
    let vc = UINavigationController(rootViewController: BadgesViewController())
    vc.view.frame = CGRect(origin: .zero, size: CGSize(width: 390, height: 1300))
    assertSnapshot(matching: vc, as: .image(perceptualPrecision: perceptualPrecision))
  }
  
  func testProgressbarViewController() throws {
    let vc = UINavigationController(rootViewController: ProgressbarViewController())
    vc.view.frame = CGRect(origin: .zero, size: CGSize(width: 390, height: 5000))
    assertSnapshot(matching: vc, as: .image(perceptualPrecision: perceptualPrecision))
  }
  
  func testTagViewController() throws {
    let vc = UINavigationController(rootViewController: TagViewController())
    vc.view.frame = CGRect(origin: .zero, size: CGSize(width: 390, height: 3800))
    assertSnapshot(matching: vc, as: .image(perceptualPrecision: perceptualPrecision))
  }
  
  func testSnackbarViewController() throws {
    let snack = VitaminSnackbar(
        contentConfiguration: VitaminSnackbar.ContentConfiguration(
            title: "Vitamin Plus",
            message: "Decathlon Design",
            image: nil
        ),
        dismissConfiguration: VitaminSnackbar.DismissConfiguration(
            autoDismiss: true,
            dismissDelay: 5.0,
            dismissOnTap: true
        ),
        actionOnTap: nil
    )
    let snack2 = VitaminSnackbar(
        contentConfiguration: VitaminSnackbar.ContentConfiguration(
            title: "Vitamin Plus",
            message: "Decathlon Design",
            image: UIImage(systemName: "person")
        ),
        dismissConfiguration: VitaminSnackbar.DismissConfiguration(
            autoDismiss: true,
            dismissDelay: 5.0,
            dismissOnTap: true
        ),
        actionOnTap: nil
    )
    assertSnapshot(matching: snack, as: .image(perceptualPrecision: perceptualPrecision))
    assertSnapshot(matching: snack2, as: .image(perceptualPrecision: perceptualPrecision))
  }
  
  func testChipViewController() throws {
    let vc = UINavigationController(rootViewController: ChipViewController())
    vc.view.frame = CGRect(origin: .zero, size: CGSize(width: 390, height: 1280))
    assertSnapshot(matching: vc, as: .image(perceptualPrecision: perceptualPrecision))
  }
  
  func testSwitchViewController() throws {
    let vc = UINavigationController(rootViewController: SwitchViewController())
    assertSnapshot(matching: vc, as: .image(perceptualPrecision: perceptualPrecision))
  }
  
  func testSegmentedControlViewController() throws {
    let vc = UINavigationController(rootViewController: SegmentedControlViewController())
    assertSnapshot(matching: vc, as: .image(perceptualPrecision: perceptualPrecision))
  }
}
