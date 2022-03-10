//
//  Vitamin iOS
//  Apache License 2.0
//

import UIKit
import SwiftUI

final class MainTabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupSwiftUITab()
    }

    private func setupSwiftUITab() {
        if #available(iOS 13.0.0, *) {
            let hostingController = UIHostingController(rootView: MainView())
            let icon = UITabBarItem(title: "SwiftUI", image: nil, selectedImage: nil)
            hostingController.tabBarItem = icon
            self.viewControllers?.append(hostingController)
        }
    }
}
