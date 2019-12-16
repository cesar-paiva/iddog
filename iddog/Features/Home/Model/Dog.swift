//
//  Dog.swift
//  iddog
//
//  Created by Cesar Paiva on 14/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

struct Dog: Codable {
    let category: String
    let images: [String]
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case images = "list"
    }
}
