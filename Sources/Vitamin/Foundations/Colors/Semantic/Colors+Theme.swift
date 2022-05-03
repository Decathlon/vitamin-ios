//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

extension VitaminColor {
    public enum Theme {
        public enum Core {
            public enum Light {
                public static let backgroundPrimary = VitaminColor.Base.white.color
                public static let backgroundSecondary = VitaminColor.Base.grey50.color
                public static let backgroundTertiary = VitaminColor.Base.grey100.color
                public static let backgroundBrandPrimary = VitaminColor.Base.blue400.color
                public static let backgroundBrandSecondary = VitaminColor.Base.blue50.color
                public static let backgroundAccent = VitaminColor.Base.yellow400.color
                @available(*, deprecated, renamed: "backgroundAlert")
                public static let backgroundDiscount = VitaminColor.Base.red400.color
                public static let backgroundAlert = VitaminColor.Base.red400.color
                public static let backgroundPrimaryReversed = VitaminColor.Base.black.color
                public static let backgroundBrandPrimaryReversed = VitaminColor.Base.white.color

                public static let contentPrimary = VitaminColor.Base.black.color
                public static let contentSecondary = VitaminColor.Base.grey600.color
                public static let contentTertiary = VitaminColor.Base.grey500.color
                public static let contentAction = VitaminColor.Base.blue500.color
                public static let contentActive = VitaminColor.Base.blue400.color
                public static let contentInactive = VitaminColor.Base.grey400.color
                public static let contentNegative = VitaminColor.Base.red400.color
                public static let contentWarning = VitaminColor.Base.orange400.color
                public static let contentPositive = VitaminColor.Base.conifer400.color
                public static let contentInformation = VitaminColor.Base.blue400.color
                public static let contentAccent = VitaminColor.Base.black.color
                public static let contentVisited = VitaminColor.Base.purple400.color
                public static let contentPrimaryReversed = VitaminColor.Base.white.color
                public static let contentActionReversed = VitaminColor.Base.white.color
                public static let contentVisitedReversed = VitaminColor.Base.purple200.color

                public static let borderPrimary = VitaminColor.Base.grey200.color
                public static let borderSecondary = VitaminColor.Base.grey100.color
                public static let borderTertiary = VitaminColor.Base.white.color
                public static let borderActive = VitaminColor.Base.blue400.color
                public static let borderInactive = VitaminColor.Base.grey400.color
                public static let borderNegative = VitaminColor.Base.red400.color
                public static let borderWarning = VitaminColor.Base.orange400.color
                public static let borderPositive = VitaminColor.Base.conifer400.color
                public static let borderInformation = VitaminColor.Base.blue400.color
                public static let borderPrimaryReversed = VitaminColor.Base.black.color

                public static let decorativeGravel = VitaminColor.Base.grey100.color
                public static let decorativeBrick = VitaminColor.Base.red100.color
                public static let decorativeSaffron = VitaminColor.Base.orange100.color
                public static let decorativeGold = VitaminColor.Base.yellow100.color
                public static let decorativeJade = VitaminColor.Base.conifer100.color
                public static let decorativeEmerald = VitaminColor.Base.green100.color
                public static let decorativeCobalt = VitaminColor.Base.blue100.color
                public static let decorativeAmethyst = VitaminColor.Base.purple100.color

                public static let hoverPrimary = VitaminColor.Base.blue50.color

                public static let shadowShadow = VitaminColor.Base.blue600.color.withAlphaComponent(0.1)
            }

            public enum Dark {
                public static let backgroundPrimary = VitaminColor.Base.grey900.color
                public static let backgroundSecondary = VitaminColor.Base.black.color
                public static let backgroundTertiary = VitaminColor.Base.grey800.color
                public static let backgroundBrandPrimary = VitaminColor.Base.blue300.color
                public static let backgroundBrandSecondary = VitaminColor.Base.blue700.color
                public static let backgroundAccent = VitaminColor.Base.yellow400.color
                @available(*, deprecated, renamed: "backgroundAlert")
                public static let backgroundDiscount = VitaminColor.Base.red300.color
                public static let backgroundAlert = VitaminColor.Base.red300.color
                public static let backgroundPrimaryReversed = VitaminColor.Base.white.color
                public static let backgroundBrandPrimaryReversed = VitaminColor.Base.black.color

                public static let contentPrimary = VitaminColor.Base.white.color
                public static let contentSecondary = VitaminColor.Base.grey200.color
                public static let contentTertiary = VitaminColor.Base.grey300.color
                public static let contentAction = VitaminColor.Base.blue200.color
                public static let contentActive = VitaminColor.Base.blue300.color
                public static let contentInactive = VitaminColor.Base.grey500.color
                public static let contentNegative = VitaminColor.Base.red300.color
                public static let contentWarning = VitaminColor.Base.orange300.color
                public static let contentPositive = VitaminColor.Base.conifer300.color
                public static let contentInformation = VitaminColor.Base.blue300.color
                public static let contentAccent = VitaminColor.Base.black.color
                public static let contentVisited = VitaminColor.Base.purple300.color
                public static let contentPrimaryReversed = VitaminColor.Base.black.color
                public static let contentActionReversed = VitaminColor.Base.black.color
                public static let contentVisitedReversed = VitaminColor.Base.purple300.color

                public static let borderPrimary = VitaminColor.Base.grey700.color
                public static let borderSecondary = VitaminColor.Base.black.color
                public static let borderTertiary = VitaminColor.Base.grey800.color
                public static let borderActive = VitaminColor.Base.blue300.color
                public static let borderInactive = VitaminColor.Base.grey500.color
                public static let borderNegative = VitaminColor.Base.red300.color
                public static let borderWarning = VitaminColor.Base.orange300.color
                public static let borderPositive = VitaminColor.Base.conifer300.color
                public static let borderInformation = VitaminColor.Base.blue300.color
                public static let borderPrimaryReversed = VitaminColor.Base.white.color

                public static let decorativeGravel = VitaminColor.Base.grey600.color
                public static let decorativeBrick = VitaminColor.Base.red600.color
                public static let decorativeSaffron = VitaminColor.Base.orange600.color
                public static let decorativeGold = VitaminColor.Base.yellow700.color
                public static let decorativeJade = VitaminColor.Base.conifer700.color
                public static let decorativeEmerald = VitaminColor.Base.green600.color
                public static let decorativeCobalt = VitaminColor.Base.blue600.color
                public static let decorativeAmethyst = VitaminColor.Base.purple600.color

                public static let hoverPrimary = VitaminColor.Base.blue700.color

                public static let shadowShadow = VitaminColor.Base.blue200.color.withAlphaComponent(0.1)
            }
        }
    }
}

extension VitaminColor {
    public enum Core { }
}
