//
//  LoginViewModel.swift
//  iddog
//
//  Created by Cesar Paiva on 09/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    //Variables
    weak var view: LoginViewControllerProtocol?
    var emailValidator: EmailValidator?
    var passwordValidator: PasswordValidator?
    var emailValidated: Bool
    var passwordValidated: Bool
    var loginController: LoginController?
    
    init(view: LoginViewControllerProtocol) {
        self.view = view
        emailValidated = false
        passwordValidated = false
    }
    
    func performInitialViewSetup() {
        view?.clearEmailTextField()
        view?.clearPasswordTextField()
        view?.enableLoginButton(false)
    }
    
    func login(email: String?, password: String?) {
        
        let loginController = self.loginController ?? LoginController(delegate: self)
        
        if let email = email, let password = password {
            
            let model = LoginModel(email: email, password: password)
            
            loginController.doLogin(withModel: model)

        }
    }
    
    func emailDidEndOnExit(){
        view?.hideKeyboard()
    }
    
    func passwordDidEndOnExit() {
        view?.hideKeyboard()
    }
    
    func emailUpdated(_ value:String?) {
        
        guard let value = value else {
            view?.enableLoginButton(false)
            return
        }
        
        let validator = emailValidator ?? EmailValidator()
        emailValidated = validator.validate(value)
        
        if emailValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        if passwordValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        view?.enableLoginButton(true)
        
    }
    
    func passwordUpdated(_ value:String?) {
        
        guard let value = value else {
            view?.enableLoginButton(false)
            return
        }
        
        let validator = passwordValidator ?? PasswordValidator()
        passwordValidated = validator.validate(value)
        
        if emailValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        if passwordValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        view?.enableLoginButton(true)
    }
    
}

extension LoginViewModel: LoginControllerDelegate {
    
    func loginResult(result: Bool) {
        if result {
            view?.login()
        } else {
            view?.showErrorMessage()
        }
    }
    
}


