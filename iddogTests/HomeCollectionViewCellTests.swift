//
//  HomeCollectionViewCellTests.swift
//  iddogTests
//
//  Created by Cesar Paiva on 16/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest
@testable import iddog

class HomeCollectionViewCellTests: XCTestCase {
    
    var sut: HomeCollectionViewCell!
    
    override func setUp() {
        super.setUp()
        sut = HomeCollectionViewCell()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSetup_WithURL_Calls_CachedImage_OnViewModel() {
        
        let expectation = self.expectation(description: "expected cachedImage() to be called")
        
        let imageViewStub = UIImageViewStub()
        
        sut.imageView = imageViewStub
        
        let viewModel = MockHomeViewModel()
        viewModel.cachedImageExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.setup(withImageURL: "url")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testSetup_WithURL_Calls_Download_OnViewModel() {
        
        let expectation = self.expectation(description: "expected download() to be called")
        
        let imageViewStub = UIImageViewStub()
        
        sut.imageView = imageViewStub
        
        let viewModel = MockHomeViewModel()
        viewModel.downloadExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.setup(withImageURL: String())
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}
