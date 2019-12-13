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
    var emailUpdatedExpectation: (XCTestExpectation, expectedValue: String)?
    var loginExpectation: (XCTestExpectation, expectedEmail: String)?
    
    override func performInitialViewSetup() {
        performInitialViewSetupExpectation?.fulfill()
    }
    
    override func emailDidEndOnExit() {
        emailDidOnExitExpectation?.fulfill()
    }

    override func emailUpdated(_ value: String?) {
        if let (expectation, expectedValue) = emailUpdatedExpectation, let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
}

