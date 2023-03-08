//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminSwiftUI
import VitaminCore

@available(iOS 13, *)
struct ButtonsView: View {
    @State private var enabled = true
    @State private var fullWidth = false

    var body: some View {
        VStack {
            VStack {
                Toggle("Show enabled state", isOn: $enabled.animation())
                Toggle("Show full width", isOn: $fullWidth.animation())
            }.padding()
            List {
                makeButtonRows()
            }
        }
        .frame(maxWidth: .infinity)
        .customNavigationTitle("Button", displayMode: .inline)
    }
}

@available(iOS 13, *)
extension ButtonsView {
    @ViewBuilder
    func makeButtonRows() -> some View {
        let buttonStyles = ButtonModel.buttonStyles
        ForEach(buttonStyles) { buttonStyle in
            self.makeButtonRow(buttonStyle)
        }
    }

    func makeButtonRow(_ buttonStyle: ButtonModel.ButtonStyle) -> some View {
        VStack {
            makeButton(
                style: buttonStyle.style,
                size: .medium,
                iconType: .trailing(
                    image: Vitamix.Line.Logos.apple.image,
                    renderingMode: .template))
            makeButton(
                style: buttonStyle.style,
                size: .large,
                iconType: .leading(
                    image: Vitamix.Line.System.arrowRightS.image,
                    renderingMode: .template))
            HStack {
                makeButton(
                    style: buttonStyle.style,
                    size: .medium,
                    iconType: .alone(
                        image: Vitamix.Line.Logos.apple.image,
                        renderingMode: .template))
                makeButton(
                    style: buttonStyle.style,
                    size: .large,
                    iconType: .alone(
                        image: Vitamix.Line.System.arrowRightS.image,
                        renderingMode: .template))
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .background(buttonStyle.style.needsReversedBackground ?
                    VitaminColor.Core.Background.brandPrimary.swiftUIColor :
                        VitaminColor.Core.Background.primary.swiftUIColor)
    }

    func makeButton(
        style: VitaminButtonStyle,
        size: VitaminButtonSize,
        iconType: VitaminButton.IconType
    ) -> some View {
        VitaminButton(
            text: style.rawValue,
            style: style,
            size: size,
            fullWidth: fullWidth,
            iconType: iconType) {
                    // no action defined
        }
        .disabled(!enabled)
    }
}

@available(iOS 13, *)
struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
#endif
