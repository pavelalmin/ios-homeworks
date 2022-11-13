//
//  ProfileHeaderView.swift
//  navigation
//
//  Created by Pavel Almin on 18.09.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleToFill
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.layer.masksToBounds = true
        avatarImageView.image = UIImage(named: "images.jpeg")
        return avatarImageView
    }()


    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pavel Almin"
        label.tintColor = .black
        label.textColor = UIColor(named: "customColor")
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for delivery"
        label.tintColor = .gray
        label.textColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private let setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.setTitle("Show status", for: .normal)
        button.titleLabel?.textColor = .white
        return button
    }()

    func setupShadow() {
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.masksToBounds = false
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        setStatusButton.layer.shadowPath = UIBezierPath(roundedRect: setStatusButton.bounds, cornerRadius: 4).cgPath
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow()
    }

    func addTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapOnShowStatusButton))
        setStatusButton.isUserInteractionEnabled = true
        setStatusButton.addGestureRecognizer(gesture)
    }

    @objc func tapOnShowStatusButton() {
//        print("\(String(describing: statusLabel.text))")
        print("\(String(describing: statusLabel.text ?? "defaultValue"))")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addTapGesture()
        setupLayout()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),

            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),

            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34),

            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
