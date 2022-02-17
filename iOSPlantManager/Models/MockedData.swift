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

//"id": 1,
//      "name": "Aningapara",
//      "about": "É uma espécie tropical que tem crescimento rápido e fácil manuseio.",
//      "water_tips": "Mantenha a terra sempre húmida sem encharcar. Regue 2 vezes na semana.",
//      "photo": "https://storage.googleapis.com/golden-wind/nextlevelweek/05-plantmanager/1.svg",
//      "environments": ["living_room", "kitchen"],
//      "frequency": {
//        "times": 2,
//        "repeat_every": "week"
//      }

extension Plant {
    static func mock() -> [Plant] {
        [
            Plant(id: 1, name: "Aningapara", about: "É uma espécie tropical que tem crescimento rápido e fácil manuseio.", waterTips: "Mantenha a terra sempre húmida sem encharcar. Regue 2 vezes na semana.", photo: "https://storage.googleapis.com/golden-wind/nextlevelweek/05-plantmanager/1.svg", environments: [.living_room], frequency: .init(times: 2, repeatEvery: .week)),
            Plant(id: 2, name: "Aningapara", about: "É uma espécie tropical que tem crescimento rápido e fácil manuseio.", waterTips: "Mantenha a terra sempre húmida sem encharcar. Regue 2 vezes na semana.", photo: "https://storage.googleapis.com/golden-wind/nextlevelweek/05-plantmanager/1.svg", environments: [.living_room], frequency: .init(times: 2, repeatEvery: .week)),
            Plant(id: 3, name: "Aningapara", about: "É uma espécie tropical que tem crescimento rápido e fácil manuseio.", waterTips: "Mantenha a terra sempre húmida sem encharcar. Regue 2 vezes na semana.", photo: "https://storage.googleapis.com/golden-wind/nextlevelweek/05-plantmanager/1.svg", environments: [.living_room], frequency: .init(times: 2, repeatEvery: .week))
        ]
    }
}
