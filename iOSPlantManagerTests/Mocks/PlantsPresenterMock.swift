//
//  PlantsPresenterMock.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 24/02/22.
//

import Foundation
@testable import iOSPlantManager

class PlantsPresenterMock {
    private(set) var viewDidLoadedCalled = false
    private(set) var userModelCalled = false
    private(set) var environmentModelCalledWith: IndexPath?
    private(set) var plantModelCalledWith: IndexPath?
    private(set) var numberOfItensInSectionCalledWith: Int?
    private(set) var didSelectItemWith: IndexPath?
}

extension PlantsPresenterMock: PlantsPresenterProtocol {
    func viewDidLoaded() {
        viewDidLoadedCalled = true
    }
    
    func userModel() -> User {
        userModelCalled = true
        return User()
    }
    
    func environmentModel(indexPath: IndexPath) -> (environment: PlantEnvironment, isSelected: Bool) {
        environmentModelCalledWith = indexPath
        return (PlantEnvironment.mock().first!, false)
    }
    
    func plantModel(indexPath: IndexPath) -> Plant {
        plantModelCalledWith = indexPath
        return Plant.plantBalconyMock()
    }
    
    func numberOfItensInSection(section: Int) -> Int {
        numberOfItensInSectionCalledWith = section
        return 0
    }
    
    func didSelectItem(indexPath: IndexPath) {
        didSelectItemWith = indexPath
    }
}
