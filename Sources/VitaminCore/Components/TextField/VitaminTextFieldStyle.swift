//
//  Vitamin iOS
//  Apache License 2.0
//

/// Enum representing the style of `VitaminTextField`.
public enum VitaminTextFieldStyle: String {
    case outlined
    case filled
}

extension VitaminTextFieldStyle {
    @available(*, deprecated, renamed: "outlined")
    public static var outline: VitaminTextFieldStyle { .outlined }
}
