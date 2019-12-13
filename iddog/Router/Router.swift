//
//  Router.swift
//  iddog
//
//  Created by Cesar Paiva on 11/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

protocol Router {
    func route(to routeID: String, from context: UIViewController)
}
