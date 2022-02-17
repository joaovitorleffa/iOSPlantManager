//
//  Requester.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidResponse
    case invalidUrl
    case decodeError
}

enum Endpoint: String {
    private var baseUrl: String { "http://127.0.0.1:3000" }
    
    case plants = "/plants"
    
    var url: URL {
        URL(string: baseUrl + self.rawValue)!
    }
}

struct Requester {
    func request<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, APIError> {
        return URLSession.shared.dataTaskPublisher(for: endpoint.url)
            .tryMap { result in
                guard let httpUrlResponse = result.response as? HTTPURLResponse, 200..<300 ~= httpUrlResponse.statusCode else {
                    throw APIError.invalidResponse
                }
                
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                return APIError.decodeError
            }
            .eraseToAnyPublisher()
    }
}
