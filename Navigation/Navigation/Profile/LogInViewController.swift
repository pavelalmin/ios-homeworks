//
//  LogInViewController.swift
//  navigation
//
//  Created by Pavel Almin on 09.11.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.addArrangedSubview(passwordTextField)
        stackView.setCustomSpacing(16, after: passwordTextField)
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleToFill
        iconImageView.image = UIImage(named: "logo")
        return iconImageView
    }()

    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.tag = 0
        loginTextField.borderStyle = .none
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.borderWidth = 0.5
        loginTextField.layer.cornerRadius = 10
        loginTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        loginTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        loginTextField.placeholder = "Email of phone"
        loginTextField.textColor = .black
        loginTextField.autocapitalizationType = .none
        loginTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginTextField.keyboardType = .emailAddress
        loginTextField.clearButtonMode = .whileEditing
        return loginTextField
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.tag = 1
        passwordTextField.borderStyle = .none
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = .black
        passwordTextField.autocapitalizationType = .none
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return passwordTextField
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.tapOnShowStatusButton), for: .touchUpInside)
        return button
    }()

    private var login: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
        self.view.addSubview(self.iconImageView)
        self.stackView.addArrangedSubview(self.loginTextField)
        self.stackView.addArrangedSubview(self.passwordTextField)
        self.stackView.addArrangedSubview(self.button)
        setupScrollViewConstraints()
        setupIconConstraints()
        setupStackViewConstraints()
        setupGestures()
    }

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }


    @objc func tapOnShowStatusButton() {
        let vc = ProfileViewController()
        self.present(vc, animated: true)
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                         selector: #selector(self.didShowKeyboard(_:)),
                                         name: UIResponder.keyboardWillShowNotification,
                                         object: nil)
        NotificationCenter.default.addObserver(self,
                                         selector: #selector(self.didHideKeyboard(_:)),
                                         name: UIResponder.keyboardWillHideNotification,
                                         object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    func setupIconConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 120),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 150),
            stackView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor, constant: 50),
//            stackView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }

    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            let loginButtonBottomPointY = self.stackView.frame.origin.y + self.button.frame.origin.y + self.button.frame.height

            let keyboardOriginY = self.view.frame.height - keyboardHeight

            let yOffset = keyboardOriginY < loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 30
            : 0

            print("YYY \(self.stackView.frame.origin.y), \(self.loginTextField.frame.origin.y), \(self.button.frame.origin.y)")

            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }

    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }

    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }
}


extension LogInViewController: UITextViewDelegate {

    private func textFieldDidBeginEditing(_ textField: UITextField) {

    }

    private func textFieldDidEndEditing(_ textField: UITextField) {

    }

    private func textFieldDidChangeSelection(_ textField: UITextField) {
        print("YYY\(String(describing: textField.text))")
        if textField.tag == 0 {
            self.login = textField.text
        } else if textField.tag == 1 {

        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            self.passwordTextField.becomeFirstResponder()
        } else {
            self.forcedHidingKeyboard()
        }
        return true
    }
}
