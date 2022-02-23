//
//  PlantEnvironment.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation

struct PlantEnvironment: Decodable, Equatable {
    let key: PlantEnvironmentKey
    let title: String
}

enum PlantEnvironmentKey: String, Decodable, Equatable {
    case living_room
    case bedroom
    case kitchen
    case bathroom
    case balcony
}
