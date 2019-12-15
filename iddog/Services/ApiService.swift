//
//  ApiService.swift
//  iddog
//
//  Created by Cesar Paiva on 12/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import Alamofire

class ApiService {
    
    static let shared = ApiService()
    
    private var baseURL = "https://api-iddog.idwall.co"
    
    func signup(withEmail email: String, completion :@escaping (User?, Error?) -> Void) {
        
        let url = "\(baseURL)/signup"
        let headers: HTTPHeaders = ["Content-type": "application/json"]
        let parameters: Parameters = ["email": email]

        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            switch response.result {
            case .success(_):
                guard let data = response.data else { return }
                do {
                    let jsonDecoder = JSONDecoder()
                    let response = try jsonDecoder.decode(UserResponse.self, from: data)
                    completion(response.user, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func fetchDogs(forCategory category: String?, completion :@escaping ([String]?, Error?) -> Void) {
        
        let coreDataService = CoreDataService()
        let logins = coreDataService.fetchToken()
        let error = NSError(domain: "Token is empty", code: 401, userInfo: nil)
        guard let token = logins.last?.token else { completion(nil, error); return }
        
        let url = "\(baseURL)/feed"
        let headers: HTTPHeaders = [
            "Content-type": "application/json",
            "Authorization": token
        ]
        var parameters: Parameters?
        
        if let category = category {
            parameters = ["category": category]
        }
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            
            switch response.result {
            case .success(_):
                guard let data = response.data else { return }
                do {
                    let jsonDecoder = JSONDecoder()
                    let response = try jsonDecoder.decode(Dog.self, from: data)
                    completion(response.images, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func download(withURL url: String, completion: @escaping(UIImage) -> Void) {
        
        Alamofire.request(url, method: .get).responseImage { response in
            guard let image = response.result.value else { return }
            completion(image)
        }
    }
    
    
}
