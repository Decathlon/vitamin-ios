import Foundation

/// This mapper is used to transform Vitamix names from to SF Symbol conterparts.
/// 465 - Total
/// 106 - 23% are not available
/// 359 - 77%
public let VitamixToSFSymbol: [String: String] = [
//  "AccessibilityFill" : "",
//  "AccessibilityLine" : "",
  "AddCircleFill" : "plus.circle.fill",
  "AddCircleLine" : "plus.circle",
  "AddFill" : "plus",
  "AddLine" : "plus",
  "AlertFill" : "exclamationmark.triangle.fill",
  "AlertLine" : "exclamationmark.triangle",
//  "AmazonFill" : "",
//  "AmazonLine" : "",
//  "AndroidFill" : "",
//  "AndroidLine" : "",
  "AppleFill" : "apple.logo",
  "AppleLine" : "apple.logo",
  "ArrowDownCircleFill" : "arrow.down.circle.fill",
  "ArrowDownCircleLine" : "arrow.down.circle",
  "ArrowDownFill" : "arrow.down",
  "ArrowDownLine" : "arrow.down",
  "ArrowGoBackFill" : "arrow.uturn.backward",
  "ArrowGoBackLine" : "arrow.uturn.backward",
  "ArrowGoForwardFill" : "arrow.uturn.forward",
  "ArrowGoForwardLine" : "arrow.uturn.forward",
  "ArrowLeftCircleFill" : "arrow.left.circle.fill",
  "ArrowLeftCircleLine" : "arrow.left.circle",
  "ArrowLeftDownFill" : "arrow.down.left",
  "ArrowLeftDownLine" : "arrow.down.left",
  "ArrowLeftFill" : "arrow.left",
  "ArrowLeftLine" : "arrow.left",
  "ArrowLeftRightFill": "arrow.left.arrow.right",
  "ArrowLeftRightLine": "arrow.left.arrow.right",
  "ArrowLeftUpFill": "arrow.up.left",
  "ArrowLeftUpLine": "arrow.up.left",
  "ArrowRightCircleFill": "arrow.right.circle.fill",
  "ArrowRightCircleLine": "arrow.right.circle",
  "ArrowRightDownFill": "arrow.down.right",
  "ArrowRightDownLine": "arrow.down.right",
  "ArrowRightFill": "arrow.right",
  "ArrowRightLine": "arrow.right",
  "ArrowRightUpFill": "arrow.up.right",
  "ArrowRightUpLine": "arrow.up.right",
  "ArrowUpCircleFill": "arrow.up.circle.fill",
  "ArrowUpCircleLine": "arrow.up.circle",
  "ArrowUpDownFill": "arrow.up.arrow.down",
  "ArrowUpDownLine": "arrow.up.arrow.down",
  "ArrowUpFill": "arrow.up",
  "ArrowUpLine": "arrow.up",
  "AttachmentFill": "paperclip",
  "AttachmentLine": "paperclip",
  "AwardFill": "rosette",
  "AwardLine": "rosette",
  "BankCardFill": "creditcard.fill",
  "BankCardLine": "creditcard",
  "BarChartFill": "chart.bar.fill",
  "BarChartLine": "chart.bar",
  "BarcodeFill": "barcode.viewfinder",
  "BarcodeLine": "barcode.viewfinder",
//  "BillFill": "",
//  "BillLine": "",
//  "BodyScanFill": "",
//  "BodyScanLine": "",
  "Calendar2Fill": "calendar",
  "Calendar2Line": "calendar",
  "CalendarCheckFill": "calendar.badge.plus",
  "CalendarCheckLine": "calendar.badge.plus",
//  "CalendarDateFill": "",
//  "CalendarDateLine": "",
  "CalendarFill": "calendar",
  "CalendarLine": "calendar",
  "CameraFill": "camera.fill",
  "CameraLine": "camera",
  "CarFill": "car.fill",
  "CarLine": "car",
  "CheckFill": "checkmark",
  "CheckLine": "checkmark",
  "CheckboxBlankCircleFill": "circle.fill",
  "CheckboxBlankCircleLine": "circle",
  "CheckboxBlankFill": "square.fill",
  "CheckboxBlankLine": "square",
  "CheckboxCircleFill": "checkmark.circle.fill",
  "CheckboxCircleLine": "checkmark.circle",
  "CheckboxFill": "checkmark.square.fill",
  "CheckboxLine": "checkmark.square",
//  "CheckboxMultipleFill": "",
//  "CheckboxMultipleLine": "",
  "ChevronDownFill": "chevron.down",
  "ChevronDownLine": "chevron.down",
  "ChevronLeftFill": "chevron.left",
  "ChevronLeftLine": "chevron.left",
  "ChevronRightFill": "chevron.right",
  "ChevronRightLine": "chevron.right",
  "ChevronUpFill": "chevron.up",
  "ChevronUpLine": "chevron.up",
//  "ChromeFill": "",
//  "ChromeLine": "",
  "CloseCircleFill": "xmark.circle.fill",
  "CloseCircleLine": "xmark.circle",
  "CloseFill": "xmark",
  "CloseLine": "xmark",
  "CloudFill": "cloud.fill",
  "CloudLine": "cloud",
  "CloudWindyFill": "wind",
  "CloudWindyLine": "wind",
  "CounterFill": "gauge.high",
  "CounterLine": "gauge.high",
//  "CustomerServiceFill": "",
//  "CustomerServiceLine": "",
//  "DatabaseFill": "",
//  "DatabaseLine": "",
  "DeleteBinFill": "trash.fill",
  "DeleteBinLine": "trash",
  "DirectionFill": "arrow.triangle.turn.up.right.diamond.fill",
  "DirectionLine": "arrow.triangle.turn.up.right.diamond",
  "DistanceFill": "arrow.left.and.right",
  "DistanceLine": "arrow.left.and.right",
  "DownloadFill": "arrow.down.to.line",
  "DownloadLine": "arrow.down.to.line",
//  "DriveFill": "",
//  "DriveLine": "",
  "DrizzleFill": "cloud.drizzle.fill",
  "DrizzleLine": "cloud.drizzle",
  "EarthFill": "globe.europe.africa.fill",
  "EarthLine": "globe.europe.africa",
  "EditFill": "pencil",
  "EditLine": "pencil",
//  "EmotionFill": "",
//  "EmotionLaughFill": "",
//  "EmotionLaughLine": "",
//  "EmotionLine": "",
//  "EmotionNormalFill": "",
//  "EmotionNormalLine": "",
//  "EmotionSadFill": "",
//  "EmotionSadLine": "",
//  "EmotionUnhappyFill": "",
//  "EmotionUnhappyLine": "",
  "EqualizerFill": "slider.horizontal.3",
  "EqualizerLine": "slider.horizontal.3",
  "ErrorWarningFill": "exclamationmark.circle.fill",
  "ErrorWarningLine": "exclamationmark.circle",
  "ExchangeFill": "arrow.left.arrow.right.square.fill",
  "ExchangeLine": "arrow.left.arrow.right.square",
  "ExternalLinkFill": "square.and.arrow.up",
  "ExternalLinkLine": "square.and.arrow.up",
  "EyeFill": "eye.fill",
  "EyeLine": "eye",
  "EyeOffFill": "eye.slash.fill",
  "EyeOffLine": "eye.slash",
//  "FacebookFill": "",
//  "FacebookLine": "",
  "FeedbackFill": "exclamationmark.bubble.fill",
  "FeedbackLine": "exclamationmark.bubble",
  "FileCopyFill": "doc.on.doc.fill",
  "FileCopyLine": "doc.on.doc",
  "FileFill": "doc.fill",
  "FileLine": "doc",
  "FilmFill": "film.fill",
  "FilmLine": "film",
  "FilterFill": "line.3.horizontal.decrease.circle.fill",
  "FilterLine": "line.3.horizontal.decrease.circle",
//  "FilterOffFill": "",
//  "FilterOffLine": "",
  "FireFill": "flame.fill",
  "FireLine": "flame",
//  "FirefoxFill": "",
//  "FirefoxLine": "",
  "FlashlightFill": "bolt.fill",
  "FlashlightLine": "bolt",
  "FocusFill": "scope",
  "FocusLine": "scope",
  "FoggyFill": "cloud.fog.fill",
  "FoggyLine": "cloud.fog",
  "FootballFill": "soccerball.inverse",
  "FootballLine": "soccerball",
  "ForbidFill": "slash.circle.fill",
  "ForbidLine": "slash.circle",
  "FullscreenFill": "arrow.up.left.and.arrow.down.right",
  "FullscreenLine": "arrow.up.left.and.arrow.down.right",
  "FunctionFill": "square.grid.2x2.fill",
  "FunctionLine": "square.grid.2x2",
  "GiftFill": "gift.fill",
  "GiftLine": "gift",
//  "GithubFill": "",
//  "GithubLine": "",
//  "GoogleFill": "",
//  "GoogleLine": "",
  "GridFill": "square.grid.3x3.fill",
  "GridLine": "square.grid.3x3",
  "GroupFill": "person.2.fill",
  "GroupLine": "person.2",
  "HailFill": "cloud.hail.fill",
  "HailLine": "cloud.hail",
  "HearingImpairmentFill": "hearingdevice.ear.fill",
  "HearingImpairmentLine": "hearingdevice.ear",
  "HeartFill": "heart.fill",
  "HeartLine": "heart",
//  "HeartPulseFill": "",
//  "HeartPulseLine": "",
  "HistoryFill": "clock.arrow.circlepath",
  "HistoryLine": "clock.arrow.circlepath",
  "HomeFill": "house.fill",
  "HomeLine": "house",
  "HourglassFill": "hourglass",
  "HourglassLine": "hourglass",
//  "IeFill": "",
//  "IeLine": "",
  "ImageFill": "photo.fill",
  "ImageLine": "photo",
  "InformationFill": "info.circle.fill",
  "InformationLine": "info.circle",
//  "InstagramFill": "",
//  "InstagramLine": "",
//  "KakaoTalkFill": "",
//  "KakaoTalkLine": "",
  "KeyboardFill": "keyboard.fill",
  "KeyboardLine": "keyboard",
  "LeafFill": "leaf.fill",
  "LeafLine": "leaf",
  "LightbulbFill": "lightbulb.fill",
  "LightbulbLine": "lightbulb",
  "LineChartFill": "chart.line.uptrend.xyaxis",
  "LineChartLine": "chart.line.uptrend.xyaxis",
//  "LineFill": "",
//  "LineLine": "",
  "LinkFill": "link",
  "LinkLine": "link",
  "ListCheckFill": "list.bullet",
  "ListCheckLine": "list.bullet",
//  "ListSettingsFill": "",
//  "ListSettingsLine": "",
  "LockFill": "lock.fill",
  "LockLine": "lock",
  "LogoutFill": "rectangle.portrait.and.arrow.right.fill",
  "LogoutLine": "rectangle.portrait.and.arrow.right",
  "LoyaltyCardFill": "giftcard.fill",
  "LoyaltyCardLine": "giftcard",
  "MacFill": "desktopcomputer",
  "MacLine": "desktopcomputer",
  "MacbookFill": "laptopcomputer",
  "MacbookLine": "laptopcomputer",
  "MailFill": "envelope.fill",
  "MailLine": "envelope",
  "MailSendFill": "paperplane.fill",
  "MailSendLine": "paperplane",
  "MapPinFill": "mappin",
  "MapPinLine": "mappin",
//  "MastercardFill": "",
//  "MastercardLine": "",
  "MenuFill": "line.3.horizontal",
  "MenuLine": "line.3.horizontal",
  "MessageFill": "text.bubble.fill",
  "MessageLine": "text.bubble",
//  "MessengerFill": "",
//  "MessengerLine": "",
  "MicFill": "mic.fill",
  "MicLine": "mic",
  "MistFill": "cloud.fog.fill",
  "MistLine": "cloud.fog",
  "MoneyCnyBoxFill": "yensign.square.fill",
  "MoneyCnyBoxLine": "yensign.square",
  "MoneyDollarBoxFill": "dollarsign.square.fill",
  "MoneyDollarBoxLine": "dollarsign.square",
  "MoneyEuroBoxFill": "eurosign.square.fill",
  "MoneyEuroBoxLine": "eurosign.square",
  "MoneyPoundBoxFill": "sterlingsign.square.fill",
  "MoneyPoundBoxLine": "sterlingsign.square",
  "MoonCloudyFill": "cloud.moon.fill",
  "MoonCloudyLine": "cloud.moon",
  "MoonFill": "moon.fill",
  "MoonLine": "moon",
//  "More2Fill": "",
//  "More2Line": "",
  "MoreFill": "ellipsis",
  "MoreLine": "ellipsis",
  "Music2Fill": "music.quarternote.3",
  "Music2Line": "music.quarternote.3",
  "MusicFill": "music.note",
  "MusicLine": "music.note",
//  "NaverFill": "",
//  "NaverLine": "",
  "NavigationFill": "location.fill",
  "NavigationLine": "location",
  "NotificationFill": "bell.fill",
  "NotificationLine": "bell",
  "PackageFill": "shippingbox.fill",
  "PackageLine": "shippingbox",
  "PauseCircleFill": "pause.circle.fill",
  "PauseCircleLine": "pause.circle",
  "PauseFill": "pause.fill",
  "PauseLine": "pause",
  "PhoneFill": "phone.fill",
  "PhoneLine": "phone",
  "PieChartFill": "chart.pie.fill",
  "PieChartLine": "chart.pie",
//  "PinterestFill": "",
//  "PinterestLine": "",
  "PlayCircleFill": "play.circle.fill",
  "PlayCircleLine": "play.circle",
  "PlayFill": "play.fill",
  "PlayLine": "play",
  "PriceTagFill": "tag.fill",
  "PriceTagLine": "tag",
  "PrinterFill": "printer.filled.and.paper",
  "PrinterLine": "printer",
  "QrScanFill": "qrcode.viewfinder",
  "QrScanLine": "qrcode.viewfinder",
  "QuestionFill": "questionmark.circle.fill",
  "QuestionLine": "questionmark.circle",
  "RadioButtonFill": "record.circle.fill",
  "RadioButtonLine": "record.circle",
  "RainyFill": "cloud.rain.fill",
  "RainyLine": "cloud.rain",
  "RecycleFill": "arrow.3.trianglepath",
  "RecycleLine": "arrow.3.trianglepath",
  "RefreshFill": "arrow.triangle.2.circlepath",
  "RefreshLine": "arrow.triangle.2.circlepath",
//  "RefundFill": "",
//  "RefundLine": "",
  "RepeatFill": "repeat",
  "RepeatLine": "repeat",
  "ReturnFill": "return",
  "ReturnLine": "return",
  "RidingFill": "figure.outdoor.cycle",
  "RidingLine": "figure.outdoor.cycle",
//  "RocketFill": "🚀",
//  "RocketLine": "🚀",
  "RssFill": "dot.radiowaves.up.forward",
  "RssLine": "dot.radiowaves.up.forward",
  "RulerFill": "ruler.fill",
  "RulerLine": "ruler",
  "RunFill": "figure.run",
  "RunLine": "figure.run",
  "SafariFill": "safari.fill",
  "SafariLine": "safari",
//  "ScalesFill": "",
//  "ScalesLine": "",
  "SearchFill": "magnifyingglass",
  "SearchLine": "magnifyingglass",
  "SecurePaymentFill": "lock.shield.fill",
  "SecurePaymentLine": "lock.shield",
//  "Seed1Fill": "",
//  "Seed1Line": "",
//  "Seed2Fill": "",
//  "Seed2Line": "",
//  "Seed3Fill": "",
//  "Seed3Line": "",
//  "SelectedByDecathlonFill": "",
//  "SelectedByDecathlonLine": "",
  "SendPlane2Fill": "paperplane.fill",
  "SendPlane2Line": "paperplane",
  "SendPlaneFill": "paperplane.fill",
  "SendPlaneLine": "paperplane",
  "SettingsFill": "gearshape.fill",
  "SettingsLine": "gearshape",
//  "ShareAndroidFill": "",
//  "ShareAndroidLine": "",
//  "ShareFill": "",
  "ShareIosFill": "square.and.arrow.up.fill",
  "ShareIosLine": "square.and.arrow.up",
//  "ShareLine": "",
  "ShieldCheckFill": "checkmark.shield.fill",
  "ShieldCheckLine": "checkmark.shield",
  "ShoppingBagFill": "bag.fill",
  "ShoppingBagLine": "bag",
  "ShoppingCartFill": "cart.fill",
  "ShoppingCartLine": "cart",
  "ShowersFill": "cloud.heavyrain.fill",
  "ShowersLine": "cloud.heavyrain",
  "ShutDownFill": "power",
  "ShutDownLine": "power",
//  "SlackFill": "",
//  "SlackLine": "",
  "SmartphoneFill": "iphone",
  "SmartphoneLine": "iphone",
//  "SnapchatFill": "",
//  "SnapchatLine": "",
  "SnowyFill": "cloud.snow.fill",
  "SnowyLine": "cloud.snow",
  "SparklesFill": "sparkles",
  "SparklesLine": "sparkles",
  "StarFill": "star.fill",
  "StarHalfFill": "star.leadinghalf.filled",
  "StarHalfLine": "star.leadinghalf.filled",
  "StarLine": "star",
  "StopCircleFill": "stop.circle.fill",
  "StopCircleLine": "stop.circle",
  "StopFill": "stop.fill",
  "StopLine": "stop",
//  "StoreFill": "",
//  "StoreLine": "",
  "SubtractFill": "minus",
  "SubtractLine": "minus",
  "SuitcaseFill": "suitcase.fill",
  "SuitcaseLine": "suitcase",
  "SunCloudyFill": "cloud.sun.fill",
  "SunCloudyLine": "cloud.sun",
  "SunFill": "sun.max.fill",
  "SunLine": "sun.max",
  "TShirtFill": "tshirt.fill",
  "TShirtLine": "tshirt",
  "TabletFill": "ipad",
  "TabletLine": "ipad",
  "TaskFill": "checkmark.square.fill",
  "TaskLine": "checkmark.square",
//  "TelegramFill": "",
//  "TelegramLine": "",
  "TempColdFill": "thermometer.low",
  "TempColdLine": "thermometer.low",
  "TempHotFill": "thermometer.high",
  "TempHotLine": "thermometer.high",
  "ThumbDownFill": "hand.thumbsdown.fill",
  "ThumbDownLine": "hand.thumbsdown",
  "ThumbUpFill": "hand.thumbsup.fill",
  "ThumbUpLine": "hand.thumbsup",
  "ThunderstormsFill": "cloud.bolt.fill",
  "ThunderstormsLine": "cloud.bolt",
//  "TiktokFill": "",
//  "TiktokLine": "",
  "TimeFill": "clock.fill",
  "TimeLine": "clock",
  "TimerFill": "timer",
  "TimerLine": "timer",
  "ToolsFill": "wrench.and.screwdriver.fill",
  "ToolsLine": "wrench.and.screwdriver",
  "TrainFill": "train.side.front.car",
  "TrainLine": "train.side.front.car",
  "TrophyFill": "trophy.fill",
  "TrophyLine": "trophy",
  "TruckFill": "box.truck.fill",
  "TruckLine": "box.truck",
//  "TwitterFill": "",
//  "TwitterLine": "",
//  "UnlinkFill": "",
//  "UnlinkLine": "",
  "UploadFill": "square.and.arrow.up",
  "UploadLine": "square.and.arrow.up",
  "UserFill": "person.fill",
  "UserLine": "person",
//  "ViberFill": "",
//  "ViberLine": "",
//  "VisaFill": "",
//  "VisaLine": "",
  "VolumeAlertFill": "speaker.badge.exclamationmark.fill",
  "VolumeAlertLine": "speaker.badge.exclamationmark",
  "VolumeDownFill": "speaker.wave.1.fill",
  "VolumeDownLine": "speaker.wave.1",
  "VolumeMuteFill": "speaker.slash.fill",
  "VolumeMuteLine": "speaker.slash",
  "VolumeUpFill": "speaker.wave.3.fill",
  "VolumeUpLine": "speaker.wave.3",
  "WalkFill": "figure.walk",
  "WalkLine": "figure.walk",
//  "WalletFill": "",
//  "WalletLine": "",
//  "WhatsappFill": "",
//  "WhatsappLine": "",
  "WifiOffFill": "wifi.slash",
  "WifiOffLine": "wifi.slash",
  "WifiOnFill": "wifi",
  "WifiOnLine": "wifi",
  "WindyFill": "wind",
  "WindyLine": "wind",
//  "YoutubeFill": "",
//  "YoutubeLine": "",
  "ZoomInFill": "plus.magnifyingglass",
  "ZoomInLine": "plus.magnifyingglass",
  "ZoomOutFill": "minus.magnifyingglass",
  "ZoomOutLine": "minus.magnifyingglass"
]