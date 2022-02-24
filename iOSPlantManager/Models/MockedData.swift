//
//  MockedData.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation

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
    static func plantLivingRoomMock() -> Plant {
        Plant(id: 1, name: "Aningapara", about: "É uma espécie tropical que tem crescimento rápido e fácil manuseio.", waterTips: "Mantenha a terra sempre húmida sem encharcar. Regue 2 vezes na semana.", photo: "https://drive.google.com/uc?id=1t87KiCV_Cv1rhYmmi6b0GkTu5SQDGqDF", environments: [.living_room, .kitchen], frequency: .init(times: 2, repeatEvery: .week))
    }
    
    static func plantBedroomMock() -> Plant {
        Plant(id: 2, name: "Zamioculca", about: "Apesar de florescer na primavera, fica o ano todo bonita e verdinha.", waterTips: "Utilize vasos com furos e pedras no fundo para facilitar a drenagem. Regue 1 vez no dia.", photo: "https://drive.google.com/uc?id=1QhAhAgkguB8_9JYsGsTAKeEVjOYbOLKi", environments: [.bedroom, .living_room], frequency: .init(times: 1, repeatEvery: .day))
    }
    
    static func plantBalconyMock() -> Plant {
        Plant(id: 3, name: "Peperomia", about: "Adapta-se tanto ao sol e sombra, mas prefere ficar num cantinho fresco, sem sol direto.", waterTips: "Nos dias mais quentes borrife água nas folhas. Regue 3 vezes na semana.", photo: "ttps://drive.google.com/uc?id=1IOgLGPxwSrody6luqUN7O5cS04pLCJBn", environments: [.balcony], frequency: .init(times: 2, repeatEvery: .week))
    }
    
    static func mock() -> [Plant] {
        [
            Plant.plantLivingRoomMock(),
            Plant.plantBedroomMock(),
            Plant.plantBalconyMock()
        ]
    }
}
