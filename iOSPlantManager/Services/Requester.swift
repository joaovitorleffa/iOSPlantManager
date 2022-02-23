//
//  Requester.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation
import Combine

typealias RequestCallback<T> = (Result<T, APIError>) -> Void

protocol APIProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping RequestCallback<T>)
}

enum APIError: Error {
    case invalidResponse
    case invalidUrl
    case decodeError
    case invalidData
}

enum Endpoint: String {
    private var baseUrl: String { "http://127.0.0.1:3000" }
    
    case plants = "/plants"
    case environments = "/plants_environments"
    
    var url: URL {
        URL(string: baseUrl + self.rawValue)!
    }
}

struct Requester: APIProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping RequestCallback<T>) {
        URLSession.shared.dataTask(with: endpoint.url) { data, _, error in
            guard error == nil else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            let decodificador = JSONDecoder()
            
            do {
                let resData = try decodificador.decode(T.self, from: data)
                completion(.success(resData))
            } catch {
                print(error)
                completion(.failure(.decodeError))
            }
        }.resume()
    }
}
