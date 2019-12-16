//
//  MockApiService.swift
//  iddogTests
//
//  Created by Cesar Paiva on 15/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import XCTest
@testable import iddog

class MockApiService: ApiService {
    
    var expectationForFetchDogs: XCTestExpectation?
    
    override func fetchDogs(forCategory category: String?, completion: @escaping ([String]?, Error?) -> Void) {
        expectationForFetchDogs?.fulfill()
        completion(["teste"], nil)
    }
    
}
