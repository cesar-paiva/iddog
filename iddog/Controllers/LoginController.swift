//
//  LoginController.swift
//  iddog
//
//  Created by Cesar Paiva on 09/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

protocol LoginControllerDelegate {
    func loginResult(result: Bool)
}

class LoginController {
    
    var loginControllerDelegate: LoginControllerDelegate?
    
    init(delegate: LoginControllerDelegate?) {
        self.loginControllerDelegate = delegate
    }
    
    func doLogin(withModel login: LoginModel) {
        
        let email = login.email
        let password = login.password
        
        let emailValidator = EmailValidator()
        let passwordValidator = PasswordValidator()
        
        if emailValidator.validate(email) && passwordValidator.validate(password) {
            loginControllerDelegate?.loginResult(result: true)
        } else {
            loginControllerDelegate?.loginResult(result: false)            
        }
        
        
    }
    
}
