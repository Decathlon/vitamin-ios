//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminSwiftUI
import VitaminCore
import Combine

@available(iOS 13, *)
struct TextFieldsView: View {
    @State private var style: VitaminTextFieldStyle = .outlined
    @State private var showIcon = false
    @State private var characterLimit: Int = 0
    @State private var icon = Image(systemName: "heart")

    var body: some View {
        VStack {
            makeConfigurationView()
            Form {
                makeSection("Dynamic") {
                    makeVitaminTextField(state: .standard, isDynamic: true)
                }
                makeSection("States") {
                    ForEach(TextFieldModel.textFieldStates) { state in
                        makeVitaminTextField(state: state.state)
                    }
                }
                .disabled(true)
            }
        }
        .frame(maxWidth: .infinity)
        .customNavigationTitle("TextField", displayMode: .inline)
    }
}

@available(iOS 13, *)
extension TextFieldsView {
    private func makeConfigurationView() -> some View {
        VStack {
            Picker("Style", selection: $style) {
                Text("Outlined").tag(VitaminTextFieldStyle.outlined)
                Text("Filled").tag(VitaminTextFieldStyle.filled)
            }
            .pickerStyle(.segmented)
            Toggle("Show icon", isOn: $showIcon)
            Stepper(makeCharacterLimitText(),
                    value: $characterLimit,
                    in: 0...30)
        }
        .padding(.horizontal, 10)
    }

    private func makeCharacterLimitText() -> String {
        guard characterLimit > 0 else {
            return "No character limit"
        }

        guard characterLimit > 1 else {
            return "One character maximum"
        }

        return "\(characterLimit) characters maximum"
    }

    private func makeVitaminTextField(
        state: VitaminTextFieldState,
        isDynamic: Bool = false
    ) -> some View {
        VitaminTextFieldView(style: style,
                             state: state,
                             showIcon: showIcon,
                             characterLimit: characterLimit,
                             icon: icon,
                             isDynamic: isDynamic)
    }
}

@available(iOS 13, *)
struct TextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldsView()
    }
}

#endif
