//
//  LoginRouter.swift
//  iddog
//
//  Created by Cesar Paiva on 11/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class LoginRouter: Router {
    
    func route(to routeID: String, from controller: UIViewController) {
        
        guard let route = LoginViewController.LoginRoute(rawValue: routeID) else {
            return
        }
        
        switch route {
        case .home:
            if let homeViewController = controller.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") {
                controller.present(homeViewController, animated: true, completion: nil)
            }
        }
        
    }
    
    
}
