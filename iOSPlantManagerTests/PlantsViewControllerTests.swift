//
//  PlantsViewControllerTests.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 24/02/22.
//

import XCTest
@testable import iOSPlantManager

class PlantsViewControllerTests: XCTestCase {

    var presenter = PlantsPresenterMock()
    var sut: PlantsViewController!
    
    override func setUp() {
        sut = PlantsViewController()
        let tabBarControler = UITabBarController()
        sut.presenter = presenter
        tabBarControler.viewControllers = [sut]
        sut.loadViewIfNeeded()
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(presenter.viewDidLoadedCalled)
    }
}
