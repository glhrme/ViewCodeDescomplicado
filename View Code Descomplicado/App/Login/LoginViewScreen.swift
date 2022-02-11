//
//  LoginViewScreen.swift
//  View Code Descomplicado
//
//  Created by Guilherme de Assis dos Santos on 10/02/22.
//

import UIKit
import UIKitLivePreview

class LoginViewScreen: UIView {
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .black
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(loginLabel)
        self.addSubview(logoImageView)
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                 constant: 16),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.logoImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 16),
            //self.logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            //self.logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 180)
            
        ])
    }
}

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
struct MyViewController_Preview: PreviewProvider {
    static var previews: some View {
        LoginViewController()
            .preview()
            .device(.iPhone11)
    }
}
#endif
