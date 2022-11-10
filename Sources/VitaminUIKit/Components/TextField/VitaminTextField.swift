//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

public typealias VitaminTextFieldValidationResult = Result<Void, VitaminTextField.ValidationError>
public typealias VitaminTextFieldValidation = (String?, ((VitaminTextFieldValidationResult) -> Void)) -> Void
public typealias VitaminTextFieldIconAction = (VitaminTextField) -> Void

public class VitaminTextField: UIView {
    // Constants
    private static let textFieldHeight: CGFloat = 44.0
    private static let leadingTrailingConstraintConstant: CGFloat = 10.0
    private static let noLeadingTrailingConstraintConstant: CGFloat = 0.0

    /// Enum representing an error during text field validation
    /// It can be of two types
    /// - with an error message that will be displayed
    /// - a generic error without further details
    public enum ValidationError: Error {
        case errorWithMessage(String)
        case otherError
    }

    /// Enum representing the type of `VitaminTextField`
    public enum Style: String {
        case outline
        case filled
    }

    /// Enum representing the state of a `VitaminTextField`
    public enum State: String {
        case error
        case success
        case disabled
        case active
        case standard
    }

    /// The `VitaminTextField.State`value of the `VitaminTextField`
    public var state: State = .standard {
        didSet {
            applyNewState()
        }
    }

    /// The `VitaminTextField.Style`value of the `VitaminTextField`
    public var style: Style = .outline {
        didSet {
            applyNewStyle()
        }
    }

    /// The optional placeholder value of the `VitaminTextField`
    @IBInspectable public var placeholderText: String? {
        didSet {
            applyNewPlaceHolder()
        }
    }

    /// The optional helper text value of the `VitaminTextField`
    @IBInspectable public var helperText: String? {
        didSet {
            applyNewHelperText()
        }
    }

    /// The text value of the label of the`VitaminTextField`
    @IBInspectable public var labelText: String = "" {
        didSet {
            applyNewLabelText()
        }
    }

    /// The maxlength allowed for the `VitaminTextField`
    /// If not nil, a counter will be displayed below the text field
    public var maxLength: Int? {
        didSet {
            applyCounter()
        }
    }

    /// The value of the `VitaminTextField`
    @IBInspectable public var fieldValue: String? {
        get {
            textField.text
        }
        set {
            applyNewFieldValue(newValue)
        }
    }

    /// The optional icon diaplyed in the `VitaminTextField` (can be automatically overriden in some states)
    @IBInspectable public var icon: UIImage? {
        didSet {
            applyNewIcon()
        }
    }

    /// The tag of the backing `UITextField`
    /// Setting this property will allow to differentiate `UItextField`in the delegate
    public var textFieldTag: Int {
        get {
            self.textField.tag
        }
        set {
            self.textField.tag = newValue
        }
    }

    /// The secureText state of the VitaminTextField
    /// Will be propagated to the underlying UITextField isSecureTextEntry property
    @IBInspectable public var isSecureTextEntry: Bool = false {
        didSet {
            applySecureTextField()
        }
    }

    /// The presence of leading ad Traling padding beytween elements of VitalinTextField and safearea of the view
    @IBInspectable public var horizontalPadding: Bool = true {
        didSet {
            applyNewHorizontalPadding()
        }
    }

    /// A closure that allows to validate the `VitaminTextField` every time its value changes
    /// Parameters:
    /// - an optional String containing the new text field value
    /// - a completion taking a `VitaminTextFieldValidationResult` to indicate the result of the validation
    public var liveValidation: VitaminTextFieldValidation?

    /// Time interval between two firing of the `liveValidation` closure
    /// Default value is 0.5s
    public var liveValidationTimeInterval: TimeInterval = 0.5

    /// A closure that allows to validate the `VitaminTextField` when the editing of the field ends (i.e. when it loses focus)
    /// Parameters:
    /// - an optional String containing the new text field value
    /// - a completion taking a `VitaminTextFieldValidationResult` to indicate the result of the validation
    public var endEditingValidation: VitaminTextFieldValidation?

    /// Boolean to indicate if the text field should switch to `.active` state on editing
    /// This will have no effect if the field is already in `.error` or `.success` state
    public var activeOnEditing = false

    /// A standard `UITextFieldDelegate` to allow interact with the underlying `UITextField` that backs the `VitaminTextField`
    public weak var delegate: UITextFieldDelegate?

    /// A `VitaminTextFieldIconActionDelegate` that allows to launch an action after click on the icon
    /// This delegate is to implement if you want to have access to an element outside the VitaminTextField
    /// (for example, present a `UIAlertViewController`.
    /// If you just want to change the style of the input, you can use the `iconAction` closure instead
    /// if both are defined (delegate and closure), they will be both called (first delegate, then closure)
    public weak var iconActionDelegate: VitaminTextFieldIconActionDelegate?

    /// A closure that is triggered when user clicks on icon
    /// Parameters:
    /// - the vitaminTextField, that can be modified
    public var iconAction: VitaminTextFieldIconAction?

    // the timer used for live validation
    private var liveValidationTimer: Timer?

    // Validation closure that is called at the end of validation
    // This closure will change the state, and optionally the helper text, depending on the
    // prarmeters provided in the validation completion closure
    private lazy var validationResult: ((VitaminTextFieldValidationResult) -> Void) = { [weak self] result in
        guard let self = self else { return }
        // Whatever the result, we store the initial helper text
        // in case we would replace it with the optionnlay provided one
        // to be able to reset it when the validation will pass
        if self.state != .error {
            self.storedHelperTextBeforeError = self.helperText
        }
        switch result {
        case let .failure(error):
            self.state = .error

            if case let .errorWithMessage(errorMessage) = error {
                var separator: String = ""
                if let defaultHelperText = self.storedHelperTextBeforeError, !defaultHelperText.isEmpty {
                    separator = " - "
                }
                self.helperText = "\(self.storedHelperTextBeforeError ?? "")\(separator)\(errorMessage)"
            } else {
                break
            }

        case .success:
            self.state = .success
            self.helperText = self.storedHelperTextBeforeError ?? ""
        }
    }

    // Stored property to store initial helper text value before error handling
    private var storedHelperTextBeforeError: String?

    /// Label displayed above `VitaminTextField`
    @IBOutlet weak var label: UILabel!

    /// Underlying `UITextField`
    @IBOutlet public weak var textField: DesignableUITextField!

    /// Helper text label diplayed below `VitaminTextField``
    @IBOutlet weak var helper: UILabel!

    /// Counter label diplayed below `VitaminTextField`
    @IBOutlet weak var counter: UILabel!

    /// Line displayed below `VitaminTextField`in `.filled` state
    @IBOutlet weak var underline: UIView!

    /// Textfiled leading constraint
    @IBOutlet weak var textFieldLeadingConstraint: NSLayoutConstraint!
    /// TextField trailing constraint
    @IBOutlet weak var textFieldTrailingConstraint: NSLayoutConstraint!
    /// Label leading constraint
    @IBOutlet weak var labelLeadingConstraint: NSLayoutConstraint!
    /// Label trailing Consraint
    @IBOutlet weak var labelTrailingConstraint: NSLayoutConstraint!
    /// Helper text StackView leading constraint
    @IBOutlet weak var helperTextStackViewLeadingConstraint: NSLayoutConstraint!
    /// Helper text StackView trailing constraint
    @IBOutlet weak var helperTextStackViewTrailingConstraint: NSLayoutConstraint!

    // Filename of the nib taht contains the layout of the `VitamineTextField`
    private let nibName = "VitaminTextField"

    /// An initializer that inits a `VitaminTextField` in a `.zero` frame and initializes all properties programmatically, in a .zero
    public required init(
        style: VitaminTextField.Style = .outline,
        state: VitaminTextField.StateConfiguration,
        texts: VitaminTextField.TextConfiguration,
        validation: VitaminTextField.ValidationConfiguration? = nil,
        maxLength: Int? = nil,
        icon: VitaminTextField.IconConfiguration? = nil,
        textFieldTag: Int = 0
    ) {
        super.init(frame: .zero)
        self.style = style
        self.labelText = texts.labelText
        self.state = state.initialState
        self.maxLength = maxLength
        self.placeholderText = texts.placeholderText
        self.helperText = texts.helperText
        self.icon = icon?.initialIcon
        self.iconAction = icon?.iconAction
        self.liveValidation = validation?.liveValidation
        self.liveValidationTimeInterval = validation?.liveValidationTimeInterval ?? 0.5
        self.endEditingValidation = validation?.endEditingValidation
        self.activeOnEditing = state.activeOnEditing
        self.horizontalPadding = state.horizontalPadding
        commonInit()
        self.textFieldTag = textFieldTag
        self.fieldValue = texts.fieldValue
    }

    /// An initializer that restores a `VitaminTextField` from a serialized version (used in storyboard)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    /// An initializer that instantiate a `VitaminTextField` in a frame, with all default valmues for properties
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    // common initialisation, called by all public initializers
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)

        // init subviews properties
        setupTextField()
        applyNewState()
        applyNewLabelText()
        applyNewHelperText()
        applyNewPlaceHolder()
        applyNewIcon()
        applyNewHorizontalPadding()
        textField.delegate = self
        textField.enclosingVitaminTextField = self
        NotificationCenter.default.addObserver(
            forName: UITextField.textDidChangeNotification,
            object: textField,
            queue: OperationQueue.main
        ) { _ in
            self.applyCounter()
        }
    }

    // Common laoding of View from the nib (or xib) file
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: BundleToken.bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    // Calculate the
    override public var intrinsicContentSize: CGSize {
        var height = 16.0
        height += label.intrinsicContentSize.height
        height += textField.intrinsicContentSize.height
        height +=
            helper.intrinsicContentSize.height > 0 ?
                helper.intrinsicContentSize.height :
                counter.intrinsicContentSize.height

        return CGSize(width: super.intrinsicContentSize.width, height: height)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        invalidateIntrinsicContentSize()
    }
}

// MARK: - Styling and Filling

extension VitaminTextField {
    // handling of state change
    private func applyNewState() {
        applyBorders(for: self.state, and: self.style)
        textField.textColor = self.state.textColor
        helper.textColor = self.state.helperAndCounterColor
        counter.textColor = self.state.helperAndCounterColor
        if self.state == .disabled {
            textField.isEnabled = false
        } else {
            textField.isEnabled = true
        }
        // since state has effect on different elements, let's reapply them
        // to be indeoendent from the order the properties are set
        applyNewIcon()
        applyNewLabelText()
        applyNewHelperText()
        applyCounter()
        applyNewPlaceHolder()
    }

    // handling of style change
    private func applyNewStyle() {
        applyBorders(for: self.state, and: self.style)
    }

    // convenience method to handle colors and borders when style and/or state changes
    private func applyBorders(for state: VitaminTextField.State, and style: VitaminTextField.Style) {
        switch style {
        case .outline:
            textField.layer.borderColor = state.borderColor.cgColor
            textField.layer.borderWidth = state.borderWidth
            textField.borderStyle = .roundedRect
            underline.isHidden = true
        case .filled:
            underline.layer.borderWidth = state.borderWidth
            underline.layer.borderColor = state.borderColor.cgColor
            textField.borderStyle = .none
            textField.layer.borderColor = UIColor.clear.cgColor
            textField.layer.borderWidth = 0.0
            underline.isHidden = false
        }
    }

    // handling of new placeholder
    private func applyNewPlaceHolder() {
        guard let placeholderText = self.placeholderText else {
            self.textField.placeholder = nil
            return
        }

        // the custom lineheight in .body style causes strange effect
        // as a workaround, we jsut extract the font from the .body TextStyle
        // and color it.
        // By doing this, we let iOS center the text in the TextField, which is
        // what we want in the end
        guard let font = VitaminTextStyle.body.customAttributes()[.font] else {
            // should never happen, .body will always have a .font
            // only used to avoid force unwrap
            return
        }
        let bodyRestrictedAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: self.state.placeholderColor
        ]
        self.textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: bodyRestrictedAttributes
        )
    }

    // handling of new helper text
    private func applyNewHelperText() {
        guard let helperText = self.helperText else {
            self.helper.text = ""
            helper?.invalidateIntrinsicContentSize()
            return
        }
        self.helper.isHidden = false
        self.helper.attributedText = helperText.styled(as: .caption1, with: self.state.helperAndCounterColor)
        helper?.invalidateIntrinsicContentSize()
    }

    // handling of new label text
    private func applyNewLabelText() {
        self.label.attributedText = self.labelText.styled(as: .callout, with: self.state.textColor)
    }

    // initial setup of characteristics of the text field
    private func setupTextField() {
        self.textField.layer.cornerRadius = 4
        textField.addConstraint(textField.heightAnchor.constraint(equalToConstant: Self.textFieldHeight))

        // using `typingAttributes` in delegate causes a memory leak
        // and the app does not respond after some time
        // to avoid that, we just pick the font from the .body style, and just apply it
        guard let font = VitaminTextStyle.body.customAttributes()[.font] as? UIFont else {
            return
        }
        textField.font = font
        textField.textColor = self.state.textColor
    }

    // handling of counter when the length of the text field changes
    private func applyCounter() {
        if let maxLength = maxLength {
            self.counter.isHidden = false
            let string = "\(self.textField.text?.count ?? 0)/\(maxLength)"
            self.counter.attributedText = string.styled(as: .caption1, with: self.state.helperAndCounterColor)
        } else {
            self.counter.isHidden = true
        }
    }

    // handling of text field value setting
    private func applyNewFieldValue(_ newValue: String?) {
        guard let fieldValue = newValue else {
            self.textField.text = ""
            return
        }
        self.textField.text = fieldValue
    }

    // handling of new icon
    private func applyNewIcon() {
        if self.icon == nil, let stateIcon = self.state.icon {
            self.textField.rightImage = stateIcon
            self.textField.rightImageColor = self.state.standardIconColor
        } else {
            self.textField.rightImage = self.icon
            self.textField.rightImageColor = self.state.customIconColor
        }
    }

    // handling of secure text field
    private func applySecureTextField() {
        self.textField.isSecureTextEntry = self.isSecureTextEntry
    }

    private func applyNewHorizontalPadding() {
        if self.horizontalPadding {
            labelLeadingConstraint.constant = Self.leadingTrailingConstraintConstant
            labelTrailingConstraint.constant = Self.leadingTrailingConstraintConstant
            textFieldLeadingConstraint.constant = Self.leadingTrailingConstraintConstant
            textFieldTrailingConstraint.constant = Self.leadingTrailingConstraintConstant
            helperTextStackViewLeadingConstraint.constant = Self.leadingTrailingConstraintConstant
            helperTextStackViewTrailingConstraint.constant = Self.leadingTrailingConstraintConstant
        } else {
            labelLeadingConstraint.constant = Self.noLeadingTrailingConstraintConstant
            labelTrailingConstraint.constant = Self.noLeadingTrailingConstraintConstant
            textFieldLeadingConstraint.constant = Self.noLeadingTrailingConstraintConstant
            textFieldTrailingConstraint.constant = Self.noLeadingTrailingConstraintConstant
            helperTextStackViewLeadingConstraint.constant = Self.noLeadingTrailingConstraintConstant
            helperTextStackViewTrailingConstraint.constant = Self.noLeadingTrailingConstraintConstant
        }
    }

    /// method that will be called when the user clicks on the iconn
    /// This will call first the optional`iconActionDelegate.vitaminTextFieldDidClickOnIcon(self)` method,
    /// then the optional `iconAction` closure
    @objc public func iconTapped() {
        self.iconActionDelegate?.vitaminTextFieldDidClickOnIcon(self)
        self.iconAction?(self)
    }
}

// MARK: - Text field delegate methods

extension VitaminTextField: UITextFieldDelegate {
    /// Implementation of `textFieldShouldReturn(_:)` that delegates to the `UITextFieldDelegate`'s one if defined
    /// Returns `true` if not defined in the delegate
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn?(self.textField) ?? true
    }

    /// Implementation of `textFieldShouldReturn(_:shouldChangeCharactersIn:replacementString)`
    /// that handles the length counting and live validation, and then delegates to the `UITextFieldDelegate`'s one if defined
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let result = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string

        guard let maxLength = self.maxLength else {
            liveValidationDelayed(value: result, completion: self.validationResult)
            return (
                delegate?.textField?(
                    self.textField,
                    shouldChangeCharactersIn: range,
                    replacementString: string
                ) ?? true
            )
        }

        if result.count <= maxLength {
            liveValidationDelayed(value: result, completion: self.validationResult)
            return (
                delegate?.textField?(
                    self.textField,
                    shouldChangeCharactersIn: range,
                    replacementString: string
                ) ?? true
            )
        } else {
            return false
        }
    }

    // Convenience method to handle the live validation delaying
    private func liveValidationDelayed(value: String?, completion: @escaping ((VitaminTextFieldValidationResult) -> Void)) {
        liveValidationTimer?.invalidate()
        liveValidationTimer = Timer.scheduledTimer(withTimeInterval: liveValidationTimeInterval, repeats: false) { _ in
            self.liveValidation?(value, completion)
        }
    }

    /// Implementation of `textFieldShouldReturn(_:)`that delegates to the `UITextFieldDelegate`'s one  if defined
    /// Returns `true` if not defined in the delegate
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldBeginEditing?(self.textField) ?? true
    }

    /// Implementation of `textFieldDidBeginEditing(_:)`that delegates to the `UITextFieldDelegate`'s one  if defined
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if activeOnEditing, self.state == .standard {
            self.state = .active
        }
        delegate?.textFieldDidBeginEditing?(self.textField)
    }

    /// Implementation of `textFieldShouldEndEditing(_:)`that delegates to the `UITextFieldDelegate`'s one  if defined
    /// Returns `true` if not defined in the delegate
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldEndEditing?(self.textField) ?? true
    }

    /// Implementation of `textFieldDidEndEditing(_:reason:)` that handles the end editing validation,
    /// and then delegates to the `UITextFieldDelegate`'s one  if defined.
    /// To mimic the `UITextFieldDelegate`, it delegates to the `textFieldDidEndEditing(_:)`if the version with `reason` is not implemented
    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if self.endEditingValidation != nil {
            self.endEditingValidation?(textField.text, self.validationResult)
        } else if activeOnEditing, self.state == .active {
            self.state = .standard
        }

        // since this method is implemented, it will always be called in favor of
        // textFieldDidEndEditing(_ textField: UITextField)
        // But we do not know which version the delegate has implemented, so we have to
        // call the more precise one, and the less precise one if not implemented
        delegate?.textFieldDidEndEditing?(self.textField, reason: reason) ??
        delegate?.textFieldDidEndEditing?(self.textField)
    }

    /// Implementation of `textFieldDidChangeSelection(_:)`that delegates to the `UITextFieldDelegate`'s one  if defined
    @available(iOS 13.0, *)
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.textFieldDidChangeSelection?(self.textField)
    }

    /// Implementation of `textFieldShouldClear(_:)`that delegates to the `UITextFieldDelegate`'s one  if defined
    /// Returns `true` if not defined in the delegate
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldClear?(self.textField) ?? true
    }
}

// MARK: - text field right icon handling

/// Subclass of `UITextField` that handles the icon placing
@IBDesignable
public class DesignableUITextField: UITextField {
    // Constants for icon size and padding
    private static let iconSize: CGFloat = 20
    private static let iconPadding: CGFloat = 10

    var enclosingVitaminTextField: VitaminTextField?

    /// Overriding of default method to define the placement and size of icon in the text field
    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(
            x: bounds.width - (Self.iconSize + Self.iconPadding),
            y: bounds.height / 2 - Self.iconPadding,
            width: Self.iconSize,
            height: Self.iconSize
        )
    }

    // image displayed as icon
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }

    // color of the image
    var rightImageColor: UIColor? {
        didSet {
            updateView()
        }
    }

    // private method that handles the icon and icon color setting
    private func updateView() {
        if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(
                frame: CGRect(
                    x: 0,
                    y: 0,
                    width: Self.iconSize,
                    height: Self.iconSize
                )
            )
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            if let imageColor = rightImageColor {
                imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
                imageView.tintColor = imageColor
            }
            if let enclosingVitaminTextField = enclosingVitaminTextField {
                let tap = UITapGestureRecognizer(
                    target: enclosingVitaminTextField,
                    action: #selector(VitaminTextField.iconTapped)
                )
                imageView.addGestureRecognizer(tap)
                imageView.isUserInteractionEnabled = true
            }
            rightView = imageView
            // Due to a keyboard animation issue, we need to fix the frame of the right icon
            rightView?.frame = rightViewRect(forBounds: bounds)
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
    }
}

extension VitaminTextField.State {
    /// the border color of a `VitaminTextField` for a specific state
    var borderColor: UIColor {
        switch self {
        case .error:
            return VitaminColor.Core.Border.negative
        case .success:
            return VitaminColor.Core.Border.positive
        case .disabled:
            return VitaminColor.Core.Border.inactive
        case .active:
            return VitaminColor.Core.Border.active
        case .standard:
            return VitaminColor.Core.Border.primary
        }
    }

    /// The text color of a `VitaminTextField` for a specific state
    var textColor: UIColor {
        if self == .disabled {
            return VitaminColor.Core.Content.primary.disabledColor()
        } else {
            return VitaminColor.Core.Content.primary
        }
    }

    /// the icon color of a `VitaminTextField` for a specific state
    /// It is only applied for default icon, i.e. success and failure icons
    ///  For custom icons, cutomIconColor will be used
    var standardIconColor: UIColor {
        switch self {
        case .error:
            return VitaminColor.Core.Content.negative
        case .success:
            return VitaminColor.Core.Content.positive
        default:
            return VitaminColor.Core.Content.primary
        }
    }

    /// the icon color of a `VitaminTextField` for a specific state
    /// It is only applied for custom icon, i.e. ison provided by the caller
    var customIconColor: UIColor {
        if self == .disabled {
            return VitaminColor.Core.Content.primary.disabledColor()
        } else {
            return VitaminColor.Core.Content.primary
        }
    }

    /// the color of the optionals helper text and counter of a `VitaminTextField` for a specific state
    var helperAndCounterColor: UIColor {
        switch self {
        case .error:
            return VitaminColor.Core.Content.negative
        case .disabled:
            return VitaminColor.Core.Content.secondary.disabledColor()
        default:
            return VitaminColor.Core.Content.secondary
        }
    }

    /// the placeholder color of a `VitaminTextField`for a specific state
    var placeholderColor: UIColor {
        if self == .disabled {
            return VitaminColor.Core.Content.tertiary.disabledColor()
        } else {
            return VitaminColor.Core.Content.tertiary
        }
    }

    /// the default icon diaplyed in a `VitaminTextField` for a specific state
    var icon: UIImage? {
        switch self {
        case .error:
            return Vitamix.Line.System.alert.image
        case .success:
            return Vitamix.Line.System.check.image
        default:
            return nil
        }
    }

    /// the border width of a `VitaminTextField` for a specific state
    var borderWidth: CGFloat {
        if self == .error || self == .active || self == .success {
            return 2.0
        } else {
            return 1.0
        }
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
#if SWIFT_PACKAGE
    return Bundle.module
#else
    return Bundle(for: BundleToken.self)
#endif
    }()
}
// swiftlint:enable convenience_type
