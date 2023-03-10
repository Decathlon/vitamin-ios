//
//  Vitamin iOS
//  Apache License 2.0
//

#if arch(x86_64) || arch(arm64)
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

        if #available(iOS 15.0.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemGray6

            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance = appearance
        }

        setupUIKitTab()
        setupSwiftUITab()
    }

    private func setupUIKitTab() {
        if let uiKitTab = tabBar.items?.first {
            uiKitTab.title = "UIKit"
            uiKitTab.image = makeTabBarItemImage(image: UIImage.Vitamix.homeLine)
            uiKitTab.selectedImage = makeTabBarItemImage(image: UIImage.Vitamix.homeFill)
        }
    }

    private func setupSwiftUITab() {
        if #available(iOS 13.0.0, *) {
            let hostingController = UIHostingController(rootView: MainView())
            let icon = UITabBarItem(title: "SwiftUI",
                                    image: makeTabBarItemImage(image: UIImage.Vitamix.awardLine),
                                    selectedImage: makeTabBarItemImage(image: UIImage.Vitamix.awardFill))
            hostingController.tabBarItem = icon
            self.viewControllers?.append(hostingController)
        }
    }

    private func makeTabBarItemImage(image: UIImage) -> UIImage? {
        image.resize(CGSize(width: 23, height: 23))
    }
}
#endif
