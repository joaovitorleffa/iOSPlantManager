//
//  RequesterMock.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 23/02/22.
//

import Foundation
@testable import iOSPlantManager

class RequesterMock: APIProtocol {
    var success: Decodable?
    var error: APIError?
    
    init(success: Decodable) {
        self.success = success
    }
    
    init(error: APIError) {
        self.error = error
    }
    
    func request<T>(_ endpoint: Endpoint, completion: @escaping RequestCallback<T>) where T : Decodable {
        if let error = error {
            completion(.failure(error))
            return
        }
        
        if let data = success as? T {
            completion(.success(data))
        }
    }
    
    
}
