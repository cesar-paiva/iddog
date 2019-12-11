//
//  PasswordValidator.swift
//  iddog
//
//  Created by Cesar Paiva on 09/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

class PasswordValidator {

    func validate(_ value:String) -> Bool {
        
        if value.compare("idWall@2019") == .orderedSame {
            return true
        }
        
        return false
        
    }

}
