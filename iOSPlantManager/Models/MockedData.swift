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

extension Plant {
    static func mock() -> [Plant] {
        [
            Plant(id: 1, name: "Aningapara", about: "É uma espécie tropical que tem crescimento rápido e fácil manuseio.", waterTips: "Mantenha a terra sempre húmida sem encharcar. Regue 2 vezes na semana.", photo: "https://drive.google.com/uc?id=1-JWlKTOZq4o2v--bhVfu8fyeFPTY07VK", environments: [.living_room], frequency: .init(times: 2, repeatEvery: .week)),
            Plant(id: 2, name: "Aningapara", about: "É uma espécie tropical que tem crescimento rápido e fácil manuseio.", waterTips: "Mantenha a terra sempre húmida sem encharcar. Regue 2 vezes na semana.", photo: "https://drive.google.com/uc?id=1NszcbOD9mrx1LND6tcKWpMM6TBaTOy2O", environments: [.living_room], frequency: .init(times: 2, repeatEvery: .week)),
            Plant(id: 3, name: "Aningapara", about: "É uma espécie tropical que tem crescimento rápido e fácil manuseio.", waterTips: "Mantenha a terra sempre húmida sem encharcar. Regue 2 vezes na semana.", photo: "https://storage.cloud.google.com/plantmanager/1.png", environments: [.living_room], frequency: .init(times: 2, repeatEvery: .week))
        ]
    }
}
