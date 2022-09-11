//
//  InfoViewController.swift
//  navigation
//
//  Created by Pavel Almin on 10.09.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.backgroundColor = .magenta
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen

        self.view.addSubview(self.button)
        self.button.center = self.view.center
    }

    @objc private func didTapButton() {
        let vc = UIAlertController1()
        self.present(vc, animated: true)
    }
}
