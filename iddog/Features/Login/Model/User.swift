//
//  User.swift
//  iddog
//
//  Created by Cesar Paiva on 12/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

struct UserResponse: Codable {
    
    let user: User
    
}

struct User: Codable {
    
    let id: String
    let token: String
    let createdAt: String
    let updatedAt: String
    let v: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case token = "token"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case v = "__v"
    }
    
}
