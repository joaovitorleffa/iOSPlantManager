//
//  UserIdentificationPresenter.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 16/02/22.
//

import XCTest
@testable import iOSPlantManager

class UserIdentificationPresenterTests: XCTestCase {

    var userManager: UserManager!
    var coreDataStack: CoreDataTestStack!
    var presenter: UserIdentificationPresenterProtocol!
    
    override func setUp() {
        super.setUp()
        coreDataStack = CoreDataTestStack()
        userManager = UserManager(mainContext: coreDataStack.mainContext)
        presenter = UserIdentificationPresenter(view: UserIdentificationViewMock(), userManager: userManager)
    }
    
    func test_add_user() {
        presenter.onChangeName(text: "João")
        presenter.saveName()
        
        let user = userManager.fetchUser()
        
        XCTAssertEqual("João", user?.name)
    }

}
