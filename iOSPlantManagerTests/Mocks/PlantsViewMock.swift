//
//  PlantsViewMock.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 23/02/22.
//

import Foundation
@testable import iOSPlantManager

class PlantsViewMock {
    var plantToNavigate: Plant?
}

extension PlantsViewMock: PlantsViewProtocol {
    func reloadData() {
        
    }
    
    func navigate(with plant: Plant) {
        plantToNavigate = plant
    }
}
