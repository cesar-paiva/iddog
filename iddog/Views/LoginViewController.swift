//
//  LoginViewController.swift
//  iddog
//
//  Created by Cesar Paiva on 09/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 4.0
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        
        if viewModel == nil {
            viewModel = LoginViewModel(view: self)
        }

        viewModel?.performInitialViewSetup()
    }


    @IBAction func login(_ sender: Any) {
        viewModel?.login(email: emailTextField.text, password: passwordTextField.text)
    }
    
    @IBAction func emailDidEndOnExit(_ sender: Any) {
        viewModel?.emailDidEndOnExit()
    }
    
    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        viewModel?.passwordDidEndOnExit()
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == emailTextField {
            viewModel?.emailUpdated(textField.text)
        }
        
        if textField == passwordTextField {
            viewModel?.passwordUpdated(textField.text)
        }
        
        return true
    }
    
}

extension LoginViewController: LoginViewControllerProtocol {
    
    func clearEmailTextField() {
        emailTextField.text?.removeAll()
    }
    
    func clearPasswordTextField() {
        passwordTextField.text?.removeAll()
    }
    
    func enableLoginButton(_ status: Bool) {
        let alpha: CGFloat = status ? 1.0 : 0.5
        loginButton.isEnabled = status
        loginButton.alpha = alpha
    }
    
    func hideKeyboard() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    func login() {
        
    }
    
    func showErrorMessage() {
        errorMessageLabel.isHidden = false
    }
    
}

