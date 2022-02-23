//
//  PlantsPresenterTests.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 23/02/22.
//

import XCTest
@testable import iOSPlantManager

class PlantsPresenterTests: XCTestCase {
    
    var view = PlantsViewMock()
    var coreDataStack = CoreDataTestStack()
    var API = RequesterMock(success: Plant.mock())
    lazy var userManager = UserManager(mainContext: coreDataStack.mainContext)
    lazy var presenter = PlantsPrensenter(view: view, API: API, userManager: userManager)
    
    
    func test_fetchPlants_shouldBeReturnPlants() {
        presenter.fetchPlants()
        
        XCTAssertEqual(presenter.plants, Plant.mock())
    }
    
    func test_fetchEnvironments_shouldBeReturnEnvironments() {
        API = RequesterMock(success: PlantEnvironment.mock())
        presenter.fetchEnvironmentsData()
        
        XCTAssertEqual(presenter.environments, PlantEnvironment.mock())
    }
    
    
    func test_selectedEnvironment() {
        API = RequesterMock(success: Plant.mock())
        presenter.fetchPlants()
        API = RequesterMock(success: PlantEnvironment.mock())
        presenter.fetchEnvironmentsData()
        
        XCTAssertEqual(presenter.selectedEnvironment, presenter.environments.first)
    }
    
    func test_numberOfItemsInSection() {
        presenter.environments = PlantEnvironment.mock()
        presenter.filteredPlants = Plant.mock()
        
        XCTAssertEqual(presenter.numberOfItensInSection(section: 0), 1)
        XCTAssertEqual(presenter.numberOfItensInSection(section: 1), presenter.environments.count)
        XCTAssertEqual(presenter.numberOfItensInSection(section: 2), presenter.filteredPlants.count)
    }
    
    func test_didSelectItemInEnvironmentSection() {
        presenter.environments = PlantEnvironment.mock()
        presenter.plants = Plant.mock()
        let indexPath = IndexPath(row: 0, section: 1)
        
        presenter.didSelectItem(indexPath: indexPath)
        
        XCTAssertEqual(presenter.selectedEnvironment, presenter.environments.first)
        XCTAssertEqual(presenter.filteredPlants, [Plant.plantLivingRoomMock()])
    }

    func test_didSelectItemInPlantsSection() {
        presenter.plants = Plant.mock()
        let indexPath = IndexPath(row: 0, section: 2)
        
        presenter.didSelectItem(indexPath: indexPath)
        
        XCTAssertEqual(view.plantToNavigate, presenter.plants.first)
    }
    
    func test_plantModel() {
        presenter.filteredPlants = Plant.mock()
        let indexPath = IndexPath(row: 0, section: 2)
        
        let model = presenter.plantModel(indexPath: indexPath)
        
        XCTAssertEqual(model, presenter.filteredPlants.first)
    }
    
    func test_filterPlants() {
        presenter.plants = Plant.mock()
        presenter.selectedEnvironment = PlantEnvironment.mock().first
        
        presenter.filteredPlants = presenter.filterPlants()
        
        XCTAssertEqual(presenter.filteredPlants, [Plant.plantLivingRoomMock()])
    }
}
