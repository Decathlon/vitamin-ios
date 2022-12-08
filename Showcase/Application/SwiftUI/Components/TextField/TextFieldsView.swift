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
    @State private var addHelperText = false
    @State private var characterLimit: Int = 0
    @State private var icon = Image(systemName: "heart")

    var body: some View {
        VStack {
            makeConfigurationView()
            Form {
                makeDynamicSection()
                makeStatesSection()
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
            makeStylePicker()
            Toggle("Show icon", isOn: $showIcon)
            Toggle("Add helper text", isOn: $addHelperText)
            Stepper(makeCharacterLimitText(),
                    value: $characterLimit,
                    in: 0...30)
        }
        .padding(.horizontal, 10)
    }

    private func makeStylePicker() -> some View {
        Picker("Style", selection: $style) {
            ForEach(TextFieldModel.styles) { style in
                Text(style.style.rawValue.capitalized).tag(style.style)
            }
        }
        .pickerStyle(.segmented)
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

    private func makeDynamicSection() -> some View {
        makeSection("Dynamic") {
            makeVitaminTextField(state: .standard, isDynamic: true)
        }
    }

    private func makeStatesSection() -> some View {
        makeSection("States") {
            ForEach(TextFieldModel.states) { state in
                makeVitaminTextField(state: state.state)
            }
        }
        .disabled(true)
    }

    private func makeVitaminTextField(
        state: VitaminTextFieldState,
        isDynamic: Bool = false
    ) -> some View {
        VitaminTextFieldView(style: style,
                             state: state,
                             showIcon: showIcon,
                             addHelperText: addHelperText,
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
