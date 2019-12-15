//
//  HomeViewModel.swift
//  iddog
//
//  Created by Cesar Paiva on 14/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class HomeViewModel {
    
    private lazy var apiService = ApiService()
    private var coreDataService = CoreDataService()

    func listDogs(forCategory category: String?, completion :@escaping ([String]?, Error?) -> ()) {
        
        self.apiService.fetchDogs(forCategory: category, completion: { (dog, error) in
            completion(dog, error)
        })
        
    }
    
    func getToken() -> String? {
        
        let logins = coreDataService.fetchToken()
        
        return logins.last?.token
    }
    
    func downloadAndCacheImage(forURL url: String, completion: @escaping(UIImage) -> ()) {
        
        apiService.downloadAndCacheImage(withURL: url) { image in
            completion(image)
        }
        
    }
    
}
