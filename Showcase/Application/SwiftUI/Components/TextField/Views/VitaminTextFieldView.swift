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
struct VitaminTextFieldView: View {
    @State private var text = ""
    @State private var selected = false
    var style: VitaminTextFieldStyle
    @State var state: VitaminTextFieldState = .standard
    @State var helperText = "Helper text"
    var showIcon = false
    var characterLimit: Int = 0
    @State var icon = Vitamix.Line.Health.heart.swiftUIImage
    var isDynamic = false

    init(
        style: VitaminTextFieldStyle,
        state: VitaminTextFieldState,
        showIcon: Bool = false,
        characterLimit: Int,
        icon: Image,
        isDynamic: Bool = false
    ) {
        self.text = ""
        self.style = style
        self.state = state
        self.helperText = "Helper text"
        self.showIcon = showIcon
        self.characterLimit = characterLimit
        self.icon = icon
        self.isDynamic = isDynamic
    }

    var body: some View {
        VitaminTextField(style: style,
                         text: makeTextConfiguration(),
                         state: $state,
                         icon: makeIconConfiguration(),
                         characterLimit: makeCharacterLimitConfiguration())
        .compatibilityOnChange(of: text, perform: handleChanges(newValue:))
    }
}

@available(iOS 13, *)
extension VitaminTextFieldView {
    private func makeTextConfiguration() -> VitaminTextField.TextConfiguration {
        VitaminTextField.TextConfiguration(label: state.rawValue.capitalized,
                                           placeholder: "Placeholder",
                                           helperText: helperText,
                                           text: $text)
    }

    private func makeIconConfiguration() -> VitaminTextField.IconConfiguration? {
        guard showIcon else {
            return nil
        }

        return VitaminTextField.IconConfiguration(icon: icon) {
            selected.toggle()
            icon = makeIcon().swiftUIImage
        }
    }

    private func makeCharacterLimitConfiguration() -> VitaminTextField.CharacterLimitConfiguration? {
        guard characterLimit > 0 else {
            return nil
        }

        return VitaminTextField.CharacterLimitConfiguration(text: $text, limit: characterLimit)
    }

    private func handleChanges(newValue: String) {
        guard isDynamic else {
            return
        }

        if !newValue.isEmpty {
            let isSuccess = newValue == "OK"
            if isSuccess {
                state = .success
                helperText = "Perfect ✅"
            } else {
                state = .error
                helperText = "You need to enter 'OK'"
            }
        } else {
            state = .active
            helperText = "Helper text"
        }
    }

    private func makeIcon() -> VitaminImageAsset {
        if selected {
            return Vitamix.Fill.Health.heart
        } else {
            return Vitamix.Line.Health.heart
        }
    }
}

#endif
