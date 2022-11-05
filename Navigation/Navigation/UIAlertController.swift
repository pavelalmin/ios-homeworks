//
//  ViewController.swift
//  navigation
//
//  Created by Pavel Almin on 10.09.2022.
//

import UIKit

class UIAlertController1: UIViewController {

    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(self.didTapCloseButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPurple

        self.view.addSubview(self.closeButton)
        self.closeButton.center = self.view.center
    }

    @objc private func didTapCloseButton() {

        let alertController = UIAlertController(title: "WOW", message: "everything will be fine", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "sos", style: .default) { _ in
            print("1")
        }
        let secondAction = UIAlertAction(title: "error", style: .cancel) { _ in
            print("2")
        }
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        self.present(alertController, animated: true)
    }
}
