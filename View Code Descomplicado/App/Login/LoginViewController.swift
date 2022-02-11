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
        self.loginScreen = LoginViewScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

