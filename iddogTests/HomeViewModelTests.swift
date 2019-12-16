//
//  HomeViewModelTests.swift
//  iddogTests
//
//  Created by Cesar Paiva on 15/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest
@testable import iddog

class HomeViewModelTests: XCTestCase {
    
    fileprivate var apiService: MockApiService!
    fileprivate var sut: HomeViewModel!
    fileprivate var category: String?

    override func setUp() {
        super.setUp()
        sut = HomeViewModel()
    }

    override func tearDown() {
        super.tearDown()
        apiService = nil
        sut = nil
    }

}

// MARK: initialization tests
extension HomeViewModelTests {
    
    func testInit_ShouldInstantiateApiService() {
        XCTAssertNotNil(sut.apiService)
    }
    
    func testInit_ShouldInstantiateCoreDataService() {
        XCTAssertNotNil(sut.coreDataService)
    }
    
    func testInit_ShouldInstantiateImageCache() {
        XCTAssertNotNil(sut.imageCache)
    }
    
}

// MARK: methods tests
extension HomeViewModelTests {
    
    func testListDogs_Calls_FetchDogs_OnApiService() {
        
        let expectation = self.expectation(description: "expected fetchDogs() to be called")
        
        apiService = MockApiService()
        apiService.expectationForFetchDogs = expectation
        sut.apiService = apiService
        
        sut.listDogs(forCategory: category) { (dog, error) in
            XCTAssertNotNil(dog)
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("fetchDogs with followed error: \(error)")
            }
        }
    }
    
}
