//
//  TabbarController.swift
//  navigation
//
//  Created by Pavel Almin on 03.11.2022.
//

import UIKit

class TabbarController: UITabBarController {

    var firstTabNavigationController : UINavigationController!
    var secondTabNavigationController : UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        firstTabNavigationController = UINavigationController.init(rootViewController: ProfileViewController())
        secondTabNavigationController = UINavigationController.init(rootViewController: FeedViewController())

        self.viewControllers = [firstTabNavigationController, secondTabNavigationController]

        let item1 = UITabBarItem(title: "Home", image: UIImage(systemName: "folder"), tag: 0)
        let item2 = UITabBarItem(title: "Error", image: UIImage(systemName: "folder.fill"), tag: 1)

        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationController.tabBarItem = item2

        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 146/255.0, blue: 458/255.0, alpha: 1.0)
        UITabBar.appearance().backgroundColor = .gray
    }
}
