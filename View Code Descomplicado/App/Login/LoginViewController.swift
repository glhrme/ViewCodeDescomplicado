//
//  ViewController.swift
//  View Code Descomplicado
//
//  Created by Guilherme de Assis dos Santos on 10/02/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginScreen: LoginViewScreen?
    
    override func loadView() {
        self.loginScreen = LoginViewScreen(delegate: self)
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.configTextFieldDelegate(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

extension LoginViewController: LoginViewScreenDelegate {
    func actionLoginButton() {
        self.loginScreen?.emailTextField.text
    }
}

