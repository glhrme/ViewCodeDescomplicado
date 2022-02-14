//
//  LoginViewScreen.swift
//  View Code Descomplicado
//
//  Created by Guilherme de Assis dos Santos on 10/02/22.
//

import UIKit
import UIKitLivePreview

protocol LoginViewScreenDelegate:class {
    func actionLoginButton()
}

class LoginViewScreen: UIView {
    
    weak var delegate: LoginViewScreenDelegate?
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = UIColor(named: "primary")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    lazy var logoImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage.init(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var emailTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        textField.backgroundColor =  UIColor(named: "primary")
        textField.borderStyle = .roundedRect
        textField.placeholder = "Digite o seu e-mail"
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor(named: "primary")
        textField.borderStyle = .roundedRect
        textField.placeholder = "Digite a sua senha"
        return textField
    }()
    
    lazy var buttonSigin: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor(named: "secondary"), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "primary")
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    init(delegate: LoginViewScreenDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.configSuperView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View configuration
    private func configSuperView() {
        self.addSubview(loginLabel)
        self.addSubview(logoImageView)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(buttonSigin)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                 constant: 16),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.logoImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 16),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 180),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 24),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,  constant: -16),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
    
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 8),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,  constant: -16),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 45),

            self.buttonSigin.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 16),
            self.buttonSigin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.buttonSigin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.buttonSigin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.buttonSigin.heightAnchor.constraint(equalToConstant: 45)
            
        ])
    }
    
    //MARK: - Methods
    
    func configTextFieldDelegate(_ delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc
    func buttonPressed() {
        self.delegate?.actionLoginButton()
    }
}

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
struct MyViewController_Preview: PreviewProvider {
    static var previews: some View {
        LoginViewController()
            .preview()
            .device(.iPhoneSE_2ndGen)
    }
}
#endif
