//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminSwiftUI

@available(iOS 13, *)
struct ButtonsView: View {
    var body: some View {
        List {
            let styles = ButtonModel.items
            ForEach(styles) { style in
                makeButtonRow(style)
            }
        }
    }
}

@available(iOS 13, *)
extension ButtonsView {
    func makeButtonRow(_ style: ButtonModel.Item) -> some View {
        VStack(alignment: .center) {
            Button(style.style.rawValue) {}.buttonStyle(VitaminButtonUIStyle(style: style.style, size: .medium))
            Button(style.style.rawValue) {}.buttonStyle(VitaminButtonUIStyle(style: style.style, size: .large))
            HStack {
                Button(style.style.rawValue) {}.buttonStyle(VitaminButtonUIStyle(style: style.style, size: .medium))
                Button(style.style.rawValue) {}.buttonStyle(VitaminButtonUIStyle(style: style.style, size: .large))
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

@available(iOS 13, *)
struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
