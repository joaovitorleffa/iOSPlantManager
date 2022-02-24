//
//  GreetingPresenterTests.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 17/02/22.
//

import XCTest
@testable import iOSPlantManager

class GreetingPresenterTests: XCTestCase {

    var userManager: UserManagerProtocol!
    var coreDataStack: CoreDataTestStack!
    var presenter: GreetingPresenterProtocol!
    var view: GreetingViewMock!
    
    override func setUp() {
        super.setUp()
        coreDataStack = CoreDataTestStack()
        view = GreetingViewMock()
        userManager = UserManager(mainContext: coreDataStack.mainContext)
        presenter = GreetingPresenter(view: view, userManager: userManager)
    }
    
    func test_viewDidLoaded_shouldCallViewControllerFunc() {
        userManager.createUser(name: "João", profileImageUrl: "")
        
        presenter.viewDidLoaded()
        
        XCTAssertTrue(view.navigateToTabIsCaled)
    }
    
    func test_viewDidLoaded_shouldDontAnything() {
        presenter.viewDidLoaded()
        
        XCTAssertFalse(view.navigateToTabIsCaled)
    }
}
