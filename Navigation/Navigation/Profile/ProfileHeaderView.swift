//
//  ProfileHeaderView.swift
//  navigation
//
//  Created by Pavel Almin on 18.09.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "images.jpeg")
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Pavel Almin"
        label.tintColor = .black
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for delivery"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let showStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.setTitle("Show status", for: .normal)
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func addTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapOnShowStatusButton))
        showStatusButton.isUserInteractionEnabled = true
        showStatusButton.addGestureRecognizer(gesture)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupLayout()
        addTapGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupLayout() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(showStatusButton)

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                               constant: 16),
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),

            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 27),
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),

            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -34),

            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            showStatusButton.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                                  constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }

    func setupShadow() {
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.layer.masksToBounds = false
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        showStatusButton.layer.shadowPath = UIBezierPath(roundedRect: showStatusButton.bounds, cornerRadius: 4).cgPath
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow()
    }

    @objc
    func tapOnShowStatusButton() {
        print("\(String(describing: statusLabel.text))")
    }
}

