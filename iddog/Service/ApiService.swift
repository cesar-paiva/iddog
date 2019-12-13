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
    
    func signup(withEmail email: String, completion :@escaping (User?, Error?) -> ()) {
        
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
    
}
