//
//  LoginViewControllerTests.swift
//  iddogTests
//
//  Created by Cesar Paiva on 10/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest
@testable import iddog

class LoginViewControllerTests: XCTestCase {
    
    fileprivate var sut: LoginViewController!
    fileprivate var viewModel: MockLoginViewModel!
    fileprivate var loginButton: UIButtonStub!
    
    fileprivate var validEmail = "developer@idwall.co"

    override func setUp() {
        super.setUp()
        sut = LoginViewController()
        loginButton = UIButtonStub()
        sut.loginButton = loginButton
        viewModel = MockLoginViewModel(view: sut)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        viewModel = nil
    }

    func testViewDidLoad_Calls_PerformInitialSetup_OnViewModel() {
        
        let expectation = self.expectation(description: "expected performInitialViewSetup() to be called")


        viewModel.performInitialViewSetupExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.viewDidLoad()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailDidOnExit_Calls_EmailDidOnExit_OnViewModel() {
        
        let expectation = self.expectation(description: "expected emailDidEndOnExit() to be called")


        viewModel.emailDidOnExitExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.emailDidEndOnExit(self)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testLogin_ValidEmail_Calls_Login_OnViewModel_WithExpectedEmail() {
        
        let expectation = self.expectation(description: "expected login() to be called")
        
        let emailTextFieldStub = UITextFieldStub(text: validEmail)
        let activityIndicatorStub = UIActivityIndicatorViewStub()

        sut.emailTextField = emailTextFieldStub
        sut.activityIndicator = activityIndicatorStub

        viewModel.loginExpectation = (expectation, expectedEmail: validEmail)
        
        sut.viewModel = viewModel
        sut.login(self)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testTextFieldShouldChangeCaracters_emailTextField_Calls_EmailUpdated_OnViewModel_WithExpectedEmail() {
        
        let expectation = self.expectation(description: "expected emailUpdated() to be called")
        
        let emailTextFieldStub = UITextFieldStub(text:validEmail)

        sut.emailTextField = emailTextFieldStub

        viewModel.emailUpdatedExpectation = (expectation, expectedValue: validEmail)
        
        sut.viewModel = viewModel
        
        let _ = sut.textField(emailTextFieldStub, shouldChangeCharactersIn: NSRange(location: 0, length: 1), replacementString: "A")
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testShowErrorMessage_ShouldHideErrorMessageLabel() {
        
        let errorMessageLabelStub = UILabelStub()
        
        sut.errorMessageLabel = errorMessageLabelStub
        
        sut.showErrorMessage()
        
        XCTAssertFalse(sut.errorMessageLabel.isHidden)
        
    }

}
