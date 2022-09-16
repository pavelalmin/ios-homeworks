//
//  PostViewController.swift
//  navigation
//
//  Created by Pavel Almin on 14.09.2022.
//

import UIKit

class PostViewController: UIViewController {


    private let titleLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "First Text"
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {

        view.backgroundColor = .white

        let audioRightButton = createCustomButton(
            imageName: "phone",
           selector: #selector(audioRightButtonTapped)
        )

        navigationItem.rightBarButtonItem = audioRightButton
        titleLabel.text = titlePost.title

        setConstraints()
    }

    func setConstraints() {

        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func didTapButton() {
        let vc = UIAlertController1()
        self.present(vc, animated: true)
    }

    @objc private func audioRightButtonTapped() {
       print("audioRightButtonTapped")
    }
}
