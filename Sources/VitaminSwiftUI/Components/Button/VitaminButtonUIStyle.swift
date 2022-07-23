//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminCore

@available(iOS 13, *)
struct VitaminButtonUIStyle: ButtonStyle {
    let style: VitaminButtonStyle
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.foregroundColor(style.foregroundColor.swiftUIColor)
    }
}
