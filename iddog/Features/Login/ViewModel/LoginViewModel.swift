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
    var emailValidated: Bool
    var apiService: ApiService?
    var user: User?
    private var coreDataService = CoreDataService()
    
    init(view: LoginViewControllerProtocol) {
        self.view = view
        emailValidated = false
        apiService = ApiService()
    }
    
    func performInitialViewSetup() {
        view?.clearEmailTextField()
        view?.enableLoginButton(false)
    }
    
    func login(email: String?, completion :@escaping (User?, Error?) -> ()) {
        
        if let email = email {
            
            self.apiService?.signup(withEmail: email, completion: { (user, error) in
                completion(user, error)
            })

        }
    }
    
    func emailDidEndOnExit(){
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

        view?.enableLoginButton(true)
        
    }
    
    func save(token: String) {
        coreDataService.save(token: token)
    }
    
    func fetchToken() -> String {

        let logins = coreDataService.fetchToken()
        return logins.last?.token ?? String()

    }
    
}


