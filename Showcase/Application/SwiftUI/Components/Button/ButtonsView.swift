//
//  Vitamin iOS
//  Apache License 2.0
//

import SwiftUI
import VitaminSwiftUI
import VitaminCore

@available(iOS 13, *)
struct ButtonsView: View {
    @State var enabled = true

    var body: some View {
        VStack {
            Toggle("Show enabled state", isOn: $enabled)
                .padding()
            List {
                let styles = ButtonModel.items
                ForEach(styles) { style in
                    self.makeButtonRow(style)
                }
            }
        }.frame(maxWidth: .infinity)
    }
}

@available(iOS 13, *)
extension ButtonsView {
    func makeButtonRow(_ style: ButtonModel.Item) -> some View {
        VStack(alignment: .center) {
            VitaminButton(
                text: style.style.rawValue,
                style: style.style,
                size: .medium,
                iconType: .trailing(
                    image: Vitamix.Line.Logos.apple.image,
                    renderingMode: .alwaysTemplate)) {}
                .disabled(enabled == false)
            VitaminButton(
                text: style.style.rawValue,
                style: style.style,
                size: .large,
                iconType: .leading(
                    image: Vitamix.Line.System.arrowRightS.image,
                    renderingMode: .alwaysTemplate)) {}
                .disabled(enabled == false)
            HStack {
                VitaminButton(
                    text: style.style.rawValue,
                    style: style.style,
                    size: .medium,
                    iconType: .alone(
                        image: Vitamix.Line.Logos.apple.image,
                        renderingMode: .alwaysTemplate)) {}
                    .disabled(enabled == false)
                VitaminButton(
                    text: style.style.rawValue,
                    style: style.style,
                    size: .large,
                    iconType: .alone(
                        image: Vitamix.Line.System.arrowRightS.image,
                        renderingMode: .alwaysTemplate)) {}
                    .disabled(enabled == false)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .background(style.style.needsReversedBackground ?
                    VitaminColor.Core.Background.brandPrimary.swiftUIColor :
                        VitaminColor.Core.Background.primary.swiftUIColor)
    }
}

@available(iOS 13, *)
struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
