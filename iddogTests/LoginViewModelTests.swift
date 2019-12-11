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
    fileprivate var validPassword = "idWall@2019"
    fileprivate var invalidPassword = "123"

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
    
    func testPerformInitialViewSetup_Calls_ClearPasswordField_OnViewController() {
        
        let expectation = self.expectation(description: "expected clearPasswordField() to be called")
        mockLoginViewController!.expectationForClearPasswordField = expectation
        
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
    
    func testPasswordDidOnExit_Calls_HideKeyboard_OnViewController() {
        
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockLoginViewController!.expectationForHideKeyboard = expectation
        
        sut.passwordDidEndOnExit()
        
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
    
    func testEmailUpdated_ValidEmail_PasswordValidated_EnablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(true) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, true)
        
        sut.passwordValidated = true
        sut.emailUpdated(validEmail)
        
        waitForExpectations(timeout: 1.0, handler: nil)

    }
    
    func testEmailUpdated_ValidEmail_PasswordNotValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        
        sut.passwordValidated = false
        sut.emailUpdated(validEmail)
        
        waitForExpectations(timeout: 1.0, handler: nil)

    }
    
    func testEmailUpdated_InvalidEmail_PasswordValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, false)
        
        sut.passwordValidated = true
        sut.emailUpdated(invalidEmail)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailUpdated_InvalidEmail_PasswordNotValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, false)
        
        sut.passwordValidated = false
        sut.emailUpdated(invalidEmail)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}

// MARK: passwordUpdated tests
extension LoginViewModelTests {
    
    func testPasswordUpdated_Calls_Validate_OnPasswordValidator() {
        
        let expectation = self.expectation(description: "expected validate() to be called")
        sut.passwordValidator = MockPasswordValidator(expectation, expectedValue: validPassword)
        sut.passwordUpdated(validPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_EmailValidated_EnablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(true) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, true)
        
        sut.emailValidated = true
        sut.passwordUpdated(validPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_EmailNotValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, false)
        
        sut.emailValidated = false
        sut.passwordUpdated(validPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_InvalidPassword_EmailValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, false)
        
        sut.emailValidated = true
        sut.passwordUpdated(invalidPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_InvalidPassword_EmailNotValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, false)
        
        sut.emailValidated = false
        sut.passwordUpdated(invalidPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}


// MARK: login tests
extension LoginViewModelTests {
    
    func testLogin_ValidParameters_Calls_doLogin_OnLoginController() {
        
        let expectation = self.expectation(description: "expected doLogin() to be called")
        let mockLoginController = MockLoginController(expectation, expectedEmail: validEmail, expectedPassword: validPassword)
        mockLoginController.shouldReturnTrueOnLogin = true
        
        sut.loginController = mockLoginController
        mockLoginController.loginControllerDelegate = sut
        
        sut.login(email: validEmail, password: validPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
}
