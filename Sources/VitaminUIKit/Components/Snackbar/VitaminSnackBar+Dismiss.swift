//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit

// MARK: - public method for making VitaminSnackbar appear or disappear
extension VitaminSnackbar {
    /// Dismiss the `VitaminSnackbar` by fading it out
    /// It will ignore any auto dismissal delay, and dismiss the snackbar instantly
    public func dismiss() {
        timer?.invalidate()
        self.internalDismiss()
    }

    public func display() {
        self.fadeIn(duration: Self.appearAndDisappearDuration)
    }
}

extension VitaminSnackbar {
    // launch the timer that will automatically dismiss
    func launchAutoDismissal() {
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(dismissDelay), repeats: false) { _ in
            self.internalDismiss()
        }
    }

    // internal method to dismiss the `VitaminSnackbar`
    private func internalDismiss() {
        UIView.animate(
            withDuration: VitaminSnackbar.appearAndDisappearDuration,
            delay: 0
        ) {
            self.titleLabel.layer.opacity = 0
            self.messageLabel.layer.opacity = 0
            self.icon.layer.opacity = 0
            self.layer.opacity = 0
        } completion: { _ in
            self.removeFromSuperview()
        }
    }

    /// Make the snackbar appear by fading it in
    /// This method should only be called before first display of the snackbar, because it will force opacity to 0.
    /// If the `VitaminSnackbar` is already displayed when you call this method, it will first instantly disappear, then fade in
    func fadeIn(duration: TimeInterval, completion: (() -> Void )? = nil ) {
        self.titleLabel.layer.opacity = 0
        self.messageLabel.layer.opacity = 0
        self.icon.layer.opacity = 0
        self.layer.opacity = 0
        UIView.animate(
            withDuration: duration,
            delay: 0
        ) {
            self.titleLabel.layer.opacity = 1
            self.messageLabel.layer.opacity = 1
            self.icon.layer.opacity = 1
            self.layer.opacity = 1
        } completion: { _ in
            completion?()
        }
    }
}
