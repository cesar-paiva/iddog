//
//  MockHomeCollectionViewCell.swift
//  iddogTests
//
//  Created by Cesar Paiva on 16/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import XCTest
@testable import iddog

class MockHomeCollectionViewCell: HomeCollectionViewCell {
    
    var setupExpectation:XCTestExpectation?
    
    override func setup(withImageURL url: String) {
        setupExpectation?.fulfill()
    }
    
}
