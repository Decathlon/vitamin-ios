//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

/// Implementation of the Vitamin Snackbar
public class VitaminSnackbar: UIView {
    /// default dismiss delay
    public static var defaultDismissDelay = 5.0
    /// default max width
    public static var defaultMaxWidth = 320.0
    /// delay of fade in or out
    public static var appearAndDisappearDuration = 0.25

    /// Max width of the snackbar.
    /// Width will automatically adjust to message, but will not be above this maxWidth
    /// Default value is 320
    public var maxWidth: CGFloat = defaultMaxWidth {
        didSet {
            applyNewMaxWidth()
        }
    }
    /// Title of the snackbar, that will be displayed in bold
    public var title = "" {
        didSet {
            applyNewTexts()
        }
    }
    /// Message of the snackbar, that will be displayed beyond the title
    public var message = "" {
        didSet {
            applyNewTexts()
        }
    }
    /// Image that will be displayed at the left of the snackbar
    /// If present, title and message will be aligned on the left
    /// if not, title and message will be centered
    public var image: UIImage? {
        didSet {
            applyNewImage()
        }
    }
    /// Indicates if the snackbar should automatically be dismissed after a delay (see dismissDelay)
    /// Default value is true
    public var autoDismiss = true {
        willSet {
            applyNewAutoDismiss(newValue)
        }
    }
    /// indicates if the snackbar should be dismissed when user taps on it
    /// Default value is true
    public var dismissOnTap = true {
        didSet {
            applyNewDismissOnTap()
        }
    }
    /// delay for auto dismissal
    /// default value is 5 seconds
    public var dismissDelay = defaultDismissDelay {
        didSet {
            applyNewDismissDelay()
        }
    }

    // Internal timer used for auto dimiss
    var timer: Timer?

    /// Initializer that allows to specify all properties
    public required init(
        contentConfiguration: VitaminSnackbar.ContentConfiguration,
        dismissConfiguration: VitaminSnackbar.DismissConfiguration,
        maxWidth: CGFloat = defaultMaxWidth
    ) {
        super.init(frame: .zero)
        self.title = contentConfiguration.title
        self.message = contentConfiguration.message
        self.image = contentConfiguration.image
        self.maxWidth = maxWidth
        self.autoDismiss = dismissConfiguration.autoDismiss
        self.dismissDelay = dismissConfiguration.dismissDelay
        self.dismissOnTap = dismissConfiguration.dismissOnTap
        commonInit()
    }

    /// An initializer that restores a `VitaminSnackbar` from a serialized version (used in storyboard)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    /// An initializer that instantiate a `VitaminSnackbar` in a frame, with all default values for properties
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    // constants for constraints
    private var topBottomMargin = 12.0
    private var imageWidthAndHeight = 40.0
    private var maxCornerRadius = 40.0
    private var imageLeftAndRightMargin = 24.0
    private var rightMargin = 24.0

    // UILabel containing the title
    lazy private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    // UILabel containing the contet
    lazy private var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()

    // UIImageView containing the image
    lazy private var icon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()

    // GestureRecognizer used for dismiss on tap
    private var gestureRecognizer: UITapGestureRecognizer?

    // common initialization method called in every public constructor
    private func commonInit() {
        setUpViews()
    }

    // container for common layout constraints whether there is an image or not
    private var commonConstraints: [NSLayoutConstraint] = []
    // container for layout constraints when there is an image
    private var withImageConstraints: [NSLayoutConstraint] = []
    // container for layout constraints when there is no image
    private var withoutImageConstraints: [NSLayoutConstraint] = []

    public override func layoutSubviews() {
        self.layer.cornerRadius = min(self.intrinsicContentSize.height / 2, maxCornerRadius)

        // apply constraints that do not depend on the presence of an image
        NSLayoutConstraint.activate(commonConstraints)
    }

    public override var intrinsicContentSize: CGSize {
        let width = min(titleLabel.intrinsicContentSize.width + 2 * rightMargin, maxWidth)

        let height = titleLabel.intrinsicContentSize.height +
            messageLabel.intrinsicContentSize.height +
            2 * topBottomMargin
        return CGSize(width: width, height: height)
    }
}

// MARK: - public method for making VitaminSnackbar appear or disappear
extension VitaminSnackbar {
    /// Dismiss the `VitaminSnackbar` by fading it out
    /// It will ignore any auto dismissal delay, and dismiss the snackbar instantly`
    @objc public func dismiss() {
        timer?.invalidate()
        self.internalDismiss()
    }

    public func display() {
        self.fadeIn(duration: Self.appearAndDisappearDuration)
    }
}

// MARK: - private method for setting views
extension VitaminSnackbar {
    // method that set ups subviews for the snackbar
    private func setUpViews() {
        setupCommonConstraints()
        setupWithImageConstraints()
        setupWithoutImageConstraints()

        // setup container apperance
        self.backgroundColor = VitaminColor.Core.Background.tertiary
        self.translatesAutoresizingMaskIntoConstraints = false

        // setup label
        messageLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        messageLabel.textAlignment = .center
        self.addSubview(titleLabel)
        self.addSubview(messageLabel)

        // apply changes for every property
        applyNewDismissOnTap()
        applyNewTexts()
        applyNewImage()
        if autoDismiss {
            launchAutoDismissal()
        }
    }
}

// MARK: - private methods for applying changes
extension VitaminSnackbar {
    // set up common layout constraints without activating them
    private func setupCommonConstraints() {
        commonConstraints.append(titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: topBottomMargin))
        commonConstraints.append(
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -topBottomMargin)
        )
        commonConstraints.append(titleLabel.widthAnchor.constraint(equalTo: messageLabel.widthAnchor))
        commonConstraints.append(titleLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor))
        commonConstraints.append(widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth))
    }

    // set up layout constraints for image case without activating them
    private func setupWithImageConstraints() {
        withImageConstraints.append(
            titleLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: imageLeftAndRightMargin)
        )
        withImageConstraints.append(messageLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor))
        withImageConstraints.append(icon.widthAnchor.constraint(equalToConstant: imageWidthAndHeight))
        withImageConstraints.append(icon.heightAnchor.constraint(equalToConstant: imageWidthAndHeight))
        withImageConstraints.append(
            icon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: imageLeftAndRightMargin)
        )
        withImageConstraints.append(icon.centerYAnchor.constraint(equalTo: self.centerYAnchor))
        withImageConstraints.append(
            messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -rightMargin)
        )
    }

    // set up layout constraints for no image case without activating them
    private func setupWithoutImageConstraints() {
        withoutImageConstraints.append(titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        withoutImageConstraints.append(messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        withoutImageConstraints.append(
            messageLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, constant: -2 * rightMargin)
        )
    }

    // apply changes when title or message are changed
    private func applyNewTexts() {
        titleLabel.attributedText = title.styled(as: .footnoteBold, with: VitaminColor.Core.Content.primary)
        messageLabel.attributedText = message.styled(as: .footnote, with: VitaminColor.Core.Content.tertiary)
    }

    // apply changes when an image is set or changed
    private func applyNewImage() {
        if let image = image {
            icon.image = image
            if icon.superview == nil {
                self.addSubview(icon)
            }
            NSLayoutConstraint.deactivate(withoutImageConstraints)
            NSLayoutConstraint.activate(withImageConstraints)
            titleLabel.textAlignment = .left
            messageLabel.textAlignment = .left
            let margins = rightMargin + imageWidthAndHeight + imageLeftAndRightMargin
            messageLabel.preferredMaxLayoutWidth = maxWidth - margins
        } else {
            NSLayoutConstraint.activate(withoutImageConstraints)
            NSLayoutConstraint.deactivate(withImageConstraints)
            icon.removeFromSuperview()
            titleLabel.textAlignment = .center
            messageLabel.textAlignment = .center
            messageLabel.preferredMaxLayoutWidth = maxWidth - 2 * rightMargin
        }
    }

    // launch or invalidate timer for aut dismissal when the autodismiss prperty is set
    private func applyNewAutoDismiss(_ newValue: Bool) {
        if autoDismiss, !newValue {
            timer?.invalidate()
        } else if !autoDismiss, newValue {
            launchAutoDismissal()
        }
    }

    // apply changes when dismiss delay is set
    private func applyNewDismissDelay() {
        timer?.invalidate()
        if autoDismiss {
            launchAutoDismissal()
        }
    }

    // apply changes when dismissOnTap property is set
    private func applyNewDismissOnTap() {
        if let gestureRecognizer = gestureRecognizer {
            if dismissOnTap {
                self.addGestureRecognizer(gestureRecognizer)
            } else {
                self.removeGestureRecognizer(gestureRecognizer)
            }
        } else if dismissOnTap {
            gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
            if let gestureRecognizer = gestureRecognizer {
                self.addGestureRecognizer(gestureRecognizer)
            }
        }
    }

    // apply layout changes when maxWidth property is set
    private func applyNewMaxWidth() {
        NSLayoutConstraint.deactivate(commonConstraints)
        commonConstraints = []
        setupCommonConstraints()
        NSLayoutConstraint.activate(commonConstraints)
    }
}

// MARK: Private methods for dismissal or display handling
extension VitaminSnackbar {
    // launch the timer that will automatically dismiss
    private func launchAutoDismissal() {
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
