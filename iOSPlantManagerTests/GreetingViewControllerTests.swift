//
//  GreetingViewControllerTests.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 24/02/22.
//

import XCTest
@testable import iOSPlantManager

class GreetingViewControllerTests: XCTestCase {

    var presenter: GreetingPresenterMock!
    var sut: GreetingViewController!
    
    override func setUp() {
        let navigationController = UINavigationController()
        sut = GreetingViewController()
        navigationController.viewControllers = [sut]
        presenter = GreetingPresenterMock()
        sut.presenter = presenter
        sut.loadViewIfNeeded()
    }

    func test_viewDidLoadCalled_onViewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(presenter.viewDidLoadedCalled)
    }
    
    func test_renderNavigationControllerProps() {
        sut.viewDidLoad()
        
        XCTAssertEqual(sut.navigationController?.navigationBar.isHidden, true)
    }
}
