// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import UIKit.UIFont

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum VitaminFontFamily {
  public enum Roboto {
    public static let bold = VitaminFontConvertible(name: "Roboto-Bold", family: "Roboto", path: "Roboto-Bold.ttf")
    public static let regular = VitaminFontConvertible(name: "Roboto-Regular", family: "Roboto", path: "Roboto-Regular.ttf")
    public static let all: [VitaminFontConvertible] = [bold, regular]
  }
  public enum RobotoCondensed {
    public static let boldItalic = VitaminFontConvertible(name: "RobotoCondensed-BoldItalic", family: "Roboto Condensed", path: "RobotoCondensed-BoldItalic.ttf")
    public static let all: [VitaminFontConvertible] = [boldItalic]
  }
  public static let allCustomFonts: [VitaminFontConvertible] = [Roboto.all, RobotoCondensed.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct VitaminFontConvertible {
  public let name: String
  public let family: String
  public let path: String

  public func font(size: CGFloat) -> UIFont {
    guard let font = UIFont(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

public extension UIFont {
  convenience init?(font: VitaminFontConvertible, size: CGFloat) {
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
