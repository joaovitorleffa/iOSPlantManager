//
//  PlantEnvironment.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation

struct PlantEnvironment: Decodable {
    let key: PlantEnvironmentKey
    let title: String
}

enum PlantEnvironmentKey: String, Decodable {
    case living_room
    case bedroom
    case kitchen
    case bathroom
    case balcony
}
