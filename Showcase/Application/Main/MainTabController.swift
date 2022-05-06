//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import SwiftUI
import VitaminCore

final class MainTabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupUIKitTab()
        setupSwiftUITab()
    }

    private func setupUIKitTab() {
        if let uiKitTab = tabBar.items?.first {
            uiKitTab.title = "UIKit"
            uiKitTab.image = Vitamix.Line.Buildings.home.image
            uiKitTab.selectedImage = Vitamix.Fill.Buildings.home.image
        }
    }

    private func setupSwiftUITab() {
        if #available(iOS 13.0.0, *) {
            let hostingController = UIHostingController(rootView: MainView())
            let icon = UITabBarItem(title: "SwiftUI",
                                    image: Vitamix.Line.Business.award.image,
                                    selectedImage: Vitamix.Fill.Business.award.image)
            hostingController.tabBarItem = icon
            self.viewControllers?.append(hostingController)
        }
    }
}
