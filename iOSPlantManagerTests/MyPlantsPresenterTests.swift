//
//  MyPlantsPresenterTests.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 23/02/22.
//

import XCTest
@testable import iOSPlantManager

class MyPlantsPresenterTests: XCTestCase {

    var view: MyPlantsViewMock!
    var coreDataStack: CoreDataTestStack!
    var plantsManager: MyPlantManager!
    var presenter: MyPlantsPresenter!
    
    override func setUp() {
        view = MyPlantsViewMock()
        coreDataStack = CoreDataTestStack()
        plantsManager = MyPlantManager(mainContext: coreDataStack.mainContext)
        presenter = MyPlantsPresenter(view: view, plantManager: plantsManager)
    }
    
    func test_loadData() {
        let calendar = Calendar.current
        let date = Date.now
        let lastDate = calendar.date(byAdding: .minute, value: 1, to: date)!
        plantsManager.savePlant(id: 1, name: "Imbé", photo: "", dateTimeNotification: lastDate)
        plantsManager.savePlant(id: 2, name: "Peperomia", photo: "", dateTimeNotification: date)
        
        presenter.loadData()
        
        XCTAssertEqual(presenter.plants.first?.id, 2)
    }

    func test_deletePlant() {
        plantsManager.savePlant(id: 1, name: "Imbé", photo: "", dateTimeNotification: Date.now)
        presenter.loadData()
        
        XCTAssertEqual(presenter.plants.first?.id, 1)

        presenter.deletePlant(id: 1)
        presenter.loadData()

        XCTAssertEqual(presenter.plants, [])
    }
    
    func test_numberOfRowsInSection() {
        plantsManager.savePlant(id: 1, name: "Imbé", photo: "", dateTimeNotification: Date.now)
        plantsManager.savePlant(id: 2, name: "Peperomia", photo: "", dateTimeNotification: Date.now)
        presenter.loadData()
        
        let numOfRows = presenter.numberOfRowsInSection()
    
        XCTAssertEqual(numOfRows, 2)
    }
    
    func test_plantModel() {
        plantsManager.savePlant(id: 1, name: "Imbé", photo: "", dateTimeNotification: Date.now)
        presenter.loadData()
        
        let model = presenter.plantModel(indexPath: .init(row: 0, section: 1))
        
        XCTAssertEqual(model.id, 1)
    }
}
