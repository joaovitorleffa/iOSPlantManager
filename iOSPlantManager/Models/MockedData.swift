//
//  MockedData.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation
//{ "key": "living_room", "title": "Sala" },
//    { "key": "bedroom", "title": "Quarto" },
//    { "key": "kitchen", "title": "Cozinha" },
//    { "key": "bathroom", "title": "Banheiro" },
//    { "key": "balcony", "title": "Varanda" }

extension PlantEnvironment {
    static func mock() -> [PlantEnvironment] {
        [
            PlantEnvironment(key: .living_room, title: "Sala"),
            PlantEnvironment(key: .bedroom, title: "Quarto"),
            PlantEnvironment(key: .kitchen, title: "Cozinha"),
            PlantEnvironment(key: .bathroom, title: "Banheiro"),
            PlantEnvironment(key: .balcony, title: "Varanda")
        ]
    }
    
    
}
