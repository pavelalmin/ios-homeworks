//
//  ViewController.swift
//  navigation
//
//  Created by Pavel Almin on 10.09.2022.
//

import UIKit


var titlePost = Post(title: "БОРИСЫЧ ПРИВЕТ!")

class FeedViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow

        self.view.addSubview(self.button)
        self.button.center = self.view.center
    }

    @objc private func didTapButton() {
        let vc = PostViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

