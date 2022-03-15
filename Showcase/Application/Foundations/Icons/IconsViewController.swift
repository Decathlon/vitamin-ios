//
//  Vitamin iOS
//  Apache License 2.0
//

// swiftlint:disable file_length
import UIKit
import Vitamin

final class IconsViewController: BaseImageCollectionViewController {
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = false
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.estimatedItemSize = .zero
        self.init(collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        sections = makeSections()

        view.backgroundColor = VitaminColor.Core.Background.primary

        navigationItem.title = "Icons"
        collectionView.register(
            UINib(
                nibName: "IconCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "icon")

        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header")

        if let flow = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.headerReferenceSize = CGSize(width: view.frame.width, height: 55)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension IconsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: view.frame.width / 5, height: 80)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}

extension IconsViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        sections[section].items.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "icon",
            for: indexPath) as? IconCollectionViewCell,
              let iconItem = sections[indexPath.section].items[indexPath.row] as? IconItem else {
                    return IconCollectionViewCell()
                }
        cell.setImage(iconItem.image,
                      name: iconItem.shortName,
                      color: VitaminColor.Core.Content.primary)
        return cell
    }
}

extension IconsViewController {
    private struct IconSection: BaseImageSection {
        let name: String
        let items: [BaseImageItem]
    }

    private struct IconItem: BaseImageItem {
        let name: String
        let image: UIImage

        var shortName: String {
            let components = name.components(separatedBy: ".")
            if components.count >= 4 {
                return components[3]
            }
            return name
        }
    }

    // swiftlint:disable function_body_length
    private func makeSections() -> [IconSection] {
        let tempSections = [
            IconSection(name: "Buildings - Line", items: [
                IconItem(name: "Vitamix.Line.Buildings.home.image", image: Vitamix.Line.Buildings.home.image),
                IconItem(name: "Vitamix.Line.Buildings.store.image", image: Vitamix.Line.Buildings.store.image)
            ]),
            IconSection(name: "Buildings - Fill", items: [
                IconItem(name: "Vitamix.Fill.Buildings.home.image", image: Vitamix.Fill.Buildings.home.image),
                IconItem(name: "Vitamix.Fill.Buildings.store.image", image: Vitamix.Fill.Buildings.store.image)
            ]),
            IconSection(name: "Buildings - Line", items: [
                IconItem(name: "Vitamix.Line.Business.award.image", image: Vitamix.Line.Business.award.image),
                IconItem(name: "Vitamix.Line.Business.calendar.image", image: Vitamix.Line.Business.calendar.image),
                IconItem(name: "Vitamix.Line.Business.calendar2.image", image: Vitamix.Line.Business.calendar2.image),
                IconItem(
                    name: "Vitamix.Line.Business.calendarCheck.image",
                    image: Vitamix.Line.Business.calendarCheck.image),
                IconItem(
                    name: "Vitamix.Line.Business.calendarDate.image",
                    image: Vitamix.Line.Business.calendarDate.image),
                IconItem(name: "Vitamix.Line.Business.mail.image", image: Vitamix.Line.Business.mail.image),
                IconItem(name: "Vitamix.Line.Business.mailSend.image", image: Vitamix.Line.Business.mailSend.image),
                IconItem(name: "Vitamix.Line.Business.printer.image", image: Vitamix.Line.Business.printer.image)
            ]),
            IconSection(name: "Buildings - Fill", items: [
                IconItem(name: "Vitamix.Fill.Business.award.image", image: Vitamix.Fill.Business.award.image),
                IconItem(name: "Vitamix.Fill.Business.calendar.image", image: Vitamix.Fill.Business.calendar.image),
                IconItem(name: "Vitamix.Fill.Business.calendar2.image", image: Vitamix.Fill.Business.calendar2.image),
                IconItem(
                    name: "Vitamix.Fill.Business.calendarCheck.image",
                    image: Vitamix.Fill.Business.calendarCheck.image),
                IconItem(
                    name: "Vitamix.Fill.Business.calendarDate.image",
                    image: Vitamix.Fill.Business.calendarDate.image),
                IconItem(name: "Vitamix.Fill.Business.mail.image", image: Vitamix.Fill.Business.mail.image),
                IconItem(name: "Vitamix.Fill.Business.mailSend.image", image: Vitamix.Fill.Business.mailSend.image),
                IconItem(name: "Vitamix.Fill.Business.printer.image", image: Vitamix.Fill.Business.printer.image)
            ]),
            IconSection(name: "Communication - Line", items: [
                IconItem(
                    name: "Vitamix.Line.Communication.feedback.image",
                    image: Vitamix.Line.Communication.feedback.image),
                IconItem(
                    name: "Vitamix.Line.Communication.message.image",
                    image: Vitamix.Line.Communication.message.image)
            ]),
            IconSection(name: "Communication - Fill", items: [
                IconItem(
                    name: "Vitamix.Fill.Communication.feedback.image",
                    image: Vitamix.Fill.Communication.feedback.image),
                IconItem(
                    name: "Vitamix.Fill.Communication.message.image",
                    image: Vitamix.Fill.Communication.message.image)
            ]),
            IconSection(name: "Design - Line", items: [
                IconItem(name: "Vitamix.Line.Design.edit.image", image: Vitamix.Line.Design.edit.image),
                IconItem(name: "Vitamix.Line.Design.focus.image", image: Vitamix.Line.Design.focus.image),
                IconItem(name: "Vitamix.Line.Design.ruler.image", image: Vitamix.Line.Design.ruler.image)
            ]),
            IconSection(name: "Design - Fill", items: [
                IconItem(name: "Vitamix.Fill.Design.edit.image", image: Vitamix.Fill.Design.edit.image),
                IconItem(name: "Vitamix.Fill.Design.focus.image", image: Vitamix.Fill.Design.focus.image),
                IconItem(name: "Vitamix.Fill.Design.ruler.image", image: Vitamix.Fill.Design.ruler.image)
            ]),
            IconSection(name: "Device - Line", items: [
                IconItem(name: "Vitamix.Line.Device.database.image", image: Vitamix.Line.Device.database.image),
                IconItem(name: "Vitamix.Line.Device.mac.image", image: Vitamix.Line.Device.mac.image),
                IconItem(name: "Vitamix.Line.Device.macbook.image", image: Vitamix.Line.Device.macbook.image),
                IconItem(name: "Vitamix.Line.Device.phone.image", image: Vitamix.Line.Device.phone.image),
                IconItem(name: "Vitamix.Line.Device.shutdown.image", image: Vitamix.Line.Device.shutdown.image),
                IconItem(name: "Vitamix.Line.Device.smartphone.image", image: Vitamix.Line.Device.smartphone.image)
            ]),
            IconSection(name: "Device - Fill", items: [
                IconItem(name: "Vitamix.Fill.Device.database.image", image: Vitamix.Fill.Device.database.image),
                IconItem(name: "Vitamix.Fill.Device.mac.image", image: Vitamix.Fill.Device.mac.image),
                IconItem(name: "Vitamix.Fill.Device.macbook.image", image: Vitamix.Fill.Device.macbook.image),
                IconItem(name: "Vitamix.Fill.Device.phone.image", image: Vitamix.Fill.Device.phone.image),
                IconItem(name: "Vitamix.Fill.Device.shutdown.image", image: Vitamix.Fill.Device.shutdown.image),
                IconItem(name: "Vitamix.Fill.Device.smartphone.image", image: Vitamix.Fill.Device.smartphone.image)
            ]),
            IconSection(name: "Documents - Line", items: [
                IconItem(name: "Vitamix.Line.Documents.bill.image", image: Vitamix.Line.Documents.bill.image),
                IconItem(name: "Vitamix.Line.Documents.file.image", image: Vitamix.Line.Documents.file.image)
            ]),
            IconSection(name: "Documents - Fill", items: [
                IconItem(name: "Vitamix.Fill.Documents.bill.image", image: Vitamix.Fill.Documents.bill.image),
                IconItem(name: "Vitamix.Fill.Documents.file.image", image: Vitamix.Fill.Documents.file.image)
            ]),
            IconSection(name: "Editor - Line", items: [
                IconItem(name: "Vitamix.Line.Editor.attachment.image", image: Vitamix.Line.Editor.attachment.image),
                IconItem(name: "Vitamix.Line.Editor.link.image", image: Vitamix.Line.Editor.link.image),
                IconItem(name: "Vitamix.Line.Editor.listCheck.image", image: Vitamix.Line.Editor.listCheck.image),
                IconItem(name: "Vitamix.Line.Editor.unlink.image", image: Vitamix.Line.Editor.unlink.image)
            ]),
            IconSection(name: "Editor - Fill", items: [
                IconItem(name: "Vitamix.Fill.Editor.attachment.image", image: Vitamix.Fill.Editor.attachment.image),
                IconItem(name: "Vitamix.Fill.Editor.link.image", image: Vitamix.Fill.Editor.link.image),
                IconItem(name: "Vitamix.Fill.Editor.listCheck.image", image: Vitamix.Fill.Editor.listCheck.image),
                IconItem(name: "Vitamix.Fill.Editor.unlink.image", image: Vitamix.Fill.Editor.unlink.image)
            ]),
            IconSection(name: "Finance - Line", items: [
                IconItem(name: "Vitamix.Line.Finance.bankCard.image", image: Vitamix.Line.Finance.bankCard.image),
                IconItem(name: "Vitamix.Line.Finance.exchange.image", image: Vitamix.Line.Finance.exchange.image),
                IconItem(name: "Vitamix.Line.Finance.gift.image", image: Vitamix.Line.Finance.gift.image),
                IconItem(name: "Vitamix.Line.Finance.mastercard.image", image: Vitamix.Line.Finance.mastercard.image),
                IconItem(name: "Vitamix.Line.Finance.moneyCnyBox.image", image: Vitamix.Line.Finance.moneyCnyBox.image),
                IconItem(
                    name: "Vitamix.Line.Finance.moneyDollarBox.image",
                    image: Vitamix.Line.Finance.moneyDollarBox.image),
                IconItem(
                    name: "Vitamix.Line.Finance.moneyEuroBox.image",
                    image: Vitamix.Line.Finance.moneyEuroBox.image),
                IconItem(
                    name: "Vitamix.Line.Finance.moneyPoundBox.image",
                    image: Vitamix.Line.Finance.moneyPoundBox.image),
                IconItem(
                    name: "Vitamix.Line.Finance.productReturn.image",
                    image: Vitamix.Line.Finance.productReturn.image),
                IconItem(name: "Vitamix.Line.Finance.refund.image", image: Vitamix.Line.Finance.refund.image),
                IconItem(
                    name: "Vitamix.Line.Finance.securePayment.image",
                    image: Vitamix.Line.Finance.securePayment.image),
                IconItem(
                    name: "Vitamix.Line.Finance.shoppingCart.image",
                    image: Vitamix.Line.Finance.shoppingCart.image),
                IconItem(name: "Vitamix.Line.Finance.visa.image", image: Vitamix.Line.Finance.visa.image)
            ]),
            IconSection(name: "Finance - Fill", items: [
                IconItem(name: "Vitamix.Fill.Finance.bankCard.image", image: Vitamix.Fill.Finance.bankCard.image),
                IconItem(name: "Vitamix.Fill.Finance.exchange.image", image: Vitamix.Fill.Finance.exchange.image),
                IconItem(name: "Vitamix.Fill.Finance.gift.image", image: Vitamix.Fill.Finance.gift.image),
                IconItem(name: "Vitamix.Fill.Finance.mastercard.image", image: Vitamix.Fill.Finance.mastercard.image),
                IconItem(name: "Vitamix.Fill.Finance.moneyCnyBox.image", image: Vitamix.Fill.Finance.moneyCnyBox.image),
                IconItem(
                    name: "Vitamix.Fill.Finance.moneyDollarBox.image",
                    image: Vitamix.Fill.Finance.moneyDollarBox.image),
                IconItem(
                    name: "Vitamix.Fill.Finance.moneyEuroBox.image",
                    image: Vitamix.Fill.Finance.moneyEuroBox.image),
                IconItem(
                    name: "Vitamix.Fill.Finance.moneyPoundBox.image",
                    image: Vitamix.Fill.Finance.moneyPoundBox.image),
                IconItem(
                    name: "Vitamix.Fill.Finance.productReturn.image",
                    image: Vitamix.Fill.Finance.productReturn.image),
                IconItem(name: "Vitamix.Fill.Finance.refund.image", image: Vitamix.Fill.Finance.refund.image),
                IconItem(
                    name: "Vitamix.Fill.Finance.securePayment.image",
                    image: Vitamix.Fill.Finance.securePayment.image),
                IconItem(
                    name: "Vitamix.Fill.Finance.shoppingCart.image",
                    image: Vitamix.Fill.Finance.shoppingCart.image),
                IconItem(name: "Vitamix.Fill.Finance.visa.image", image: Vitamix.Fill.Finance.visa.image)
            ]),
            IconSection(name: "Health and Medical - Line", items: [
                IconItem(name: "Vitamix.Line.Health.heart.image", image: Vitamix.Line.Health.heart.image),
                IconItem(name: "Vitamix.Line.Health.heartPulse.image", image: Vitamix.Line.Health.heartPulse.image)
            ]),
            IconSection(name: "Health and Medical - Fill", items: [
                IconItem(name: "Vitamix.Fill.Health.heart.image", image: Vitamix.Fill.Health.heart.image),
                IconItem(name: "Vitamix.Fill.Health.heartPulse.image", image: Vitamix.Fill.Health.heartPulse.image)
            ]),
            IconSection(name: "Logos - Line", items: [
                IconItem(name: "Vitamix.Line.Logos.amazon.image", image: Vitamix.Line.Logos.amazon.image),
                IconItem(name: "Vitamix.Line.Logos.android.image", image: Vitamix.Line.Logos.android.image),
                IconItem(name: "Vitamix.Line.Logos.apple.image", image: Vitamix.Line.Logos.apple.image),
                IconItem(name: "Vitamix.Line.Logos.chrome.image", image: Vitamix.Line.Logos.chrome.image),
                IconItem(name: "Vitamix.Line.Logos.drive.image", image: Vitamix.Line.Logos.drive.image),
                IconItem(name: "Vitamix.Line.Logos.facebook.image", image: Vitamix.Line.Logos.facebook.image),
                IconItem(name: "Vitamix.Line.Logos.firefox.image", image: Vitamix.Line.Logos.firefox.image),
                IconItem(name: "Vitamix.Line.Logos.google.image", image: Vitamix.Line.Logos.google.image),
                IconItem(name: "Vitamix.Line.Logos.ie.image", image: Vitamix.Line.Logos.ie.image),
                IconItem(name: "Vitamix.Line.Logos.instagram.image", image: Vitamix.Line.Logos.instagram.image),
                IconItem(name: "Vitamix.Line.Logos.messenger.image", image: Vitamix.Line.Logos.messenger.image),
                IconItem(name: "Vitamix.Line.Logos.pinterest.image", image: Vitamix.Line.Logos.pinterest.image),
                IconItem(name: "Vitamix.Line.Logos.safari.image", image: Vitamix.Line.Logos.safari.image),
                IconItem(name: "Vitamix.Line.Logos.slack.image", image: Vitamix.Line.Logos.slack.image),
                IconItem(name: "Vitamix.Line.Logos.snapchat.image", image: Vitamix.Line.Logos.snapchat.image),
                IconItem(name: "Vitamix.Line.Logos.telegram.image", image: Vitamix.Line.Logos.telegram.image),
                IconItem(name: "Vitamix.Line.Logos.twitter.image", image: Vitamix.Line.Logos.twitter.image),
                IconItem(name: "Vitamix.Line.Logos.viber.image", image: Vitamix.Line.Logos.viber.image),
                IconItem(name: "Vitamix.Line.Logos.whatsapp.image", image: Vitamix.Line.Logos.whatsapp.image),
                IconItem(name: "Vitamix.Line.Logos.youtube.image", image: Vitamix.Line.Logos.youtube.image)
            ]),
            IconSection(name: "Logos - Fill", items: [
                IconItem(name: "Vitamix.Fill.Logos.amazon.image", image: Vitamix.Fill.Logos.amazon.image),
                IconItem(name: "Vitamix.Fill.Logos.android.image", image: Vitamix.Fill.Logos.android.image),
                IconItem(name: "Vitamix.Fill.Logos.apple.image", image: Vitamix.Fill.Logos.apple.image),
                IconItem(name: "Vitamix.Fill.Logos.chrome.image", image: Vitamix.Fill.Logos.chrome.image),
                IconItem(name: "Vitamix.Fill.Logos.drive.image", image: Vitamix.Fill.Logos.drive.image),
                IconItem(name: "Vitamix.Fill.Logos.facebook.image", image: Vitamix.Fill.Logos.facebook.image),
                IconItem(name: "Vitamix.Fill.Logos.firefox.image", image: Vitamix.Fill.Logos.firefox.image),
                IconItem(name: "Vitamix.Fill.Logos.google.image", image: Vitamix.Fill.Logos.google.image),
                IconItem(name: "Vitamix.Fill.Logos.ie.image", image: Vitamix.Fill.Logos.ie.image),
                IconItem(name: "Vitamix.Fill.Logos.instagram.image", image: Vitamix.Fill.Logos.instagram.image),
                IconItem(name: "Vitamix.Fill.Logos.messenger.image", image: Vitamix.Fill.Logos.messenger.image),
                IconItem(name: "Vitamix.Fill.Logos.pinterest.image", image: Vitamix.Fill.Logos.pinterest.image),
                IconItem(name: "Vitamix.Fill.Logos.safari.image", image: Vitamix.Fill.Logos.safari.image),
                IconItem(name: "Vitamix.Fill.Logos.slack.image", image: Vitamix.Fill.Logos.slack.image),
                IconItem(name: "Vitamix.Fill.Logos.snapchat.image", image: Vitamix.Fill.Logos.snapchat.image),
                IconItem(name: "Vitamix.Fill.Logos.telegram.image", image: Vitamix.Fill.Logos.telegram.image),
                IconItem(name: "Vitamix.Fill.Logos.twitter.image", image: Vitamix.Fill.Logos.twitter.image),
                IconItem(name: "Vitamix.Fill.Logos.viber.image", image: Vitamix.Fill.Logos.viber.image),
                IconItem(name: "Vitamix.Fill.Logos.whatsapp.image", image: Vitamix.Fill.Logos.whatsapp.image),
                IconItem(name: "Vitamix.Fill.Logos.youtube.image", image: Vitamix.Fill.Logos.youtube.image)
            ]),
            IconSection(name: "Map - Line", items: [
                IconItem(name: "Vitamix.Line.Map.car.image", image: Vitamix.Line.Map.car.image),
                IconItem(name: "Vitamix.Line.Map.direction.image", image: Vitamix.Line.Map.direction.image),
                IconItem(name: "Vitamix.Line.Map.distance.image", image: Vitamix.Line.Map.distance.image),
                IconItem(name: "Vitamix.Line.Map.earth.image", image: Vitamix.Line.Map.earth.image),
                IconItem(name: "Vitamix.Line.Map.mapPin.image", image: Vitamix.Line.Map.mapPin.image),
                IconItem(name: "Vitamix.Line.Map.navigation.image", image: Vitamix.Line.Map.navigation.image),
                IconItem(name: "Vitamix.Line.Map.suitcase.image", image: Vitamix.Line.Map.suitcase.image),
                IconItem(name: "Vitamix.Line.Map.train.image", image: Vitamix.Line.Map.train.image),
                IconItem(name: "Vitamix.Line.Map.truck.image", image: Vitamix.Line.Map.truck.image),
                IconItem(name: "Vitamix.Line.Map.walk.image", image: Vitamix.Line.Map.walk.image)
            ]),
            IconSection(name: "Map - Fill", items: [
                IconItem(name: "Vitamix.Fill.Map.car.image", image: Vitamix.Fill.Map.car.image),
                IconItem(name: "Vitamix.Fill.Map.direction.image", image: Vitamix.Fill.Map.direction.image),
                IconItem(name: "Vitamix.Fill.Map.distance.image", image: Vitamix.Fill.Map.distance.image),
                IconItem(name: "Vitamix.Fill.Map.earth.image", image: Vitamix.Fill.Map.earth.image),
                IconItem(name: "Vitamix.Fill.Map.mapPin.image", image: Vitamix.Fill.Map.mapPin.image),
                IconItem(name: "Vitamix.Fill.Map.navigation.image", image: Vitamix.Fill.Map.navigation.image),
                IconItem(name: "Vitamix.Fill.Map.suitcase.image", image: Vitamix.Fill.Map.suitcase.image),
                IconItem(name: "Vitamix.Fill.Map.train.image", image: Vitamix.Fill.Map.train.image),
                IconItem(name: "Vitamix.Fill.Map.truck.image", image: Vitamix.Fill.Map.truck.image),
                IconItem(name: "Vitamix.Fill.Map.walk.image", image: Vitamix.Fill.Map.walk.image)
            ]),
            IconSection(name: "Media - Line", items: [
                IconItem(name: "Vitamix.Line.Media.camera.image", image: Vitamix.Line.Media.camera.image),
                IconItem(name: "Vitamix.Line.Media.equalizer.image", image: Vitamix.Line.Media.equalizer.image),
                IconItem(name: "Vitamix.Line.Media.film.image", image: Vitamix.Line.Media.film.image),
                IconItem(name: "Vitamix.Line.Media.fullscreen.image", image: Vitamix.Line.Media.fullscreen.image),
                IconItem(name: "Vitamix.Line.Media.image.image", image: Vitamix.Line.Media.image.image),
                IconItem(name: "Vitamix.Line.Media.mic.image", image: Vitamix.Line.Media.mic.image),
                IconItem(name: "Vitamix.Line.Media.music.image", image: Vitamix.Line.Media.music.image),
                IconItem(name: "Vitamix.Line.Media.music2.image", image: Vitamix.Line.Media.music2.image),
                IconItem(name: "Vitamix.Line.Media.notification.image", image: Vitamix.Line.Media.notification.image),
                IconItem(name: "Vitamix.Line.Media.pause.image", image: Vitamix.Line.Media.pause.image),
                IconItem(name: "Vitamix.Line.Media.pauseCircle.image", image: Vitamix.Line.Media.pauseCircle.image),
                IconItem(name: "Vitamix.Line.Media.play.image", image: Vitamix.Line.Media.play.image),
                IconItem(name: "Vitamix.Line.Media.playCircle.image", image: Vitamix.Line.Media.playCircle.image),
                IconItem(name: "Vitamix.Line.Media.repeatMedia.image", image: Vitamix.Line.Media.repeatMedia.image),
                IconItem(name: "Vitamix.Line.Media.stop.image", image: Vitamix.Line.Media.stop.image),
                IconItem(name: "Vitamix.Line.Media.stopCircle.image", image: Vitamix.Line.Media.stopCircle.image),
                IconItem(name: "Vitamix.Line.Media.volumeDown.image", image: Vitamix.Line.Media.volumeDown.image),
                IconItem(name: "Vitamix.Line.Media.volumeMute.image", image: Vitamix.Line.Media.volumeMute.image),
                IconItem(name: "Vitamix.Line.Media.volumeUp.image", image: Vitamix.Line.Media.volumeUp.image)
            ]),
            IconSection(name: "Media - Fill", items: [
                IconItem(name: "Vitamix.Fill.Media.camera.image", image: Vitamix.Fill.Media.camera.image),
                IconItem(name: "Vitamix.Fill.Media.equalizer.image", image: Vitamix.Fill.Media.equalizer.image),
                IconItem(name: "Vitamix.Fill.Media.film.image", image: Vitamix.Fill.Media.film.image),
                IconItem(name: "Vitamix.Fill.Media.fullscreen.image", image: Vitamix.Fill.Media.fullscreen.image),
                IconItem(name: "Vitamix.Fill.Media.image.image", image: Vitamix.Fill.Media.image.image),
                IconItem(name: "Vitamix.Fill.Media.mic.image", image: Vitamix.Fill.Media.mic.image),
                IconItem(name: "Vitamix.Fill.Media.music.image", image: Vitamix.Fill.Media.music.image),
                IconItem(name: "Vitamix.Fill.Media.music2.image", image: Vitamix.Fill.Media.music2.image),
                IconItem(name: "Vitamix.Fill.Media.notification.image", image: Vitamix.Fill.Media.notification.image),
                IconItem(name: "Vitamix.Fill.Media.pause.image", image: Vitamix.Fill.Media.pause.image),
                IconItem(name: "Vitamix.Fill.Media.pauseCircle.image", image: Vitamix.Fill.Media.pauseCircle.image),
                IconItem(name: "Vitamix.Fill.Media.play.image", image: Vitamix.Fill.Media.play.image),
                IconItem(name: "Vitamix.Fill.Media.playCircle.image", image: Vitamix.Fill.Media.playCircle.image),
                IconItem(name: "Vitamix.Fill.Media.repeatMedia.image", image: Vitamix.Fill.Media.repeatMedia.image),
                IconItem(name: "Vitamix.Fill.Media.stop.image", image: Vitamix.Fill.Media.stop.image),
                IconItem(name: "Vitamix.Fill.Media.stopCircle.image", image: Vitamix.Fill.Media.stopCircle.image),
                IconItem(name: "Vitamix.Fill.Media.volumeDown.image", image: Vitamix.Fill.Media.volumeDown.image),
                IconItem(name: "Vitamix.Fill.Media.volumeMute.image", image: Vitamix.Fill.Media.volumeMute.image),
                IconItem(name: "Vitamix.Fill.Media.volumeUp.image", image: Vitamix.Fill.Media.volumeUp.image)
            ]),
            IconSection(name: "Others - Line", items: [
                IconItem(name: "Vitamix.Line.Others.scales.image", image: Vitamix.Line.Others.scales.image),
                IconItem(name: "Vitamix.Line.Others.tShirt.image", image: Vitamix.Line.Others.tShirt.image)
            ]),
            IconSection(name: "Others - Fill", items: [
                IconItem(name: "Vitamix.Fill.Others.scales.image", image: Vitamix.Fill.Others.scales.image),
                IconItem(name: "Vitamix.Fill.Others.tShirt.image", image: Vitamix.Fill.Others.tShirt.image)
            ]),
            IconSection(name: "Services - Line", items: [
                IconItem(
                    name: "Vitamix.Line.Services.selectedByDecathlon.image",
                    image: Vitamix.Line.Services.selectedByDecathlon.image)
            ]),
            IconSection(name: "Services - Fill", items: [
                IconItem(
                    name: "Vitamix.Fill.Services.selectedByDecathlon.image",
                    image: Vitamix.Fill.Services.selectedByDecathlon.image)
            ]),
            IconSection(name: "System - Line", items: [
                IconItem(name: "Vitamix.Line.System.add.image", image: Vitamix.Line.System.add.image),
                IconItem(name: "Vitamix.Line.System.alert.image", image: Vitamix.Line.System.alert.image),
                IconItem(name: "Vitamix.Line.System.arrowDown.image", image: Vitamix.Line.System.arrowDown.image),
                IconItem(
                    name: "Vitamix.Line.System.arrowDownCircle.image",
                    image: Vitamix.Line.System.arrowDownCircle.image),
                IconItem(name: "Vitamix.Line.System.arrowDownS.image", image: Vitamix.Line.System.arrowDownS.image),
                IconItem(
                    name: "Vitamix.Line.System.arrowDropDown.image",
                    image: Vitamix.Line.System.arrowDropDown.image),
                IconItem(
                    name: "Vitamix.Line.System.arrowDropLeft.image",
                    image: Vitamix.Line.System.arrowDropLeft.image),
                IconItem(
                    name: "Vitamix.Line.System.arrowDropRight.image",
                    image: Vitamix.Line.System.arrowDropRight.image),
                IconItem(name: "Vitamix.Line.System.arrowDropUp.image", image: Vitamix.Line.System.arrowDropUp.image),
                IconItem(name: "Vitamix.Line.System.arrowGoBack.image", image: Vitamix.Line.System.arrowGoBack.image),
                IconItem(
                    name: "Vitamix.Line.System.arrowGoForward.image",
                    image: Vitamix.Line.System.arrowGoForward.image),
                IconItem(name: "Vitamix.Line.System.arrowLeft.image", image: Vitamix.Line.System.arrowLeft.image),
                IconItem(
                    name: "Vitamix.Line.System.arrowLeftCircle.image",
                    image: Vitamix.Line.System.arrowLeftCircle.image),
                IconItem(
                    name: "Vitamix.Line.System.arrowLeftDown.image",
                    image: Vitamix.Line.System.arrowLeftDown.image),
                IconItem(
                    name: "Vitamix.Line.System.arrowLeftRight.image",
                    image: Vitamix.Line.System.arrowLeftRight.image),
                IconItem(name: "Vitamix.Line.System.arrowLeftS.image", image: Vitamix.Line.System.arrowLeftS.image),
                IconItem(name: "Vitamix.Line.System.arrowLeftUp.image", image: Vitamix.Line.System.arrowLeftUp.image),
                IconItem(name: "Vitamix.Line.System.arrowRight.image", image: Vitamix.Line.System.arrowRight.image),
                IconItem(
                    name: "Vitamix.Line.System.arrowRightCircle.image",
                    image: Vitamix.Line.System.arrowRightCircle.image),
                IconItem(
                    name: "Vitamix.Line.System.arrowRightDown.image",
                    image: Vitamix.Line.System.arrowRightDown.image),
                IconItem(name: "Vitamix.Line.System.arrowRightS.image", image: Vitamix.Line.System.arrowRightS.image),
                IconItem(name: "Vitamix.Line.System.arrowRightUp.image", image: Vitamix.Line.System.arrowRightUp.image),
                IconItem(name: "Vitamix.Line.System.arrowUp.image", image: Vitamix.Line.System.arrowUp.image),
                IconItem(
                    name: "Vitamix.Line.System.arrowUpCircle.image",
                    image: Vitamix.Line.System.arrowUpCircle.image),
                IconItem(name: "Vitamix.Line.System.arrowUpDown.image", image: Vitamix.Line.System.arrowUpDown.image),
                IconItem(name: "Vitamix.Line.System.arrowUpS.image", image: Vitamix.Line.System.arrowUpS.image),
                IconItem(name: "Vitamix.Line.System.check.image", image: Vitamix.Line.System.check.image),
                IconItem(name: "Vitamix.Line.System.checkbox.image", image: Vitamix.Line.System.checkbox.image),
                IconItem(
                    name: "Vitamix.Line.System.checkboxBlank.image",
                    image: Vitamix.Line.System.checkboxBlank.image),
                IconItem(
                    name: "Vitamix.Line.System.checkboxBlankCircle.image",
                    image: Vitamix.Line.System.checkboxBlankCircle.image),
                IconItem(
                    name: "Vitamix.Line.System.checkboxCircle.image",
                    image: Vitamix.Line.System.checkboxCircle.image),
                IconItem(
                    name: "Vitamix.Line.System.checkboxMultiple.image",
                    image: Vitamix.Line.System.checkboxMultiple.image),
                IconItem(name: "Vitamix.Line.System.close.image", image: Vitamix.Line.System.close.image),
                IconItem(name: "Vitamix.Line.System.closeCircle.image", image: Vitamix.Line.System.closeCircle.image),
                IconItem(name: "Vitamix.Line.System.counter.image", image: Vitamix.Line.System.counter.image),
                IconItem(name: "Vitamix.Line.System.deleteBin.image", image: Vitamix.Line.System.deleteBin.image),
                IconItem(name: "Vitamix.Line.System.download.image", image: Vitamix.Line.System.download.image),
                IconItem(name: "Vitamix.Line.System.errorWarning.image", image: Vitamix.Line.System.errorWarning.image),
                IconItem(name: "Vitamix.Line.System.externalLink.image", image: Vitamix.Line.System.externalLink.image),
                IconItem(name: "Vitamix.Line.System.eye.image", image: Vitamix.Line.System.eye.image),
                IconItem(name: "Vitamix.Line.System.eyeOff.image", image: Vitamix.Line.System.eyeOff.image),
                IconItem(name: "Vitamix.Line.System.filter.image", image: Vitamix.Line.System.filter.image),
                IconItem(name: "Vitamix.Line.System.filterOff.image", image: Vitamix.Line.System.filterOff.image),
                IconItem(name: "Vitamix.Line.System.function.image", image: Vitamix.Line.System.function.image),
                IconItem(name: "Vitamix.Line.System.history.image", image: Vitamix.Line.System.history.image),
                IconItem(name: "Vitamix.Line.System.information.image", image: Vitamix.Line.System.information.image),
                IconItem(name: "Vitamix.Line.System.listSettings.image", image: Vitamix.Line.System.listSettings.image),
                IconItem(name: "Vitamix.Line.System.lock.image", image: Vitamix.Line.System.lock.image),
                IconItem(name: "Vitamix.Line.System.menu.image", image: Vitamix.Line.System.menu.image),
                IconItem(name: "Vitamix.Line.System.more.image", image: Vitamix.Line.System.more.image),
                IconItem(name: "Vitamix.Line.System.more2.image", image: Vitamix.Line.System.more2.image),
                IconItem(name: "Vitamix.Line.System.package.image", image: Vitamix.Line.System.package.image),
                IconItem(name: "Vitamix.Line.System.question.image", image: Vitamix.Line.System.question.image),
                IconItem(name: "Vitamix.Line.System.radioButton.image", image: Vitamix.Line.System.radioButton.image),
                IconItem(name: "Vitamix.Line.System.refresh.image", image: Vitamix.Line.System.refresh.image),
                IconItem(name: "Vitamix.Line.System.search.image", image: Vitamix.Line.System.search.image),
                IconItem(name: "Vitamix.Line.System.settings.image", image: Vitamix.Line.System.settings.image),
                IconItem(name: "Vitamix.Line.System.share.image", image: Vitamix.Line.System.share.image),
                IconItem(name: "Vitamix.Line.System.shieldCheck.image", image: Vitamix.Line.System.shieldCheck.image),
                IconItem(name: "Vitamix.Line.System.star.image", image: Vitamix.Line.System.star.image),
                IconItem(name: "Vitamix.Line.System.starHalf.image", image: Vitamix.Line.System.starHalf.image),
                IconItem(name: "Vitamix.Line.System.subtract.image", image: Vitamix.Line.System.subtract.image),
                IconItem(name: "Vitamix.Line.System.thumbDown.image", image: Vitamix.Line.System.thumbDown.image),
                IconItem(name: "Vitamix.Line.System.thumbUp.image", image: Vitamix.Line.System.thumbUp.image),
                IconItem(name: "Vitamix.Line.System.time.image", image: Vitamix.Line.System.time.image),
                IconItem(name: "Vitamix.Line.System.timer.image", image: Vitamix.Line.System.timer.image),
                IconItem(name: "Vitamix.Line.System.upload.image", image: Vitamix.Line.System.upload.image)
            ]),
            IconSection(name: "System - Line", items: [
                IconItem(name: "Vitamix.Fill.System.add.image", image: Vitamix.Fill.System.add.image),
                IconItem(name: "Vitamix.Fill.System.alert.image", image: Vitamix.Fill.System.alert.image),
                IconItem(name: "Vitamix.Fill.System.arrowDown.image", image: Vitamix.Fill.System.arrowDown.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowDownCircle.image",
                    image: Vitamix.Fill.System.arrowDownCircle.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowDownS.image",
                    image: Vitamix.Fill.System.arrowDownS.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowDropDown.image",
                    image: Vitamix.Fill.System.arrowDropDown.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowDropLeft.image",
                    image: Vitamix.Fill.System.arrowDropLeft.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowDropRight.image",
                    image: Vitamix.Fill.System.arrowDropRight.image),
                IconItem(name: "Vitamix.Fill.System.arrowDropUp.image", image: Vitamix.Fill.System.arrowDropUp.image),
                IconItem(name: "Vitamix.Fill.System.arrowGoBack.image", image: Vitamix.Fill.System.arrowGoBack.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowGoForward.image",
                    image: Vitamix.Fill.System.arrowGoForward.image),
                IconItem(name: "Vitamix.Fill.System.arrowLeft.image", image: Vitamix.Fill.System.arrowLeft.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowLeftCircle.image",
                    image: Vitamix.Fill.System.arrowLeftCircle.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowLeftDown.image",
                    image: Vitamix.Fill.System.arrowLeftDown.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowLeftRight.image",
                    image: Vitamix.Fill.System.arrowLeftRight.image),
                IconItem(name: "Vitamix.Fill.System.arrowLeftS.image", image: Vitamix.Fill.System.arrowLeftS.image),
                IconItem(name: "Vitamix.Fill.System.arrowLeftUp.image", image: Vitamix.Fill.System.arrowLeftUp.image),
                IconItem(name: "Vitamix.Fill.System.arrowRight.image", image: Vitamix.Fill.System.arrowRight.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowRightCircle.image",
                    image: Vitamix.Fill.System.arrowRightCircle.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowRightDown.image",
                    image: Vitamix.Fill.System.arrowRightDown.image),
                IconItem(name: "Vitamix.Fill.System.arrowRightS.image", image: Vitamix.Fill.System.arrowRightS.image),
                IconItem(name: "Vitamix.Fill.System.arrowRightUp.image", image: Vitamix.Fill.System.arrowRightUp.image),
                IconItem(name: "Vitamix.Fill.System.arrowUp.image", image: Vitamix.Fill.System.arrowUp.image),
                IconItem(
                    name: "Vitamix.Fill.System.arrowUpCircle.image",
                    image: Vitamix.Fill.System.arrowUpCircle.image),
                IconItem(name: "Vitamix.Fill.System.arrowUpDown.image", image: Vitamix.Fill.System.arrowUpDown.image),
                IconItem(name: "Vitamix.Fill.System.arrowUpS.image", image: Vitamix.Fill.System.arrowUpS.image),
                IconItem(name: "Vitamix.Fill.System.check.image", image: Vitamix.Fill.System.check.image),
                IconItem(name: "Vitamix.Fill.System.checkbox.image", image: Vitamix.Fill.System.checkbox.image),
                IconItem(
                    name: "Vitamix.Fill.System.checkboxBlank.image",
                    image: Vitamix.Fill.System.checkboxBlank.image),
                IconItem(
                    name: "Vitamix.Fill.System.checkboxBlankCircle.image",
                    image: Vitamix.Fill.System.checkboxBlankCircle.image),
                IconItem(
                    name: "Vitamix.Fill.System.checkboxCircle.image",
                    image: Vitamix.Fill.System.checkboxCircle.image),
                IconItem(
                    name: "Vitamix.Fill.System.checkboxMultiple.image",
                    image: Vitamix.Fill.System.checkboxMultiple.image),
                IconItem(name: "Vitamix.Fill.System.close.image", image: Vitamix.Fill.System.close.image),
                IconItem(name: "Vitamix.Fill.System.closeCircle.image", image: Vitamix.Fill.System.closeCircle.image),
                IconItem(name: "Vitamix.Fill.System.counter.image", image: Vitamix.Fill.System.counter.image),
                IconItem(name: "Vitamix.Fill.System.deleteBin.image", image: Vitamix.Fill.System.deleteBin.image),
                IconItem(name: "Vitamix.Fill.System.download.image", image: Vitamix.Fill.System.download.image),
                IconItem(name: "Vitamix.Fill.System.errorWarning.image", image: Vitamix.Fill.System.errorWarning.image),
                IconItem(name: "Vitamix.Fill.System.externalLink.image", image: Vitamix.Fill.System.externalLink.image),
                IconItem(name: "Vitamix.Fill.System.eye.image", image: Vitamix.Fill.System.eye.image),
                IconItem(name: "Vitamix.Fill.System.eyeOff.image", image: Vitamix.Fill.System.eyeOff.image),
                IconItem(name: "Vitamix.Fill.System.filter.image", image: Vitamix.Fill.System.filter.image),
                IconItem(name: "Vitamix.Fill.System.filterOff.image", image: Vitamix.Fill.System.filterOff.image),
                IconItem(name: "Vitamix.Fill.System.function.image", image: Vitamix.Fill.System.function.image),
                IconItem(name: "Vitamix.Fill.System.history.image", image: Vitamix.Fill.System.history.image),
                IconItem(name: "Vitamix.Fill.System.information.image", image: Vitamix.Fill.System.information.image),
                IconItem(name: "Vitamix.Fill.System.listSettings.image", image: Vitamix.Fill.System.listSettings.image),
                IconItem(name: "Vitamix.Fill.System.lock.image", image: Vitamix.Fill.System.lock.image),
                IconItem(name: "Vitamix.Fill.System.menu.image", image: Vitamix.Fill.System.menu.image),
                IconItem(name: "Vitamix.Fill.System.more.image", image: Vitamix.Fill.System.more.image),
                IconItem(name: "Vitamix.Fill.System.more2.image", image: Vitamix.Fill.System.more2.image),
                IconItem(name: "Vitamix.Fill.System.package.image", image: Vitamix.Fill.System.package.image),
                IconItem(name: "Vitamix.Fill.System.question.image", image: Vitamix.Fill.System.question.image),
                IconItem(name: "Vitamix.Fill.System.radioButton.image", image: Vitamix.Fill.System.radioButton.image),
                IconItem(name: "Vitamix.Fill.System.refresh.image", image: Vitamix.Fill.System.refresh.image),
                IconItem(name: "Vitamix.Fill.System.search.image", image: Vitamix.Fill.System.search.image),
                IconItem(name: "Vitamix.Fill.System.settings.image", image: Vitamix.Fill.System.settings.image),
                IconItem(name: "Vitamix.Fill.System.share.image", image: Vitamix.Fill.System.share.image),
                IconItem(name: "Vitamix.Fill.System.shieldCheck.image", image: Vitamix.Fill.System.shieldCheck.image),
                IconItem(name: "Vitamix.Fill.System.star.image", image: Vitamix.Fill.System.star.image),
                IconItem(name: "Vitamix.Fill.System.starHalf.image", image: Vitamix.Fill.System.starHalf.image),
                IconItem(name: "Vitamix.Fill.System.subtract.image", image: Vitamix.Fill.System.subtract.image),
                IconItem(name: "Vitamix.Fill.System.thumbDown.image", image: Vitamix.Fill.System.thumbDown.image),
                IconItem(name: "Vitamix.Fill.System.thumbUp.image", image: Vitamix.Fill.System.thumbUp.image),
                IconItem(name: "Vitamix.Fill.System.time.image", image: Vitamix.Fill.System.time.image),
                IconItem(name: "Vitamix.Fill.System.timer.image", image: Vitamix.Fill.System.timer.image),
                IconItem(name: "Vitamix.Fill.System.upload.image", image: Vitamix.Fill.System.upload.image)
            ]),
            IconSection(name: "Task - Line", items: [
                IconItem(name: "task", image: Vitamix.Line.Tasks.task.image)
            ]),
            IconSection(name: "Tasks - Fill", items: [
                IconItem(name: "task", image: Vitamix.Fill.Tasks.task.image)
            ]),
            IconSection(name: "User - Line", items: [
                IconItem(name: "Vitamix.Line.User.emotion.image", image: Vitamix.Line.User.emotion.image),
                IconItem(name: "Vitamix.Line.User.emotionLaugh.image", image: Vitamix.Line.User.emotionLaugh.image),
                IconItem(name: "Vitamix.Line.User.emotionNormal.image", image: Vitamix.Line.User.emotionNormal.image),
                IconItem(name: "Vitamix.Line.User.emotionSad.image", image: Vitamix.Line.User.emotionSad.image),
                IconItem(name: "Vitamix.Line.User.emotionUnhappy.image", image: Vitamix.Line.User.emotionUnhappy.image),
                IconItem(name: "Vitamix.Line.User.group.image", image: Vitamix.Line.User.group.image),
                IconItem(name: "Vitamix.Line.User.user.image", image: Vitamix.Line.User.user.image)
            ]),
            IconSection(name: "User - Fill", items: [
                IconItem(name: "Vitamix.Fill.User.emotion.image", image: Vitamix.Fill.User.emotion.image),
                IconItem(name: "Vitamix.Fill.User.emotionLaugh.image", image: Vitamix.Fill.User.emotionLaugh.image),
                IconItem(name: "Vitamix.Fill.User.emotionNormal.image", image: Vitamix.Fill.User.emotionNormal.image),
                IconItem(name: "Vitamix.Fill.User.emotionSad.image", image: Vitamix.Fill.User.emotionSad.image),
                IconItem(name: "Vitamix.Fill.User.emotionUnhappy.image", image: Vitamix.Fill.User.emotionUnhappy.image),
                IconItem(name: "Vitamix.Fill.User.group.image", image: Vitamix.Fill.User.group.image),
                IconItem(name: "Vitamix.Fill.User.user.image", image: Vitamix.Fill.User.user.image)
            ]),
            IconSection(name: "Weather - Line", items: [
                IconItem(name: "Vitamix.Line.Weather.cloud.image", image: Vitamix.Line.Weather.cloud.image),
                IconItem(name: "Vitamix.Line.Weather.cloudWindy.image", image: Vitamix.Line.Weather.cloudWindy.image),
                IconItem(name: "Vitamix.Line.Weather.fire.image", image: Vitamix.Line.Weather.fire.image),
                IconItem(name: "Vitamix.Line.Weather.flashlight.image", image: Vitamix.Line.Weather.flashlight.image),
                IconItem(name: "Vitamix.Line.Weather.foggy.image", image: Vitamix.Line.Weather.foggy.image),
                IconItem(name: "Vitamix.Line.Weather.hail.image", image: Vitamix.Line.Weather.hail.image),
                IconItem(name: "Vitamix.Line.Weather.mist.image", image: Vitamix.Line.Weather.mist.image),
                IconItem(name: "Vitamix.Line.Weather.moonCloudy.image", image: Vitamix.Line.Weather.moonCloudy.image),
                IconItem(name: "Vitamix.Line.Weather.moon.image", image: Vitamix.Line.Weather.moon.image),
                IconItem(name: "Vitamix.Line.Weather.rainy.image", image: Vitamix.Line.Weather.rainy.image),
                IconItem(name: "Vitamix.Line.Weather.showers.image", image: Vitamix.Line.Weather.showers.image),
                IconItem(name: "Vitamix.Line.Weather.snowy.image", image: Vitamix.Line.Weather.snowy.image),
                IconItem(name: "Vitamix.Line.Weather.sun.image", image: Vitamix.Line.Weather.sun.image),
                IconItem(name: "Vitamix.Line.Weather.sunCloudy.image", image: Vitamix.Line.Weather.sunCloudy.image),
                IconItem(name: "Vitamix.Line.Weather.tempCold.image", image: Vitamix.Line.Weather.tempCold.image),
                IconItem(name: "Vitamix.Line.Weather.tempHot.image", image: Vitamix.Line.Weather.tempHot.image),
                IconItem(
                    name: "Vitamix.Line.Weather.thunderstorms.image",
                    image: Vitamix.Line.Weather.thunderstorms.image),
                IconItem(
                    name: "Vitamix.Line.Weather.windy.image",
                    image: Vitamix.Line.Weather.windy.image)
            ]),
            IconSection(name: "Weather - Fill", items: [
                IconItem(name: "Vitamix.Fill.Weather.cloud.image", image: Vitamix.Fill.Weather.cloud.image),
                IconItem(name: "Vitamix.Fill.Weather.cloudWindy.image", image: Vitamix.Fill.Weather.cloudWindy.image),
                IconItem(name: "Vitamix.Fill.Weather.fire.image", image: Vitamix.Fill.Weather.fire.image),
                IconItem(name: "Vitamix.Fill.Weather.flashlight.image", image: Vitamix.Fill.Weather.flashlight.image),
                IconItem(name: "Vitamix.Fill.Weather.foggy.image", image: Vitamix.Fill.Weather.foggy.image),
                IconItem(name: "Vitamix.Fill.Weather.hail.image", image: Vitamix.Fill.Weather.hail.image),
                IconItem(name: "Vitamix.Fill.Weather.mist.image", image: Vitamix.Fill.Weather.mist.image),
                IconItem(name: "Vitamix.Fill.Weather.moonCloudy.image", image: Vitamix.Fill.Weather.moonCloudy.image),
                IconItem(name: "Vitamix.Fill.Weather.moon.image", image: Vitamix.Fill.Weather.moon.image),
                IconItem(name: "Vitamix.Fill.Weather.rainy.image", image: Vitamix.Fill.Weather.rainy.image),
                IconItem(name: "Vitamix.Fill.Weather.showers.image", image: Vitamix.Fill.Weather.showers.image),
                IconItem(name: "Vitamix.Fill.Weather.snowy.image", image: Vitamix.Fill.Weather.snowy.image),
                IconItem(name: "Vitamix.Fill.Weather.sun.image", image: Vitamix.Fill.Weather.sun.image),
                IconItem(name: "Vitamix.Fill.Weather.sunCloudy.image", image: Vitamix.Fill.Weather.sunCloudy.image),
                IconItem(name: "Vitamix.Fill.Weather.tempCold.image", image: Vitamix.Fill.Weather.tempCold.image),
                IconItem(name: "Vitamix.Fill.Weather.tempHot.image", image: Vitamix.Fill.Weather.tempHot.image),
                IconItem(
                    name: "Vitamix.Fill.Weather.thunderstorms.image",
                    image: Vitamix.Fill.Weather.thunderstorms.image),
                IconItem(name: "Vitamix.Fill.Weather.windy.image", image: Vitamix.Fill.Weather.windy.image)
            ])
        ]
        return tempSections
    }
}
