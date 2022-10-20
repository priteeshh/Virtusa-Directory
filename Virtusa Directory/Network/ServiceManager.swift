//
//  ServiceManager.swift
//  MVVMDemo
//
//  Created by Preeteesh Remalli on 22/11/21.
//

import Foundation

enum NetworkError: Error{
    case decoadingError
    case domainError
    case urlError
}

enum HttpMethod: String{
    case get = "GET"
    case post = "Post"
}

struct Resource<T: Codable>{
    let url : URL
    var httpMethod = HttpMethod.get
    var httpBody : Date?
    
    init(url: URL){
        self.url = url
    }
}

class WebServices{
    
    static let shared = WebServices()
    
    func load<T>(resource : Resource<T>, completion: @escaping (Result<T,NetworkError>) -> ()){
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(NetworkError.urlError))
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let res = result{
                completion(.success(res))
            }else{
                completion(.failure(NetworkError.decoadingError))
            }
        }.resume()
    }
}
