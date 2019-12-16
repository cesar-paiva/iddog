//
//  MockHomeViewModel.swift
//  iddogTests
//
//  Created by Cesar Paiva on 15/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import AlamofireImage
import XCTest
@testable import iddog

class MockHomeViewModel: HomeViewModel {
    
    var listDogsExpectation: XCTestExpectation?
    var cachedImageExpectation: XCTestExpectation?
    var downloadExpectation: XCTestExpectation?
    
    override func listDogs(forCategory category: String?, completion: @escaping ([String]?, Error?) -> ()) {
        completion(["teste"], nil)
        listDogsExpectation?.fulfill()
    }

    override func cachedImage(forURL url: String) -> Image? {
        if !url.isEmpty {
            cachedImageExpectation?.fulfill()
            return Image()
        }
        return nil
    }
    
    override func download(forURL url: String, completion: @escaping (Image) -> ()) {
        downloadExpectation?.fulfill()
        completion(Image())
    }
    

}
