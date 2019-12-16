//
//  HomeViewModel.swift
//  iddog
//
//  Created by Cesar Paiva on 14/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import AlamofireImage

class HomeViewModel {
    
    lazy var apiService = ApiService()
    lazy var coreDataService = CoreDataService()
    
    let imageCache = AutoPurgingImageCache(
        memoryCapacity: UInt64(100).megabytes(),
        preferredMemoryUsageAfterPurge: UInt64(60).megabytes()
    )

    func listDogs(forCategory category: String?, completion :@escaping ([String]?, Error?) -> ()) {
        
        self.apiService.fetchDogs(forCategory: category, completion: { (dog, error) in
            completion(dog, error)
        })
        
    }
    
    func getToken() -> String? {
        
        let logins = coreDataService.fetchToken()
        
        return logins.last?.token
    }
    
    func download(forURL url: String, completion: @escaping(Image) -> ()) {
        
        apiService.download(withURL: url) { image in
            completion(image)
            self.cache(image, forURL: url)
        }
        
    }
    
    func cache(_ image: Image, forURL url: String) {
        imageCache.add(image, withIdentifier: url)
    }
    
    func cachedImage(forURL url: String) -> Image? {
        return imageCache.image(withIdentifier: url)
    }
    
}
