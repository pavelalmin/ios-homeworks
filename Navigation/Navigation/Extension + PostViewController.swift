//
//  PostViewController.swift
//  navigation
//
//  Created by Pavel Almin on 10.09.2022.
//

import UIKit

extension UIViewController {


    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {

        let button = UIButton(type: .system)
        button.setImage(
            UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        button.tintColor = .systemYellow
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(self.didTapButton1), for: .touchUpInside)


        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }

    @objc private func didTapButton1() {
        let vc1 = UIAlertController1()
        self.present(vc1, animated: true)
    }

}
