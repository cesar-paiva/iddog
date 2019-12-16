//
//  MockHomeViewModel.swift
//  iddogTests
//
//  Created by Cesar Paiva on 15/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import XCTest
@testable import iddog

class MockHomeViewModel: HomeViewModel {
    
    var listDogsExpectation: XCTestExpectation?
    
    override func listDogs(forCategory category: String?, completion: @escaping ([String]?, Error?) -> ()) {
        completion(["teste"], nil)
        listDogsExpectation?.fulfill()
    }


}
