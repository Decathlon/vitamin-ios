// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import UIKit.UIColor

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
public struct VitaminColor {
  public let rgbaValue: UInt32
  public var color: UIColor { return UIColor(named: self) }

  public enum Base {
    public static let black = VitaminColor(rgbaValue: 0x001018ff)
    public static let blue100 = VitaminColor(rgbaValue: 0xbedeefff)
    public static let blue200 = VitaminColor(rgbaValue: 0x7ebee0ff)
    public static let blue300 = VitaminColor(rgbaValue: 0x3d9accff)
    public static let blue400 = VitaminColor(rgbaValue: 0x007dbcff)
    public static let blue50 = VitaminColor(rgbaValue: 0xe7f3f9ff)
    public static let blue500 = VitaminColor(rgbaValue: 0x00689dff)
    public static let blue600 = VitaminColor(rgbaValue: 0x00537dff)
    public static let blue700 = VitaminColor(rgbaValue: 0x012b49ff)
    public static let conifer100 = VitaminColor(rgbaValue: 0xcbf0c7ff)
    public static let conifer200 = VitaminColor(rgbaValue: 0x88d77fff)
    public static let conifer300 = VitaminColor(rgbaValue: 0x74c76aff)
    public static let conifer400 = VitaminColor(rgbaValue: 0x23a942ff)
    public static let conifer50 = VitaminColor(rgbaValue: 0xeafbe8ff)
    public static let conifer500 = VitaminColor(rgbaValue: 0x41a036ff)
    public static let conifer600 = VitaminColor(rgbaValue: 0x378d2eff)
    public static let conifer700 = VitaminColor(rgbaValue: 0x256c1dff)
    public static let green100 = VitaminColor(rgbaValue: 0xbeefe2ff)
    public static let green200 = VitaminColor(rgbaValue: 0x7cdfc4ff)
    public static let green300 = VitaminColor(rgbaValue: 0x21ce9cff)
    public static let green400 = VitaminColor(rgbaValue: 0x02be8aff)
    public static let green50 = VitaminColor(rgbaValue: 0xe4f9f3ff)
    public static let green500 = VitaminColor(rgbaValue: 0x029e73ff)
    public static let green600 = VitaminColor(rgbaValue: 0x017f5cff)
    public static let green700 = VitaminColor(rgbaValue: 0x006f43ff)
    public static let grey100 = VitaminColor(rgbaValue: 0xeff1f3ff)
    public static let grey200 = VitaminColor(rgbaValue: 0xd9dde1ff)
    public static let grey300 = VitaminColor(rgbaValue: 0xb3bac3ff)
    public static let grey400 = VitaminColor(rgbaValue: 0x8996a2ff)
    public static let grey50 = VitaminColor(rgbaValue: 0xf7f8f9ff)
    public static let grey500 = VitaminColor(rgbaValue: 0x687787ff)
    public static let grey600 = VitaminColor(rgbaValue: 0x4e5d6bff)
    public static let grey700 = VitaminColor(rgbaValue: 0x344450ff)
    public static let grey800 = VitaminColor(rgbaValue: 0x1a2a34ff)
    public static let grey900 = VitaminColor(rgbaValue: 0x142129ff)
    public static let orange100 = VitaminColor(rgbaValue: 0xffe4d6ff)
    public static let orange200 = VitaminColor(rgbaValue: 0xfac3a5ff)
    public static let orange300 = VitaminColor(rgbaValue: 0xfa9c69ff)
    public static let orange400 = VitaminColor(rgbaValue: 0xff600aff)
    public static let orange50 = VitaminColor(rgbaValue: 0xfff3edff)
    public static let orange500 = VitaminColor(rgbaValue: 0xc15e29ff)
    public static let orange600 = VitaminColor(rgbaValue: 0x9a4b21ff)
    public static let orange700 = VitaminColor(rgbaValue: 0x673216ff)
    public static let purple100 = VitaminColor(rgbaValue: 0xdccfddff)
    public static let purple200 = VitaminColor(rgbaValue: 0xac8dafff)
    public static let purple300 = VitaminColor(rgbaValue: 0x966f9aff)
    public static let purple400 = VitaminColor(rgbaValue: 0x6c4e6fff)
    public static let purple50 = VitaminColor(rgbaValue: 0xf2edf2ff)
    public static let purple500 = VitaminColor(rgbaValue: 0x5b415dff)
    public static let purple600 = VitaminColor(rgbaValue: 0x49354bff)
    public static let purple700 = VitaminColor(rgbaValue: 0x2c202dff)
    public static let red100 = VitaminColor(rgbaValue: 0xfec9cbff)
    public static let red200 = VitaminColor(rgbaValue: 0xfd9297ff)
    public static let red300 = VitaminColor(rgbaValue: 0xfd7278ff)
    public static let red400 = VitaminColor(rgbaValue: 0xe3262fff)
    public static let red50 = VitaminColor(rgbaValue: 0xfeecedff)
    public static let red500 = VitaminColor(rgbaValue: 0xab0009ff)
    public static let red600 = VitaminColor(rgbaValue: 0x870007ff)
    public static let red700 = VitaminColor(rgbaValue: 0x5a0005ff)
    public static let white = VitaminColor(rgbaValue: 0xffffffff)
    public static let yellow100 = VitaminColor(rgbaValue: 0xfffbc7ff)
    public static let yellow200 = VitaminColor(rgbaValue: 0xfff58dff)
    public static let yellow300 = VitaminColor(rgbaValue: 0xfff370ff)
    public static let yellow400 = VitaminColor(rgbaValue: 0xffea28ff)
    public static let yellow50 = VitaminColor(rgbaValue: 0xfffef0ff)
    public static let yellow500 = VitaminColor(rgbaValue: 0xbcb02cff)
    public static let yellow600 = VitaminColor(rgbaValue: 0x999028ff)
    public static let yellow700 = VitaminColor(rgbaValue: 0x67611bff)
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension UIColor {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map {
      CGFloat($0 & 0xff)
    }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

public extension UIColor {
  convenience init(named color: VitaminColor) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
