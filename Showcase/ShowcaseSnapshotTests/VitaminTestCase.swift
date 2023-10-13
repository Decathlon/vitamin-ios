import Foundation
import XCTest
import SnapshotTesting

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
