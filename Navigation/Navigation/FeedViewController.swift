//
//  ViewController.swift
//  navigation
//
//  Created by Pavel Almin on 10.09.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var blackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.setTitle("Show Must Go One", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(self.pushButton1), for: .touchUpInside)
        return button
    }()

    private lazy var redButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.cornerRadius = 4
        button.setTitle("Show Must Go One", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(self.pushButton2), for: .touchUpInside)
        return button
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.frame = view.bounds
        view.distribution = .fillEqually
        view.spacing = 10
        view.backgroundColor = .lightGray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    func setupUI() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(blackButton)
        stackView.addArrangedSubview(redButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc private func pushButton1() {
        let vc = PostViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func pushButton2() {
        let vc = PostViewController()
        self.present(vc, animated: true)
    }
}


