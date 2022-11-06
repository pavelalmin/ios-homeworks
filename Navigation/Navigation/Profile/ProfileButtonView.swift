//
//  ProfileButtonView.swift
//  navigation
//
//  Created by Pavel Almin on 06.11.2022.
//

import UIKit

class ProfileButtonView: UIView {

    private var setStatusNewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.setTitle("Show Must Go One", for: .normal)
        button.titleLabel?.textColor = .white
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupLayout()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        addSubview(setStatusNewButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            setStatusNewButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            setStatusNewButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            setStatusNewButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

