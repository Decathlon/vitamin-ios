//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

/// Extension that adds the ability to aby `UIViewController` to disply a `VitaminSnackbar` at the bottom of its view
public extension UIViewController {
    private static let horizontalPadding = 10.0
    static let snackbarVerticalPadding = 10.0

    /// Method that will push a `VitaminSnackbar`at the bottom of the controller's view.
    /// Every property of the snackbar is settable
    /// - Parameters:
    ///   - title: title of the `VitaminSnackbar`. Mandatory
    ///   - content: content of the `VitaminSnackbar`. Mandatory
    ///   - image: optional image of the `VitaminSnackbar`. `nil` by default
    ///   - autoDismiss: indicates if the `VitaminSnackbar` should be automatically dismmissed after a delay. Default value is `true`
    ///   - dismissDelay: delay after which the `VitaminSnackbar`is dimissed automatically. only used if autodimiss is `true`
    ///   - dismissOnTap: indicates if the `VitaminSnackbar`should be dismissed when user taps on it. Default value id `true`
    ///   - bottomMargin: space betwwen the bottom of the view and the bottom of the `VitaminSnackbar`. Default value is 10
    ///   - maxWidth: optional max width of the `VitaminSnackbar`. It set to `nil`, width of the view minus 10 on each side will e applied.
    ///   default value id `nil`
    ///
    func pushVitaminSnackbar(
        title: String,
        message: String,
        image: UIImage? = nil,
        autoDismiss: Bool = true,
        dismissDelay: TimeInterval = VitaminSnackbar.defaultDismissDelay,
        dismissOnTap: Bool = true,
        bottomMargin: CGFloat = snackbarVerticalPadding,
        maxWidth: CGFloat? = nil
    ) {
        dismissExistingSnackBar {
            let snackbar = VitaminSnackbar(
                title: title,
                message: message,
                image: image,
                autoDismiss: autoDismiss,
                dismissDelay: dismissDelay,
                dismissOnTap: dismissOnTap,
                maxWidth: maxWidth ?? self.view.frame.width - 2 * Self.horizontalPadding
            )

            self.view.addSubview(snackbar)
            snackbar.fadeIn(duration: VitaminSnackbar.appearAndDisappearDuration)

            snackbar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            snackbar.bottomAnchor.constraint(
                equalTo: self.view.bottomAnchor,
                constant: -bottomMargin
            ).isActive = true
        }
    }

    // Serach for a already present snack bar, and dismiss it, then execute the completion
    private func dismissExistingSnackBar(completion: @escaping () -> Void ) {
        for snackbar in view.subviews where snackbar is VitaminSnackbar {
            if let snackbar = snackbar as? VitaminSnackbar {
                snackbar.dismiss()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + VitaminSnackbar.appearAndDisappearDuration) {
            completion()
        }
    }
}
