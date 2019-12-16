//
//  UInt64+megabytes.swift
//  iddog
//
//  Created by Cesar Paiva on 14/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

extension UInt64 {

    func megabytes() -> UInt64 {
        return self * 1024 * 1024
    }

}
