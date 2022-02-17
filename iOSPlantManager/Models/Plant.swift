//
//  Plants.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation

struct Plant: Decodable {
    let id: Int
    let name: String
    let about: String
    let waterTips: String
    let photo: String
    let environments: [PlantEnvironmentKey]
    let frequency: Frequency
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case about
        case waterTips = "water_tips"
        case photo
        case environments
        case frequency
    }
    
    struct Frequency: Decodable {
        let times: Int
        let repeatEvery: RepeatEvery
    }
    
    enum RepeatEvery: String, Decodable {
        case week
        case day
    }
}
