//
//  AddPlantPresenterTests.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 23/02/22.
//

import XCTest
@testable import iOSPlantManager

class AddPlantPresenterTests: XCTestCase {

    var view: AddPlantViewMock = AddPlantViewMock()
    var coreDataStack: CoreDataTestStack = CoreDataTestStack()
    lazy var plantManager: MyPlantManager = MyPlantManager(mainContext: coreDataStack.mainContext)
    lazy var presenter: AddPlantPresenter = AddPlantPresenter(view: view, myPlantManager: plantManager)
    
    func test_addPlant() {
        let plant = Plant.plantLivingRoomMock()
        
        presenter.addPlant(plant)
        let savedPlant = plantManager.fetchMyPlants()
    
        XCTAssertNotNil(savedPlant?.first)
    }
    
    func test_didChangeSelectedDate() {
        let date = Date.now
        presenter.didChangeSelectedDate(date)
        
        XCTAssertEqual(presenter.selectedDate, date)
    }
}
