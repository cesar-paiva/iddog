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
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    enum LoginRoute: String {
        case home
    }
    
    var viewModel: LoginViewModel?
    var router: Router?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 4.0
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        
        if viewModel == nil {
            viewModel = LoginViewModel(view: self)
        }
        
        router = LoginRouter()

        viewModel?.performInitialViewSetup()
    }


    @IBAction func login(_ sender: Any) {
        
        activityIndicator.startAnimating()
        viewModel?.login(email: emailTextField.text, completion: { (user, error) in
            
            self.activityIndicator.stopAnimating()
            guard let user = user else {
                self.showErrorMessage()
                return
            }
            
            self.viewModel?.save(token: user.token)
            
            self.router?.route(to: LoginRoute.home.rawValue, from: self)
        })
    }
    
    @IBAction func emailDidEndOnExit(_ sender: Any) {
        viewModel?.emailDidEndOnExit()
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == emailTextField {
            viewModel?.emailUpdated(textField.text)
        }

        return true
    }
    
}

extension LoginViewController: LoginViewControllerProtocol {
    
    func clearEmailTextField() {
        emailTextField.text?.removeAll()
    }

    func enableLoginButton(_ status: Bool) {
        let alpha: CGFloat = status ? 1.0 : 0.5
        loginButton.isEnabled = status
        loginButton.alpha = alpha
    }
    
    func hideKeyboard() {
        emailTextField.resignFirstResponder()
    }
    
    func showErrorMessage() {
        errorMessageLabel.isHidden = false
    }
    
}

