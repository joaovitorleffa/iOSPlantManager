//
//  Plants.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation

struct Plant: Decodable, Equatable {
    let id: Int
    let name: String
    let about: String
    let waterTips: String
    let photo: String
    let environments: [PlantEnvironmentKey]
    let frequency: Frequency
    
    enum CodingKeys: String, CodingKey, Equatable {
        case id
        case name
        case about
        case waterTips = "water_tips"
        case photo
        case environments
        case frequency
    }
    
    struct Frequency: Decodable, Equatable {
        let times: Int
        let repeatEvery: RepeatEvery
        
        enum CodingKeys: String, CodingKey {
            case times
            case repeatEvery = "repeat_every"
        }
    }
    
    enum RepeatEvery: String, Decodable, Equatable {
        case week
        case day
    }
}
