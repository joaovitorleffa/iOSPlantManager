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
    
    override func setUp() {
        super.setUp()
        coreDataStack = CoreDataTestStack()
        userManager = UserManager(mainContext: coreDataStack.mainContext)
        presenter = GreetingPresenter(userManager: userManager)
    }

    func test_hasUser_shouldBeReturnTrue() {
        userManager.createUser(name: "João", profileImageUrl: "")
        
        let hasUserData = presenter.hasUserData()
    
        XCTAssertTrue(hasUserData)
    }
    
    func test_hasUser_shouldBeReturnFalse() {
        let hasUserData = presenter.hasUserData()
        
        XCTAssertFalse(hasUserData)
    }
}
