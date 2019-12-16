//
//  HomeViewControllerTests.swift
//  iddogTests
//
//  Created by Cesar Paiva on 15/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest
@testable import iddog

class HomeViewControllerTests: XCTestCase {
    
    fileprivate var sut: HomeViewController!
    fileprivate var viewModel: MockHomeViewModel!

    override func setUp() {
        super.setUp()
        sut = HomeViewController()
        viewModel = MockHomeViewModel()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        viewModel = nil
    }

    func testViewDidLoad_Calls_ListDogs_OnViewModel() {
        
        let expectation = self.expectation(description: "expected listDogs() to be called")

        let activityIndicatorStub = UIActivityIndicatorViewStub()
        let collectionViewStub = UICollectionViewStub()
        
        viewModel.listDogsExpectation = expectation
        
        sut.activityIndicator = activityIndicatorStub
        sut.collectionView = collectionViewStub
        sut.viewModel = viewModel
        sut.viewDidLoad()
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
    func testViewDidLoad_Calls_ListDogs_StopActivityIndicator_OnViewController() {
        
        let expectation = self.expectation(description: "expected listDogs() to be called")

        let activityIndicatorStub = UIActivityIndicatorViewStub()
        let collectionViewStub = UICollectionViewStub()
        
        viewModel.listDogsExpectation = expectation
        
        sut.activityIndicator = activityIndicatorStub
        sut.collectionView = collectionViewStub
        sut.viewModel = viewModel
        sut.viewDidLoad()
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
        XCTAssertFalse(sut.activityIndicator.isAnimating)
    }
    
    func testDogBreedValueChange_Calls_ListDogs_OnViewModel() {
        
        let expectation = self.expectation(description: "expected listDogs() to be called")

        let activityIndicatorStub = UIActivityIndicatorViewStub()
        let collectionViewStub = UICollectionViewStub()
        let segmentedControlStub = UISegmentedControlStub()
        segmentedControlStub.insertSegment(withTitle: "teste", at: 0, animated: false)
        segmentedControlStub.selectedSegmentIndex = 0
        
        viewModel.listDogsExpectation = expectation
        
        sut.activityIndicator = activityIndicatorStub
        sut.collectionView = collectionViewStub
        sut.segmentedControl = segmentedControlStub
        sut.viewModel = viewModel
        sut.dogBreedValueChanged(segmentedControlStub)
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }

}
