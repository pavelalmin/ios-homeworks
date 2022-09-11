//
//  PostViewController.swift
//  navigation
//
//  Created by Pavel Almin on 10.09.2022.
//

import UIKit

class PostViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        setupConstraints()
        titleLabel.text = titlePost.title

        view.backgroundColor = .blue
    }

    func setupConstraints() {
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
