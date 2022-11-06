//
//  ProfileViewController.swift
//  navigation
//
//  Created by Pavel Almin on 18.09.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private var profileHeaderView: ProfileHeaderView = {
        let headerView = ProfileHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()

    private var profileButtonView: ProfileButtonView = {
        let buttonView = ProfileButtonView()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        return buttonView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
    }

    func setupLayout() {
        self.view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        view.addSubview(profileButtonView)
    }


    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            profileButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

