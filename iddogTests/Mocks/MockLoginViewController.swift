//
//  MockLoginViewController.swift
//  iddogTests
//
//  Created by Cesar Paiva on 10/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest
@testable import iddog

class MockLoginViewController: LoginViewControllerProtocol {

    var expectationForClearEmailField: XCTestExpectation?
    var expectationForEnableLoginButton: (XCTestExpectation, Bool)?
    var expectationForHideKeyboard: XCTestExpectation?

    func clearEmailTextField() {
        expectationForClearEmailField?.fulfill()
    }
    
    func enableLoginButton(_ status: Bool) {
        if let (expectation, expedtedValue) = expectationForEnableLoginButton {
            if status == expedtedValue {
                expectation.fulfill()
            }
        }
    }

    func hideKeyboard() {
        expectationForHideKeyboard?.fulfill()
    }
    
    func login() {
        
    }
    
    func showErrorMessage() {
        
    }

}

