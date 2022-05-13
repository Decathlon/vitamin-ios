//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
import Foundation
import VitaminCore

// swiftlint:disable file_length
// swiftlint:disable:next type_body_length
enum IconsModel {
    struct Section: Identifiable {
        var id: String {
            name
        }
        let name: String
        let items: [VitaminImageAsset]
    }

    static let sections = [
        IconsModel.Section(name: "Buildings - Line", items: [
            Vitamix.Line.Buildings.home,
            Vitamix.Line.Buildings.store
        ]),
        IconsModel.Section(name: "Buildings - Fill", items: [
            Vitamix.Fill.Buildings.home,
            Vitamix.Fill.Buildings.store
        ]),
        IconsModel.Section(name: "Business - Line", items: [
            Vitamix.Line.Business.award,
            Vitamix.Line.Business.calendar,
            Vitamix.Line.Business.calendar2,
            Vitamix.Line.Business.calendarCheck,
            Vitamix.Line.Business.calendarDate,
            Vitamix.Line.Business.mail,
            Vitamix.Line.Business.mailSend,
            Vitamix.Line.Business.printer
        ]),
        IconsModel.Section(name: "Business - Fill", items: [
            Vitamix.Fill.Business.award,
            Vitamix.Fill.Business.calendar,
            Vitamix.Fill.Business.calendar2,
            Vitamix.Fill.Business.calendarCheck,
            Vitamix.Fill.Business.calendarDate,
            Vitamix.Fill.Business.mail,
            Vitamix.Fill.Business.mailSend,
            Vitamix.Fill.Business.printer
        ]),
        IconsModel.Section(name: "Communication - Line", items: [
            Vitamix.Line.Communication.feedback,
            Vitamix.Line.Communication.message
        ]),
        IconsModel.Section(name: "Communication - Fill", items: [
            Vitamix.Fill.Communication.feedback,
            Vitamix.Fill.Communication.message
        ]),
        IconsModel.Section(name: "Design - Line", items: [
            Vitamix.Line.Design.edit,
            Vitamix.Line.Design.focus,
            Vitamix.Line.Design.ruler
        ]),
        IconsModel.Section(name: "Design - Fill", items: [
            Vitamix.Fill.Design.edit,
            Vitamix.Fill.Design.focus,
            Vitamix.Fill.Design.ruler
        ]),
        IconsModel.Section(name: "Device - Line", items: [
            Vitamix.Line.Device.database,
            Vitamix.Line.Device.mac,
            Vitamix.Line.Device.macbook,
            Vitamix.Line.Device.phone,
            Vitamix.Line.Device.shutdown,
            Vitamix.Line.Device.smartphone
        ]),
        IconsModel.Section(name: "Device - Fill", items: [
            Vitamix.Fill.Device.database,
            Vitamix.Fill.Device.mac,
            Vitamix.Fill.Device.macbook,
            Vitamix.Fill.Device.phone,
            Vitamix.Fill.Device.shutdown,
            Vitamix.Fill.Device.smartphone
        ]),
        IconsModel.Section(name: "Documents - Line", items: [
            Vitamix.Line.Documents.bill,
            Vitamix.Line.Documents.file
        ]),
        IconsModel.Section(name: "Documents - Fill", items: [
            Vitamix.Fill.Documents.bill,
            Vitamix.Fill.Documents.file
        ]),
        IconsModel.Section(name: "Editor - Line", items: [
            Vitamix.Line.Editor.attachment,
            Vitamix.Line.Editor.link,
            Vitamix.Line.Editor.listCheck,
            Vitamix.Line.Editor.unlink
        ]),
        IconsModel.Section(name: "Editor - Fill", items: [
            Vitamix.Fill.Editor.attachment,
            Vitamix.Fill.Editor.link,
            Vitamix.Fill.Editor.listCheck,
            Vitamix.Fill.Editor.unlink
        ]),
        IconsModel.Section(name: "Finance - Line", items: [
            Vitamix.Line.Finance.bankCard,
            Vitamix.Line.Finance.exchange,
            Vitamix.Line.Finance.gift,
            Vitamix.Line.Finance.mastercard,
            Vitamix.Line.Finance.moneyCnyBox,
            Vitamix.Line.Finance.moneyDollarBox,
            Vitamix.Line.Finance.moneyEuroBox,
            Vitamix.Line.Finance.moneyPoundBox,
            Vitamix.Line.Finance.productReturn,
            Vitamix.Line.Finance.refund,
            Vitamix.Line.Finance.securePayment,
            Vitamix.Line.Finance.shoppingCart,
            Vitamix.Line.Finance.visa
        ]),
        IconsModel.Section(name: "Finance - Fill", items: [
            Vitamix.Fill.Finance.bankCard,
            Vitamix.Fill.Finance.exchange,
            Vitamix.Fill.Finance.gift,
            Vitamix.Fill.Finance.mastercard,
            Vitamix.Fill.Finance.moneyCnyBox,
            Vitamix.Fill.Finance.moneyDollarBox,
            Vitamix.Fill.Finance.moneyEuroBox,
            Vitamix.Fill.Finance.moneyPoundBox,
            Vitamix.Fill.Finance.productReturn,
            Vitamix.Fill.Finance.refund,
            Vitamix.Fill.Finance.securePayment,
            Vitamix.Fill.Finance.shoppingCart,
            Vitamix.Fill.Finance.visa
        ]),
        IconsModel.Section(name: "Health and Medical - Line", items: [
            Vitamix.Line.Health.heart,
            Vitamix.Line.Health.heartPulse
        ]),
        IconsModel.Section(name: "Health and Medical - Fill", items: [
            Vitamix.Fill.Health.heart,
            Vitamix.Fill.Health.heartPulse
        ]),
        IconsModel.Section(name: "Logos - Line", items: [
            Vitamix.Line.Logos.amazon,
            Vitamix.Line.Logos.android,
            Vitamix.Line.Logos.apple,
            Vitamix.Line.Logos.chrome,
            Vitamix.Line.Logos.drive,
            Vitamix.Line.Logos.facebook,
            Vitamix.Line.Logos.firefox,
            Vitamix.Line.Logos.google,
            Vitamix.Line.Logos.ie,
            Vitamix.Line.Logos.instagram,
            Vitamix.Line.Logos.messenger,
            Vitamix.Line.Logos.pinterest,
            Vitamix.Line.Logos.safari,
            Vitamix.Line.Logos.slack,
            Vitamix.Line.Logos.snapchat,
            Vitamix.Line.Logos.telegram,
            Vitamix.Line.Logos.twitter,
            Vitamix.Line.Logos.viber,
            Vitamix.Line.Logos.whatsapp,
            Vitamix.Line.Logos.youtube
        ]),
        IconsModel.Section(name: "Logos - Fill", items: [
            Vitamix.Fill.Logos.amazon,
            Vitamix.Fill.Logos.android,
            Vitamix.Fill.Logos.apple,
            Vitamix.Fill.Logos.chrome,
            Vitamix.Fill.Logos.drive,
            Vitamix.Fill.Logos.facebook,
            Vitamix.Fill.Logos.firefox,
            Vitamix.Fill.Logos.google,
            Vitamix.Fill.Logos.ie,
            Vitamix.Fill.Logos.instagram,
            Vitamix.Fill.Logos.messenger,
            Vitamix.Fill.Logos.pinterest,
            Vitamix.Fill.Logos.safari,
            Vitamix.Fill.Logos.slack,
            Vitamix.Fill.Logos.snapchat,
            Vitamix.Fill.Logos.telegram,
            Vitamix.Fill.Logos.twitter,
            Vitamix.Fill.Logos.viber,
            Vitamix.Fill.Logos.whatsapp,
            Vitamix.Fill.Logos.youtube
        ]),
        IconsModel.Section(name: "Map - Line", items: [
            Vitamix.Line.Map.car,
            Vitamix.Line.Map.direction,
            Vitamix.Line.Map.distance,
            Vitamix.Line.Map.earth,
            Vitamix.Line.Map.mapPin,
            Vitamix.Line.Map.navigation,
            Vitamix.Line.Map.suitcase,
            Vitamix.Line.Map.train,
            Vitamix.Line.Map.truck,
            Vitamix.Line.Map.walk
        ]),
        IconsModel.Section(name: "Map - Fill", items: [
            Vitamix.Fill.Map.car,
            Vitamix.Fill.Map.direction,
            Vitamix.Fill.Map.distance,
            Vitamix.Fill.Map.earth,
            Vitamix.Fill.Map.mapPin,
            Vitamix.Fill.Map.navigation,
            Vitamix.Fill.Map.suitcase,
            Vitamix.Fill.Map.train,
            Vitamix.Fill.Map.truck,
            Vitamix.Fill.Map.walk
        ]),
        IconsModel.Section(name: "Media - Line", items: [
            Vitamix.Line.Media.camera,
            Vitamix.Line.Media.equalizer,
            Vitamix.Line.Media.film,
            Vitamix.Line.Media.fullscreen,
            Vitamix.Line.Media.image,
            Vitamix.Line.Media.mic,
            Vitamix.Line.Media.music,
            Vitamix.Line.Media.music2,
            Vitamix.Line.Media.notification,
            Vitamix.Line.Media.pause,
            Vitamix.Line.Media.pauseCircle,
            Vitamix.Line.Media.play,
            Vitamix.Line.Media.playCircle,
            Vitamix.Line.Media.repeatMedia,
            Vitamix.Line.Media.stop,
            Vitamix.Line.Media.stopCircle,
            Vitamix.Line.Media.volumeDown,
            Vitamix.Line.Media.volumeMute,
            Vitamix.Line.Media.volumeUp
        ]),
        IconsModel.Section(name: "Media - Fill", items: [
            Vitamix.Fill.Media.camera,
            Vitamix.Fill.Media.equalizer,
            Vitamix.Fill.Media.film,
            Vitamix.Fill.Media.fullscreen,
            Vitamix.Fill.Media.image,
            Vitamix.Fill.Media.mic,
            Vitamix.Fill.Media.music,
            Vitamix.Fill.Media.music2,
            Vitamix.Fill.Media.notification,
            Vitamix.Fill.Media.pause,
            Vitamix.Fill.Media.pauseCircle,
            Vitamix.Fill.Media.play,
            Vitamix.Fill.Media.playCircle,
            Vitamix.Fill.Media.repeatMedia,
            Vitamix.Fill.Media.stop,
            Vitamix.Fill.Media.stopCircle,
            Vitamix.Fill.Media.volumeDown,
            Vitamix.Fill.Media.volumeMute,
            Vitamix.Fill.Media.volumeUp
        ]),
        IconsModel.Section(name: "Others - Line", items: [
            Vitamix.Line.Others.scales,
            Vitamix.Line.Others.tShirt
        ]),
        IconsModel.Section(name: "Others - Fill", items: [
            Vitamix.Fill.Others.scales,
            Vitamix.Fill.Others.tShirt
        ]),
        IconsModel.Section(name: "Services - Line", items: [
            Vitamix.Line.Services.selectedByDecathlon
        ]),
        IconsModel.Section(name: "Services - Fill", items: [
            Vitamix.Fill.Services.selectedByDecathlon
        ]),
        IconsModel.Section(name: "System - Line", items: [
            Vitamix.Line.System.add,
            Vitamix.Line.System.alert,
            Vitamix.Line.System.arrowDown,
            Vitamix.Line.System.arrowDownCircle,
            Vitamix.Line.System.arrowDownS,
            Vitamix.Line.System.arrowDropDown,
            Vitamix.Line.System.arrowDropLeft,
            Vitamix.Line.System.arrowDropRight,
            Vitamix.Line.System.arrowDropUp,
            Vitamix.Line.System.arrowGoBack,
            Vitamix.Line.System.arrowGoForward,
            Vitamix.Line.System.arrowLeft,
            Vitamix.Line.System.arrowLeftCircle,
            Vitamix.Line.System.arrowLeftDown,
            Vitamix.Line.System.arrowLeftRight,
            Vitamix.Line.System.arrowLeftS,
            Vitamix.Line.System.arrowLeftUp,
            Vitamix.Line.System.arrowRight,
            Vitamix.Line.System.arrowRightCircle,
            Vitamix.Line.System.arrowRightDown,
            Vitamix.Line.System.arrowRightS,
            Vitamix.Line.System.arrowRightUp,
            Vitamix.Line.System.arrowUp,
            Vitamix.Line.System.arrowUpCircle,
            Vitamix.Line.System.arrowUpDown,
            Vitamix.Line.System.arrowUpS,
            Vitamix.Line.System.check,
            Vitamix.Line.System.checkbox,
            Vitamix.Line.System.checkboxBlank,
            Vitamix.Line.System.checkboxBlankCircle,
            Vitamix.Line.System.checkboxCircle,
            Vitamix.Line.System.checkboxMultiple,
            Vitamix.Line.System.close,
            Vitamix.Line.System.closeCircle,
            Vitamix.Line.System.counter,
            Vitamix.Line.System.deleteBin,
            Vitamix.Line.System.download,
            Vitamix.Line.System.errorWarning,
            Vitamix.Line.System.externalLink,
            Vitamix.Line.System.eye,
            Vitamix.Line.System.eyeOff,
            Vitamix.Line.System.filter,
            Vitamix.Line.System.filterOff,
            Vitamix.Line.System.function,
            Vitamix.Line.System.history,
            Vitamix.Line.System.information,
            Vitamix.Line.System.listSettings,
            Vitamix.Line.System.lock,
            Vitamix.Line.System.menu,
            Vitamix.Line.System.more,
            Vitamix.Line.System.more2,
            Vitamix.Line.System.package,
            Vitamix.Line.System.question,
            Vitamix.Line.System.radioButton,
            Vitamix.Line.System.refresh,
            Vitamix.Line.System.search,
            Vitamix.Line.System.settings,
            Vitamix.Line.System.share,
            Vitamix.Line.System.shieldCheck,
            Vitamix.Line.System.star,
            Vitamix.Line.System.starHalf,
            Vitamix.Line.System.subtract,
            Vitamix.Line.System.thumbDown,
            Vitamix.Line.System.thumbUp,
            Vitamix.Line.System.time,
            Vitamix.Line.System.timer,
            Vitamix.Line.System.upload
        ]),
        IconsModel.Section(name: "System - Line", items: [
            Vitamix.Fill.System.add,
            Vitamix.Fill.System.alert,
            Vitamix.Fill.System.arrowDown,
            Vitamix.Fill.System.arrowDownCircle,
            Vitamix.Fill.System.arrowDownS,
            Vitamix.Fill.System.arrowDropDown,
            Vitamix.Fill.System.arrowDropLeft,
            Vitamix.Fill.System.arrowDropRight,
            Vitamix.Fill.System.arrowDropUp,
            Vitamix.Fill.System.arrowGoBack,
            Vitamix.Fill.System.arrowGoForward,
            Vitamix.Fill.System.arrowLeft,
            Vitamix.Fill.System.arrowLeftCircle,
            Vitamix.Fill.System.arrowLeftDown,
            Vitamix.Fill.System.arrowLeftRight,
            Vitamix.Fill.System.arrowLeftS,
            Vitamix.Fill.System.arrowLeftUp,
            Vitamix.Fill.System.arrowRight,
            Vitamix.Fill.System.arrowRightCircle,
            Vitamix.Fill.System.arrowRightDown,
            Vitamix.Fill.System.arrowRightS,
            Vitamix.Fill.System.arrowRightUp,
            Vitamix.Fill.System.arrowUp,
            Vitamix.Fill.System.arrowUpCircle,
            Vitamix.Fill.System.arrowUpDown,
            Vitamix.Fill.System.arrowUpS,
            Vitamix.Fill.System.check,
            Vitamix.Fill.System.checkbox,
            Vitamix.Fill.System.checkboxBlank,
            Vitamix.Fill.System.checkboxBlankCircle,
            Vitamix.Fill.System.checkboxCircle,
            Vitamix.Fill.System.checkboxMultiple,
            Vitamix.Fill.System.close,
            Vitamix.Fill.System.closeCircle,
            Vitamix.Fill.System.counter,
            Vitamix.Fill.System.deleteBin,
            Vitamix.Fill.System.download,
            Vitamix.Fill.System.errorWarning,
            Vitamix.Fill.System.externalLink,
            Vitamix.Fill.System.eye,
            Vitamix.Fill.System.eyeOff,
            Vitamix.Fill.System.filter,
            Vitamix.Fill.System.filterOff,
            Vitamix.Fill.System.function,
            Vitamix.Fill.System.history,
            Vitamix.Fill.System.information,
            Vitamix.Fill.System.listSettings,
            Vitamix.Fill.System.lock,
            Vitamix.Fill.System.menu,
            Vitamix.Fill.System.more,
            Vitamix.Fill.System.more2,
            Vitamix.Fill.System.package,
            Vitamix.Fill.System.question,
            Vitamix.Fill.System.radioButton,
            Vitamix.Fill.System.refresh,
            Vitamix.Fill.System.search,
            Vitamix.Fill.System.settings,
            Vitamix.Fill.System.share,
            Vitamix.Fill.System.shieldCheck,
            Vitamix.Fill.System.star,
            Vitamix.Fill.System.starHalf,
            Vitamix.Fill.System.subtract,
            Vitamix.Fill.System.thumbDown,
            Vitamix.Fill.System.thumbUp,
            Vitamix.Fill.System.time,
            Vitamix.Fill.System.timer,
            Vitamix.Fill.System.upload
        ]),
        IconsModel.Section(name: "Task - Line", items: [
            Vitamix.Line.Tasks.task
        ]),
        IconsModel.Section(name: "Tasks - Fill", items: [
            Vitamix.Fill.Tasks.task
        ]),
        IconsModel.Section(name: "User - Line", items: [
            Vitamix.Line.User.emotion,
            Vitamix.Line.User.emotionLaugh,
            Vitamix.Line.User.emotionNormal,
            Vitamix.Line.User.emotionSad,
            Vitamix.Line.User.emotionUnhappy,
            Vitamix.Line.User.group,
            Vitamix.Line.User.user
        ]),
        IconsModel.Section(name: "User - Fill", items: [
            Vitamix.Fill.User.emotion,
            Vitamix.Fill.User.emotionLaugh,
            Vitamix.Fill.User.emotionNormal,
            Vitamix.Fill.User.emotionSad,
            Vitamix.Fill.User.emotionUnhappy,
            Vitamix.Fill.User.group,
            Vitamix.Fill.User.user
        ]),
        IconsModel.Section(name: "Weather - Line", items: [
            Vitamix.Line.Weather.cloud,
            Vitamix.Line.Weather.cloudWindy,
            Vitamix.Line.Weather.fire,
            Vitamix.Line.Weather.flashlight,
            Vitamix.Line.Weather.foggy,
            Vitamix.Line.Weather.hail,
            Vitamix.Line.Weather.mist,
            Vitamix.Line.Weather.moonCloudy,
            Vitamix.Line.Weather.moon,
            Vitamix.Line.Weather.rainy,
            Vitamix.Line.Weather.showers,
            Vitamix.Line.Weather.snowy,
            Vitamix.Line.Weather.sun,
            Vitamix.Line.Weather.sunCloudy,
            Vitamix.Line.Weather.tempCold,
            Vitamix.Line.Weather.tempHot,
            Vitamix.Line.Weather.thunderstorms,
            Vitamix.Line.Weather.windy
        ]),
        IconsModel.Section(name: "Weather - Fill", items: [
            Vitamix.Fill.Weather.cloud,
            Vitamix.Fill.Weather.cloudWindy,
            Vitamix.Fill.Weather.fire,
            Vitamix.Fill.Weather.flashlight,
            Vitamix.Fill.Weather.foggy,
            Vitamix.Fill.Weather.hail,
            Vitamix.Fill.Weather.mist,
            Vitamix.Fill.Weather.moonCloudy,
            Vitamix.Fill.Weather.moon,
            Vitamix.Fill.Weather.rainy,
            Vitamix.Fill.Weather.showers,
            Vitamix.Fill.Weather.snowy,
            Vitamix.Fill.Weather.sun,
            Vitamix.Fill.Weather.sunCloudy,
            Vitamix.Fill.Weather.tempCold,
            Vitamix.Fill.Weather.tempHot,
            Vitamix.Fill.Weather.thunderstorms,
            Vitamix.Fill.Weather.windy
        ])
    ]
}

@available(iOS 13, *)
extension VitaminImageAsset: AssetProtocol {
    var label: String {
        name.components(separatedBy: "/").last ?? name
    }
}
#endif
