//
//  MockLoginController.swift
//  iddogTests
//
//  Created by Cesar Paiva on 10/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import XCTest
@testable import iddog

class MockLoginController: LoginController {
    
    private var expectation: XCTestExpectation?
    private var expectedEmail: String?
    private var expectedPassword: String?
    
    var shouldReturnTrueOnLogin: Bool
    
    init(_ expectation: XCTestExpectation, expectedEmail: String, expectedPassword: String) {
        self.expectation = expectation
        self.expectedEmail = expectedEmail
        self.expectedPassword = expectedPassword
        self.shouldReturnTrueOnLogin = false
        
        super.init(delegate: nil)
    }
    
    override func doLogin(withModel model: LoginModel) {
        
        if let expectation = self.expectation, let expectedEmail = self.expectedEmail, let expectedPassword = expectedPassword {
            
            if((model.email.compare(expectedEmail) == .orderedSame) && (model.password.compare(expectedPassword) == .orderedSame)) {
                expectation.fulfill()
            }
            
        }
        
        loginControllerDelegate?.loginResult(result: shouldReturnTrueOnLogin)
    }
    
}

