//
//  Vitamin iOS
//  Apache License 2.0
//
#if arch(x86_64) || arch(arm64)
import Foundation
import SwiftUI
import VitaminCore
import Combine

@available(iOS 13, *)
struct VitaminTextFieldView: View {
    var placeholder: String
    var helperText: String
    var icon: UIImage?
    let characterLimit: Int?

    @Binding var state: VitaminTextFieldState
    @Binding var text: String
    @State var counterText: String?

    var body: some View {
        ZStack {
            makeTextField()
            makeIcon()
        }
        makeUnderText()
    }

    @ViewBuilder
    private func makeIcon() -> some View {
        if let stateIcon = state.icon {
            makeImage(image: stateIcon,
                      foregroundColor: state.standardIconColor.swiftUIColor)
        } else if let icon = icon {
            makeImage(image: icon,
                      foregroundColor: state.customIconColor.swiftUIColor)
        }
    }

    private func makeImage(
        image: UIImage,
        foregroundColor: Color?
    ) -> some View {
        HStack {
            Spacer()
            Image(uiImage: image)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(foregroundColor)
                .frame(width: 20, height: 20)
                .padding(12)
        }
    }

    private func makeTextField() -> some View {
        TextField(placeholder, text: $text)
            .vitaminTextStyle(.body)
            .onReceive(Just(text)) { newValue in
                text = truncateIfLimit(text: newValue)
                counterText = makeCharactersCounterText(newValue)
            }
            .contentShape(Rectangle())
            .padding(EdgeInsets(top: 8,
                                leading: 12,
                                bottom: 8,
                                trailing: 44))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .strokeBorder(state.borderColor.swiftUIColor,
                                  lineWidth: state.borderWidth)
            )
    }

    private func makeUnderText() -> some View {
        HStack {
            Text(helperText)
                .vitaminTextStyle(.caption1)
            Spacer()
            if let characterCounter = counterText {
                Text(characterCounter)
                    .vitaminTextStyle(.caption1)
            }
        }
        .foregroundColor(state.helperAndCounterColor.swiftUIColor)
    }

    private func makeCharactersCounterText(_ text: String) -> String? {
        guard let characterLimit = characterLimit else {
            return nil
        }

        return "\(text.count)/\(characterLimit)"
    }

    private func truncateIfLimit(text: String) -> String {
        guard let characterLimit = characterLimit else {
            return text
        }

        if text.count >= characterLimit {
            return String(text.prefix(characterLimit))
        } else {
            return text
        }
    }
}
#endif
