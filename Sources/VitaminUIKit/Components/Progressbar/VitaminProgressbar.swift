//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import VitaminCore

/// Implementation of Vitamin circular progress bar
public final class VitaminProgressbar: UIView {
    /// An initializer that allows to set directly a size, a style, and the fact to show the track or not
    public required init(
        variant: VitaminProgressbarVariant = .circular(size: .medium, style: .empty),
        progressType: VitaminProgressbarProgressType,
        showTrack: Bool = true,
        leftLabelText: String? = nil,
        accessibilityLabel: String? = nil
    ) {
        super.init(frame: .zero)
        self.variant = variant
        self.showTrack = showTrack
        self.leftLabelText = leftLabelText
        self.accessibilityLabel = accessibilityLabel

        commonInit()
    }

    /// An initializer that restores a `VitaminProgressbar` from a serialized version (used in storyboard)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    /// An initializer that instantiate a `VitaminProgressbar` in a frame, with all default values for properties
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    // common initializer
    private func commonInit() {
        var textStyle: VitaminTextStyle = .body
        if case .circular(let circularSize, _) = variant {
            textStyle = circularSize.textStyle
        } else if case .linear(let linearSize, _) = variant {
            textStyle = linearSize.textStyle
        }
        self.backgroundColor = viewBackgroundColor
        percentageLabel.attributedText = displayableProgress().styled(
            as: textStyle,
            with: labelColor)
        setupView()
        applySize()
        applyStyle()
        applyProgress(internalProgress)
        applyShowTrack()
    }

    /// The variant of the progress bar.
    /// Can be .linear or .circular, and must be associated with a type and size
    public var variant: VitaminProgressbarVariant = .linear(size: .medium, style: .empty) {
        didSet {
            applySize()
            applyStyle()
            setupView()
        }
    }

    /// The type of progress of the progress abr
    /// Can be .determinate or .indeterminate
    public var progressType: VitaminProgressbarProgressType = .determinate {
        willSet {
            if progressType != newValue {
                progress = 0
            }
        }
        didSet {
            if oldValue == .indeterminate && progressType == .determinate {
                stopAnimationForIndeterminate()
            }
            applyStyle()
            setupView()
        }
    }

    /// A boolean indicating if the track should be displayed or not
    public var showTrack = true {
        didSet {
            applyShowTrack()
        }
    }

    /// Left label text in `.linear` variant and `.percentage` style
    public var leftLabelText: String? {
        didSet {
            if case .linear = self.variant {
                setupView()
            }
        }
    }

    /// The progress value (should be between 0 and 1)
    /// It will be set to 0 if lower than 0, and to 1 if greater than 1
    public var progress: CGFloat {
        get {
            return internalProgress
        }
        set {
            if newValue < 0 {
                internalProgress = 0
            } else if newValue > 1 {
                internalProgress = 1
            } else {
                internalProgress = newValue
            }
            applyProgress(internalProgress)
        }
    }

    /// boolean indicating that the progress bar is currently animated
    /// always false if progress type is `.determinate`
    public private(set) var isCurrentlyAnimated = false

    // Timer used to animate the progress bar in `.indeterminate` progress type`
    private var timer: Timer?

    private var internalProgress: CGFloat = 0

    // radius of the progress bar
    private var radius: CGFloat {
        if case .circular(let size, _) = self.variant {
            return (size.outerDiameter - size.lineWidth) / 2
        }
        return 0
    }

    // imageview that will hold the image
    private var centerImage = UIImageView()

    // label that will display the percentage
    private var percentageLabel = UILabel()

    // label that will be displayd on the left in .percentage styla od linear variant
    private var leftLabel = UILabel()

    // layer that will draw the progress
    private let progressLayer = CAShapeLayer()

    // layer that will draw the track
    private let trackLayer = CAShapeLayer()

    // center of the layers, label, image
    private var pathCenter: CGPoint {
        self.superview?.layoutSubviews()
        return self.convert(self.center, from: self.superview)
    }

    // Vertical position of labels for linear variant and percentage style
    private var progressbarLayersVerticalPosition: CGFloat {
        self.superview?.layoutSubviews()
        if case .linear(let size, let style) = self.variant {
            // base vertical position if no labels
            var verticalPosition = self.frame.height / 2
            if style == .percentage || style == .labelOnly {
                // compute height : base position + lineHeight/2 + spacer/2
                verticalPosition += size.labelLineHeight / 2 + size.verticalSpacer / 2
            }
            return verticalPosition
        }
        return 0
    }

    // Vertical posiytion of the progress layers for linear variant
    private var labelVerticalPosition: CGFloat {
        self.superview?.layoutSubviews()
        if case .linear(let size, let style) = self.variant, style == .percentage || style == .labelOnly {
            return (self.frame.height - size.labelLineHeight - size.verticalSpacer - size.lineWidth) / 2
        }
        return 0
    }

    // draw the layers of the progress bar
    private func drawProgressbar() {
        drawTrackLayer()
        drawProgressLayer()
    }

    // draw specifically the track layer with current properties
    // since the layer is retained, we will be able to modify the characteristics afterwards
    private func drawTrackLayer() {
        var lineWidth: CGFloat = 0
        var path = UIBezierPath()
        if case .circular(let size, _) = self.variant {
            path = UIBezierPath(
                arcCenter: pathCenter,
                radius: self.radius,
                startAngle: 0,
                endAngle: 2 * CGFloat.pi,
                clockwise: true)
            lineWidth = size.lineWidth
        } else if case .linear(let size, _) = self.variant {
            path.move(to: CGPoint(x: 0 + size.lineWidth / 2, y: progressbarLayersVerticalPosition))
            path.addLine(to: CGPoint(x: self.frame.width - size.lineWidth / 2, y: progressbarLayersVerticalPosition))
            lineWidth = size.lineWidth
        }
        trackLayer.removeFromSuperlayer()
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.path = path.cgPath
        trackLayer.strokeColor = self.trackColor.cgColor
        trackLayer.lineWidth = lineWidth
        trackLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(trackLayer)
    }

    // draw specifically the track layer with current properties
    // since the layer is retained, we will be able to modify the characteristics afterwards
    private func drawProgressLayer(startProgress: CGFloat? = nil) {
        self.progressLayer.removeFromSuperlayer()
        var path = UIBezierPath()
        var lineWidth: CGFloat = 0
        if case .circular(let size, _) = self.variant {
            var factor: CGFloat = 2
            if case .indeterminate = progressType {
                factor = 4
            }

            // progress will begin on the top of the circle, so at -Pi/2 rad (-90°)
            let startAngle = (-CGFloat.pi / 2)
            // and finish at 3*Pi/2 rad (270°) or 630° for `.indeterminte` progress type
            let endAngle = factor * CGFloat.pi + startAngle

            path = UIBezierPath(
                arcCenter: pathCenter,
                radius: self.radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: true)
            lineWidth = size.lineWidth
        } else if case .linear(let size, _) = self.variant {
            path.move(to: CGPoint(x: 0 + size.lineWidth / 2, y: progressbarLayersVerticalPosition))
            path.addLine(to: CGPoint(x: self.frame.width - size.lineWidth / 2, y: progressbarLayersVerticalPosition))
            lineWidth = size.lineWidth
        }

        progressLayer.lineCap = CAShapeLayerLineCap.round
        progressLayer.path = path.cgPath
        progressLayer.lineWidth = lineWidth
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = self.progressColor.cgColor
        if let startProgress = startProgress {
            progressLayer.strokeEnd = startProgress
        } else {
            progressLayer.strokeEnd = progress
        }
        self.layer.addSublayer(progressLayer)
    }

    // configure the labels
    // should be called after each modification of the text
    private func configLabels() {
        if case .circular = variant {
            percentageLabel.sizeToFit()
            percentageLabel.center = pathCenter
        } else if case .linear(let size, _) = variant {
            percentageLabel.sizeToFit()
            percentageLabel.frame = CGRect(
                x: self.frame.width - percentageLabel.frame.width,
                y: labelVerticalPosition,
                width: percentageLabel.frame.width,
                height: percentageLabel.frame.height)
            leftLabel.attributedText = (leftLabelText ?? "").styled(
                as: size.textStyle,
                with: labelColor)
            leftLabel.sizeToFit()
            leftLabel.frame = CGRect(
                x: 0,
                y: labelVerticalPosition,
                width: leftLabel.frame.width,
                height: leftLabel.frame.height)
        }
    }

    // configure the image view
    private func configCircularCenterImage() {
        // this method is only user for circular/image
        // We ensure this method has no effect if called on a linear progress bar
        // even it shouldn't since it is private, and all calls have already been checked
        if case .circular(let size, let style) = self.variant, case .image(let userImage) = style {
            centerImage.image = userImage
            centerImage.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size.imageSize)
            centerImage.layer.cornerRadius = size.imageSize.width / 2
            centerImage.contentMode = .scaleAspectFit
            centerImage.layer.masksToBounds = false
            centerImage.clipsToBounds = true
            centerImage.center = pathCenter
        }
    }

    // Setup the different views (progress bar, label, image)
    private func setupView() {
        isAccessibilityElement = true
        if accessibilityLabel == nil {
            accessibilityLabel = UIProgressView().accessibilityLabel
        }
        drawProgressbar()
        configLabels()
        self.subviews.forEach { $0.removeFromSuperview() }
        if case .circular = self.variant {
            configCircularCenterImage()
            self.addSubview(percentageLabel)
            self.addSubview(centerImage)
        } else if case .linear = self.variant {
            self.addSubview(percentageLabel)
            self.addSubview(leftLabel)
        }
    }

    // Layout Sublayers
    private var layoutDone = false
    override public func layoutSublayers(of layer: CALayer) {
        if !layoutDone {
            let tempText = percentageLabel.attributedText
            let tempDetailText = leftLabel.attributedText
            setupView()
            percentageLabel.attributedText = tempText
            leftLabel.attributedText = tempDetailText
            layoutDone = true
        }
    }
}

// MARK: sizing
extension VitaminProgressbar {
    // applies the size after it has been set
    private func applySize() {
        self.drawProgressbar()
        if case .circular(let circularSize, _) = variant {
            percentageLabel.attributedText = displayableProgress().styled(
                as: circularSize.textStyle,
                with: labelColor)
            configLabels()
            configCircularCenterImage()
        } else if case .linear(let linearSize, _) = variant {
            percentageLabel.attributedText = displayableProgress().styled(
                as: linearSize.textStyle,
                with: labelColor)
            leftLabel.attributedText = leftLabelText?.styled(
                as: linearSize.textStyle,
                with: labelColor)
            configLabels()
        }
    }
}

// MARK: styling
extension VitaminProgressbar {
    // applies the style after it has been set
    // shows/hides images and label as needed
    private func applyStyle() {
        if case .circular(_, let style) = self.variant {
            self.leftLabel.isHidden = true
            switch style {
            case .empty:
                self.percentageLabel.isHidden = true
                self.centerImage.isHidden = true
            case .percentage:
                // Specific case : in indeterminate progress type, nothing will be displayable, thus displayed
                self.percentageLabel.isHidden = (progressType == .indeterminate)
                self.centerImage.isHidden = true
            case .image:
                self.percentageLabel.isHidden = true
                self.centerImage.isHidden = false
            }

            // since the style has an effect on the circular progressLayer
            // let's redraw it
            drawProgressLayer()
        } else if case .linear(_, let style) = self.variant {
            self.centerImage.isHidden = true
            switch style {
            case .empty:
                self.percentageLabel.isHidden = true
                self.leftLabel.isHidden = true
            case .percentage:
                // Specific case : in indeterminate progress type, nothing will be displayable, thus displayed
                self.percentageLabel.isHidden = (progressType == .indeterminate)
                self.leftLabel.isHidden = false
            case .labelOnly:
                self.percentageLabel.isHidden = true
                self.leftLabel.isHidden = false
            }

            drawProgressLayer()
        }
    }

    // display or not the track
    // by changing the color of the track
    private func applyShowTrack() {
        if !self.showTrack {
            self.trackLayer.strokeColor = UIColor.clear.cgColor
        } else {
            self.trackLayer.strokeColor = self.trackColor.cgColor
        }
    }

    // change the cuurent progress of the progress bar
    // has no effect in `.indeterminate` progress type
    private func applyProgress(_ newProgress: CGFloat) {
        if case .circular(let circularSize, _) = self.variant {
            if progressType != .indeterminate {
                self.progressLayer.strokeEnd = newProgress

                self.percentageLabel.attributedText = "\(displayableProgress())".styled(
                    as: circularSize.textStyle,
                    with: labelColor)
                self.configLabels()
            } else {
                drawProgressbar()
            }
        } else if case .linear(let linearSize, _) = self.variant {
            if progressType != .indeterminate {
                self.progressLayer.strokeEnd = newProgress
                self.percentageLabel.attributedText = "\(displayableProgress())".styled(
                    as: linearSize.textStyle,
                    with: labelColor)
                self.configLabels()
            } else {
                drawProgressbar()
            }
        }
    }

    // compute the displayable progress in percent from the internal value
    private func displayableProgress() -> String {
        return "\(Int(progress * 100))%"
    }
}

// MARK: animation for indeterminate style
extension VitaminProgressbar {
    /// Starts the animation of the progress bar when in `.indeterminte` progress type
    public func startAnimationForIndeterminate() {
        var duration: Double = 1.5
        var delay: Double = 0.3
        guard case .indeterminate = progressType else { return }

        if case .linear = self.variant {
            duration = 1
            delay = 0.2
        }

        self.isCurrentlyAnimated = true
        self.timer = Timer.scheduledTimer(withTimeInterval: duration + delay, repeats: true) { timer in
            if !self.isCurrentlyAnimated {
                self.timer?.invalidate()
                self.drawProgressLayer(startProgress: 0)
            } else {
                self.singleProgessAnimation(duration: duration)
            }
        }

        self.timer?.fire()
    }

    /// Stops the animation of the progress bar when in `.indeterminate` progress type
    public func stopAnimationForIndeterminate() {
        self.isCurrentlyAnimated = false
        self.progressLayer.removeAllAnimations()
        self.timer?.invalidate()
    }

    // single animation of the progress bar that will be looped
    private func singleProgessAnimation(duration: Double) {
        drawProgressLayer(startProgress: 0)
        self.progressLayer.add(
            initSubAnimation(start: false, duration: duration),
            forKey: "strokenEndAnimation")
        self.progressLayer.add(
            initSubAnimation(start: true, duration: duration, delay: duration / 4),
            forKey: "strokenStartAnimation")
    }

    // convenience method to initialize the needed animations for .indeterminate progress type
    private func initSubAnimation(start: Bool, duration: CFTimeInterval, delay: Double? = nil) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: start ? "strokeStart" : "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        if let delay = delay {
            animation.beginTime = CACurrentMediaTime() + delay
        }
        return animation
    }
}

// MARK: theme switching handling
extension VitaminProgressbar {
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        trackLayer.strokeColor = self.trackColor.cgColor
    }
}
