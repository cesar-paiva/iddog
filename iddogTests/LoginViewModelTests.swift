//
//  LoginViewModelTests.swift
//  iddogTests
//
//  Created by Cesar Paiva on 10/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest

@testable import iddog

class LoginViewModelTests: XCTestCase {
    
    fileprivate var mockLoginViewController: MockLoginViewController!
    fileprivate var sut: LoginViewModel!
    fileprivate var validEmail = "developer@idwall.co"
    fileprivate var invalidEmail = "idWall"

    override func setUp() {
        super.setUp()
        mockLoginViewController = MockLoginViewController()
        sut = LoginViewModel(view: mockLoginViewController!)
    }

    override func tearDown() {
        super.tearDown()
        mockLoginViewController = nil
        sut = nil
    }

}

// MARK: initialization tests
extension LoginViewModelTests {
    
    func testInit_ValidView_InstantiatesObject() {
        
        
        XCTAssertNotNil(sut)
    }
    
    func testInit_ValidView_CopiesViewToIvar() {
        
        
        if let lhs = mockLoginViewController, let rhs = sut.view as? MockLoginViewController {
            XCTAssertTrue(lhs === rhs)
        }
        
    }

}

// MARK: performInitialViewSetup tests
extension LoginViewModelTests {
    
    func testPerformInitialViewSetup_Calls_ClearEmailField_OnViewController() {

        let expectation = self.expectation(description: "expected clearEmailField() to be called")
        mockLoginViewController!.expectationForClearEmailField = expectation

        sut.performInitialViewSetup()

        waitForExpectations(timeout: 1.0, handler: nil)

    }
    
    func testPerformInitialViewSetup_Calls_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLoginButton(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        
        sut.performInitialViewSetup()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

}

// MARK: didEndOnExit tests
extension LoginViewModelTests {
    
    func testEmailDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockLoginViewController!.expectationForHideKeyboard = expectation
        
        sut.emailDidEndOnExit()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}

// MARK: emailUpdated tests
extension LoginViewModelTests {
    
    func testEmailUpdated_Calls_Validate_OnEmailValidator() {
        
        let expectation = self.expectation(description: "expected validate() to be called")
        
        sut.emailValidator = MockEmailValidator(expectation, expectedValue: validEmail)
        sut.emailUpdated(validEmail)
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
    func testEmailUpdated_ValidEmail_EnablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(true) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, true)
        
        sut.emailUpdated(validEmail)
        
        waitForExpectations(timeout: 1.0, handler: nil)

    }
    
    func testEmailUpdated_InvalidEmail_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, false)
        
        sut.emailUpdated(invalidEmail)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}
