//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import SwiftUI
import VitaminCore

@available(iOS 13, *)
public struct VitaminTextField: View {
    var label: String
    var placeholder: String
    var icon: UIImage?
    var helperText: String
    var characterLimit: Int?

    @Binding var state: VitaminTextFieldState
    @Binding var value: String

    public init(label: String,
                placeholder: String,
                icon: UIImage? = nil,
                helperText: String,
                characterLimit: Int?,
                text: Binding<String>,
                state: Binding<VitaminTextFieldState>) {
        self.label = label
        self.placeholder = placeholder
        self.icon = icon
        self.helperText = helperText
        self.characterLimit = characterLimit
        self._state = state
        self._value = text
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            makeLabel()
            VitaminTextFieldView(placeholder: placeholder,
                                 helperText: helperText,
                                 characterLimit: characterLimit,
                                 state: $state,
                                 text: $value)
        }
        .padding()
    }

    private func makeImage(image: UIImage,
                           foregroundColor: Color?) -> some View {
        HStack() {
            Spacer()
            Image(uiImage: image)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(foregroundColor)
                .frame(width: 20, height: 20)
                .padding(12)
        }
    }

    private func makeLabel() -> some View {
        Text(label)
            .vitaminTextStyle(.callout)
            .foregroundColor(state.textColor.swiftUIColor)
    }
}

@available(iOS 13, *)
struct VitaminTextField_Previews: PreviewProvider {

    static var previews: some View {
        VitaminTextField(label: "Montant",
                         placeholder: "Insérer un montant",
                         icon: UIImage(systemName: "calendar"),
                         helperText: "Veuillez insérer un montant exact",
                         characterLimit: 10,
                         text: Binding.constant(""),
                         state: Binding.constant(.error))
    }
}

#endif
