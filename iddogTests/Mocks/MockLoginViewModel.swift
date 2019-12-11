//
//  MockLoginViewModel.swift
//  iddogTests
//
//  Created by Cesar Paiva on 10/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import XCTest
@testable import iddog

class MockLoginViewModel: LoginViewModel {
    
    var performInitialViewSetupExpectation: XCTestExpectation?
    var emailDidOnExitExpectation: XCTestExpectation?
    var passwordDidOnExitExpectation: XCTestExpectation?
    var emailUpdatedExpectation: (XCTestExpectation, expectedValue: String)?
    var passwordUpdatedExpectation: (XCTestExpectation, expectedValue: String)?
    var loginExpectation: (XCTestExpectation, expectedEmail: String, expectedPassword: String)?
    
    override func performInitialViewSetup() {
        performInitialViewSetupExpectation?.fulfill()
    }
    
    override func emailDidEndOnExit() {
        emailDidOnExitExpectation?.fulfill()
    }
    
    override func passwordDidEndOnExit() {
        passwordDidOnExitExpectation?.fulfill()
    }
    
    override func emailUpdated(_ value: String?) {
        if let (expectation, expectedValue) = emailUpdatedExpectation, let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func passwordUpdated(_ value: String?) {
        if let (expectation, expectedValue) = passwordUpdatedExpectation, let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func login(email: String?, password: String?) {
        if let (expectation, expectedEmail, expectedPassword) = loginExpectation, let email = email, let password = password {
            if ((email.compare(expectedEmail) == .orderedSame) &&
                (password.compare(expectedPassword) == .orderedSame)) {
                expectation.fulfill()
            }
        }
    }
    
}

