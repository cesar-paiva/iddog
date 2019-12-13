//
//  LoginViewControllerProtocol.swift
//  iddog
//
//  Created by Cesar Paiva on 09/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

protocol LoginViewControllerProtocol: class {
    
    func clearEmailTextField()
    func enableLoginButton(_ status: Bool)
    func hideKeyboard()
    func showErrorMessage()

}
