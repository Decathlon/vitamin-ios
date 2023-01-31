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
    public var maxWidth: CGFloat? {
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
            applyNewTapBehavior()
        }
    }
    /// delay for auto dismissal
    /// default value is 5 seconds
    public var dismissDelay = defaultDismissDelay {
        didSet {
            applyNewDismissDelay()
        }
    }

    /// action that will be triggered on tap
    /// This will be executed just before the dismissal if dismissOnTap is true
    public var actionOnTap: (() -> Void)? {
        didSet {
            applyNewTapBehavior()
        }
    }

    // Internal timer used for auto dimiss
    var timer: Timer?

    /// Initializer that allows to specify all properties
    public required init(
        contentConfiguration: VitaminSnackbar.ContentConfiguration,
        dismissConfiguration: VitaminSnackbar.DismissConfiguration,
        maxWidth: CGFloat? = nil,
        actionOnTap: (() -> Void)? = nil
    ) {
        super.init(frame: .zero)
        self.title = contentConfiguration.title
        self.message = contentConfiguration.message
        self.image = contentConfiguration.image
        self.maxWidth = maxWidth
        self.autoDismiss = dismissConfiguration.autoDismiss
        self.dismissDelay = dismissConfiguration.dismissDelay
        self.dismissOnTap = dismissConfiguration.dismissOnTap
        self.actionOnTap = actionOnTap
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

    private var internalMaxWidth = defaultMaxWidth

    // UILabel containing the title
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    // UILabel containing the contet
    lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()

    // UIImageView containing the image
    lazy var icon: UIImageView = {
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
}

// MARK: - public layout methods overriding
extension VitaminSnackbar {
    public override func layoutSubviews() {
        self.layer.cornerRadius = min(self.intrinsicContentSize.height / 2, maxCornerRadius)

        // apply constraints that do not depend on the presence of an image
        NSLayoutConstraint.activate(commonConstraints)
    }

    public override var intrinsicContentSize: CGSize {
        let width = min(
            max(titleLabel.intrinsicContentSize.width, messageLabel.intrinsicContentSize.width)
            + 2 * rightMargin, internalMaxWidth
        )

        let height = titleLabel.intrinsicContentSize.height +
            messageLabel.intrinsicContentSize.height +
            2 * topBottomMargin
        return CGSize(width: width, height: height)
    }

    public override func updateConstraints() {
        self.removeConstraints(commonConstraints)
        self.removeConstraints(withoutImageConstraints)
        self.removeConstraints(withImageConstraints)

        setupCommonConstraints()
        setupWithImageConstraints()
        setupWithoutImageConstraints()

        NSLayoutConstraint.activate(commonConstraints)
        if image == nil {
            NSLayoutConstraint.activate(withoutImageConstraints)
            NSLayoutConstraint.deactivate(withImageConstraints)
        } else {
            NSLayoutConstraint.deactivate(withoutImageConstraints)
            NSLayoutConstraint.activate(withImageConstraints)
        }
        super.updateConstraints()
    }
}

// MARK: - private method for setting views
extension VitaminSnackbar {
    // method that set ups subviews for the snackbar
    private func setUpViews() {
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
        applyNewMaxWidth()
        applyNewTapBehavior()
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
        commonConstraints = [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: topBottomMargin),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -topBottomMargin),
            titleLabel.widthAnchor.constraint(equalTo: messageLabel.widthAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor),
            widthAnchor.constraint(lessThanOrEqualToConstant: internalMaxWidth)
        ]
    }

    // set up layout constraints for image case without activating them
    private func setupWithImageConstraints() {
        withImageConstraints = [
            titleLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: imageLeftAndRightMargin),
            messageLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            icon.widthAnchor.constraint(equalToConstant: imageWidthAndHeight),
            icon.heightAnchor.constraint(equalToConstant: imageWidthAndHeight),
            icon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: imageLeftAndRightMargin),
            icon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -rightMargin)
        ]
    }

    // set up layout constraints for no image case without activating them
    private func setupWithoutImageConstraints() {
        withoutImageConstraints = [
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, constant: -2 * rightMargin)
        ]
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
            titleLabel.textAlignment = .left
            messageLabel.textAlignment = .left
        } else {
            icon.removeFromSuperview()
            titleLabel.textAlignment = .center
            messageLabel.textAlignment = .center
        }
        updateMessageLabelPreferredMaxWidth()
        setNeedsUpdateConstraints()
    }

    private func updateMessageLabelPreferredMaxWidth() {
        if image != nil {
            let margins = rightMargin + imageWidthAndHeight + imageLeftAndRightMargin
            messageLabel.preferredMaxLayoutWidth = internalMaxWidth - margins
        }
        messageLabel.preferredMaxLayoutWidth = internalMaxWidth - 2 * rightMargin
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

    // apply layout changes when maxWidth property is set
    private func applyNewMaxWidth() {
        if let maxWidth = maxWidth {
            internalMaxWidth = maxWidth
        } else {
            internalMaxWidth = Self.defaultMaxWidth
        }
        updateMessageLabelPreferredMaxWidth()
        setNeedsUpdateConstraints()
    }
}

// MARK: - tap handling
extension VitaminSnackbar {
    // apply changes when dismissOnTap property is set
    private func applyNewTapBehavior() {
        if let gestureRecognizer = gestureRecognizer {
            if actionOnTap != nil || dismissOnTap {
                // test to prevent multiple adding of the same gesture recognizer
                guard self.gestureRecognizers?.contains(gestureRecognizer) == false else {
                    return
                }
                self.addGestureRecognizer(gestureRecognizer)
            } else {
                self.removeGestureRecognizer(gestureRecognizer)
            }
        } else if actionOnTap != nil || dismissOnTap {
            gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.snackbarTapped))
            if let gestureRecognizer = gestureRecognizer {
                self.addGestureRecognizer(gestureRecognizer)
            }
        }
    }

    // Method called when snackbar is tapped
    @objc private func snackbarTapped() {
        actionOnTap?()
        if dismissOnTap {
            dismiss()
        }
    }
}
